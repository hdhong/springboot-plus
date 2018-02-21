package com.ibeetl.admin.core.service;

/**
 * 服务注册和发现，单机情况，注册在本地系统，多机情况，用zookeeper完成注册,计划改成Spring cloud
 * @author lijiazhi
 *
 */
public interface CoreServiceLocator {
	public void addServiceURI(String path,String url);
	public String getServiceURI(String path);
}
