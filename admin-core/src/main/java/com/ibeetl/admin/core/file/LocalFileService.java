package com.ibeetl.admin.core.file;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.context.ApplicationContext;

import com.ibeetl.admin.core.dao.CoreFileDao;
import com.ibeetl.admin.core.entity.CoreFile;
import com.ibeetl.admin.core.util.DateUtil;
/**
 * 一个本地文件系统，管理临时文件和用户文件
 * @author xiandafu
 *
 */
public class LocalFileService   implements FileService {

    DBIndexHelper dbHelper =  null;
	String root = null;

	public LocalFileService(ApplicationContext ctx,String root) {
		this.root = root;
		new File(root,"temp").mkdir();
		dbHelper = new DBIndexHelper(ctx.getBean(CoreFileDao.class));
	}

	@Override
	public FileItem loadFileItemByPath(String path) {
	    CoreFile coreFile = dbHelper.getFileItemByPath(path);
	    if(coreFile!=null) {
	        return getFileItem(coreFile);
	    }
	    LocalFileItem item = new LocalFileItem(root);
		item.setPath(path);
		item.setName(parseName(path));
		item.setTemp(true);
		return item;
	}

	@Override
	public FileItem createFileTemp(String name) {
		FileItem item = new LocalFileItem(root);
		String fileName = "temp"+File.separator+name + "." + this.suffix();
		item.setPath(fileName);
		item.setName(name);
		item.setTemp(true);
		return item;
	}

	@Override
    public FileItem createFileItem(String name, String bizType, String bizId, Long userId, Long orgId, List<FileTag> tags) {
	    CoreFile coreFile = new CoreFile();
	    coreFile.setBizId(bizId);
	    coreFile.setBizType(bizType);
	    coreFile.setUserId(userId);
	    coreFile.setOrgId(orgId);
	    coreFile.setName(name);
	    String dir = DateUtil.now();
	    File file = new File(root + File.separator + dir);
	    if(!file.exists()) {
	        file.mkdirs();
	    }
	    String fileName = name+"."+suffix();
	    String path = root + File.separator + dir+File.separator+fileName;
	    coreFile.setPath(path);
	    //目前忽略tags
	    dbHelper.createFileItem(coreFile,tags);
	    return this.getFileItem(coreFile);
	    
    }
	
	

	private String suffix() {
		// TODO,改成唯一算法
		return System.currentTimeMillis() + "" + new Random().nextInt(10000);
	}
	
	private String parseName(String path) {
		File file = new File(path);
		return file.getName();
	}
	
	protected  FileItem getFileItem(CoreFile file) {
	    LocalFileItem item = new LocalFileItem(root);
	    item.setName(file.getName());
	    item.setPath(file.getPath());
	    item.setBizId(file.getBizId());
	    item.setBizType(file.getBizType());
	    item.setId(file.getId());
	    item.setOrgId(file.getOrgId());
	    return item;
	 }
	
	protected  List<FileItem> getFileItem(List<CoreFile> files) {
	    List<FileItem> items = new ArrayList<>(files.size());
	    for(CoreFile file:files) {
	        items.add(this.getFileItem(file));
	    }
	    return items;
       
     }

    

    @Override
    public FileItem getFileItemById(Long id) {
        return this.getFileItem(dbHelper.getFileItemById(id));
    }

    @Override
    public List<FileItem> queryByUserId(Long userId, List<FileTag> tags) {
        return this.getFileItem(dbHelper.queryByUserId(userId, tags));
    }

    @Override
    public List<FileItem> queryByBiz(String bizType, String bizId) {
        return this.getFileItem(dbHelper.queryByBiz(bizType, bizId));
    }
	
	
	
	

}
