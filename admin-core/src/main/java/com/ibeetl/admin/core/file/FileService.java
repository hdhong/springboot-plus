package com.ibeetl.admin.core.file;

import java.io.InputStream;
import java.io.OutputStream;
/**
 * 文件持久化，默认为文件系统，可以扩展到fastfds等
 * @author xiandafu
 *
 */
public interface FileService {
	/**
	 * 得到一个临时文件操作
	 * @param name
	 * @return
	 */
	public FileItem createFileTemp(String name);
	
	
	public FileItem getFileItem(String id);
	/**
	 * 
	 * @param url
	 * @param os
	 */
	public void copyTemp(String url,OutputStream os);
}
