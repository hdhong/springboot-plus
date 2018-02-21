package com.ibeetl.admin.core.conf;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.curator.RetryPolicy;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
@ConditionalOnClass(CuratorFramework.class)
@ConditionalOnProperty(name = "zookeeper.enabled", havingValue = "true")
public class ZookeeperConfig {
	Log log = LogFactory.getLog(this.getClass());
	@Autowired Environment env;
	@Bean
	public CuratorFramework getCuratorFramework() throws Exception {
		String zkUrl = env.getProperty("zookeeper.url");
		RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
		CuratorFramework client = CuratorFrameworkFactory.newClient(zkUrl, retryPolicy);
		client.start();
		return client;

	}

}
