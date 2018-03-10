package com.ibeetl.admin.core.file;

import java.io.OutputStream;
import java.util.List;
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
	
	/**
	 * 创建一个持久的文档
	 * @param name
	 * @param bizType
	 * @param bizId
	 * @param userId
	 * @param orgId
	 * @param tags
	 * @return
	 */
	 public FileItem createFileItem(String name,String bizType,String bizId,Long userId,Long orgId,List<FileTag> tags);

	
	public FileItem loadFileItemByPath(String path);
	public FileItem getFileItemById(Long id);
	public List<FileItem> queryByUserId(Long userId,List<FileTag> tags);
	public List<FileItem> queryByBiz(String bizType,String bizId); 
	
	

    
	
}
