package com.ibeetl.admin.core.file;

import java.io.OutputStream;

public abstract class FileItem {
	String name;
	String id;

	public abstract OutputStream openOutpuStream();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
