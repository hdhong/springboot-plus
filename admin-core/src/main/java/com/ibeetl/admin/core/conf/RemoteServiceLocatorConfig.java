package com.ibeetl.admin.core.conf;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.x.discovery.ServiceDiscovery;
import org.apache.curator.x.discovery.ServiceDiscoveryBuilder;
import org.apache.curator.x.discovery.ServiceInstance;
import org.apache.curator.x.discovery.ServiceInstanceBuilder;
import org.apache.curator.x.discovery.details.JsonInstanceSerializer;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import com.ibeetl.admin.core.service.CoreServiceLocator;
import com.ibeetl.admin.core.util.PlatformException;

@Configuration
public class RemoteServiceLocatorConfig {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Configuration
	@ConditionalOnProperty(name = "zookeeper.enabled", havingValue = "true")
	class ZkConfig{
		@Bean
		public CoreServiceLocator zkServiceLocator(Environment env,CuratorFramework client){
			RemoteServiceLocator loc = new RemoteServiceLocator(client);
			log.info("地服务注册和发现:"+client.getZookeeperClient().getCurrentConnectionString());
			return loc;
			
		}
	}
	
	
	@Configuration
	@ConditionalOnProperty(name = "zookeeper.enabled", havingValue = "false",matchIfMissing=true)
	class LocalConfig{
		@Bean
		public CoreServiceLocator localServiceLocator(Environment env){
			
			LocalServiceLocator loc = new LocalServiceLocator();
			log.info("没有配置zookeeper.*,使用模拟本地服务注册和发现:"+loc.configFile);
			return loc;
			
		}
	}
	
	
	
}

/**
 * zookeeper 服务注册中心
 * @author lijiazhi
 *
 */
class RemoteServiceLocator implements CoreServiceLocator{
	CuratorFramework client;
	Log log = LogFactory.getLog(this.getClass());
	public RemoteServiceLocator(CuratorFramework client){
		this.client = client;
	}

	@Override
	public void addServiceURI(String path, String url) {
		try{
			ServiceInstanceBuilder<Map> service = ServiceInstance.builder();
			service.address("");
			service.port(0);
			service.name(path);
			Map config = new HashMap();
			config.put("url", url);
			service.payload(config);

			ServiceInstance<Map> instance = service.build();

			ServiceDiscovery<Map> serviceDiscovery = ServiceDiscoveryBuilder.builder(Map.class).client(client)
					.serializer(new JsonInstanceSerializer<Map>(Map.class)).basePath("/service").build();
			// 服务注册
			serviceDiscovery.registerService(instance);
			serviceDiscovery.start();
		}catch(Exception ex){
			log.warn(ex.getMessage(), ex);
			throw new PlatformException("服务注册中心 出错",ex);
		}
		
		
	}

	@Override
	public String getServiceURI(String path) {
		ServiceDiscovery<Map> serviceDiscovery = ServiceDiscoveryBuilder.builder(Map.class).client(client)
				.serializer(new JsonInstanceSerializer<Map>(Map.class)).basePath("/service").build();

		try {
			serviceDiscovery.start();
		} catch (Exception e) {
			throw new PlatformException("未发现服务注册中心 ");
		}

		Collection<ServiceInstance<Map>> all;
		try {
			all = serviceDiscovery.queryForInstances(path);
		} catch (Exception e) {
			log.warn("未发现服务注服务 "+path);
			throw new PlatformException("未发现服务注服务 "+path);
		}
		if (all.size() == 0) {
			log.warn("未发现服务注服务 "+path);
			throw new PlatformException("未发现服务注服务 "+path);
		} else {
			//todo 优化：能缓存,官方有缓存方法，以后补上
			// 随机选一个
			int size = all.size();
			int one = new Random().nextInt(size);
			ServiceInstance<Map> service = new ArrayList<ServiceInstance<Map>>(all).get(one);
			return (String)service.getPayload().get("url");

		}
	}
	
}

/**
 * 开发环境下，本地俩个系统注册服务，发现服务的方式。通过starter.service.properties文件完成
 * @author lijiazhi
 *
 */
class LocalServiceLocator implements CoreServiceLocator{
	
	String home = System.getProperty("user.home");
	//单机用一个配置文件完成，多机情况得使用zookeeper
	String configFile = null;
	public LocalServiceLocator(){
		configFile = home+File.separator+"starter.service.properties";
	}

	@Override
	public void addServiceURI(String path, String url) {
		check();
		Properties ps = new Properties();
		try {
			ps.load(new FileReader(new File(configFile)));
			ps.setProperty(path, url);
			ps.store(new FileWriter(new File(configFile)), "");
		} catch (IOException e) {
			throw new PlatformException("未发现服务注册中心 "+e.getMessage());
		}
	}

	@Override
	public String getServiceURI(String path) {
		check();
		Properties ps = new Properties();
		try {
			ps.load(new FileReader(new File(configFile)));
			String url =  ps.getProperty(path);
			if(StringUtils.isEmpty(url)){
				throw new PlatformException("未发现服务注服务 ");
			}
			return url;
			
		} catch (IOException e) {
			throw new PlatformException("未发现服务注册中心 "+e.getMessage());
		}
		
	}
	
	
	protected void check(){
		File file = new File(configFile);
		if(file.exists()){
			return;
		}
		try {
			file.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new PlatformException("未发现服务注册中心 "+e.getMessage(),e);
		}
	}
}
