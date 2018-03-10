package com.ibeetl.admin.core.file;

import java.io.OutputStream;

public abstract class FileItem {
	protected String name;
	protected String path;
	boolean isTemp = false;
	
	public abstract OutputStream openOutpuStream();
	
	public abstract void copy(OutputStream os);
	
	public abstract void delete();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

    public boolean isTemp() {
        return isTemp;
    }

    public void setTemp(boolean isTemp) {
        this.isTemp = isTemp;
    }
	
	
}
