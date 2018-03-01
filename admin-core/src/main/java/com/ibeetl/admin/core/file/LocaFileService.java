package com.ibeetl.admin.core.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import com.ibeetl.admin.core.util.PlatformException;

public class LocaFileService implements FileService {

	String root = null;

	public LocaFileService(String root) {
		this.root = root;
	}

	@Override
	public FileItem getFileItem(String id) {
		FileItem item = new LocalFileItem();
		item.setId(id);
		item.setName(parseName(id));
		return item;
	}

	@Override
	public FileItem createFileTemp(String name) {
		FileItem item = new LocalFileItem();
		String fileName = name + "." + this.suffixTemp();
		item.setId(fileName);
		item.setName(name);
		return item;
	}

	
	@Override
	public void copyTemp(String id,OutputStream os) {
		File file = new File(root + File.separator + id);
		FileInputStream input = null;
		try {
			input = new FileInputStream(file);
			byte[] buf = new byte[1024];
			int bytesRead;
			while ((bytesRead = input.read(buf)) > 0) {
				os.write(buf, 0, bytesRead);
			}
			file.delete();
		}catch(Exception ex) {
			throw new PlatformException("下载文件失败"+ex);
		}
		finally {
			try {
				input.close();
				os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	}
	
	

	private String suffixTemp() {
		// TODO,改成唯一算法
		return System.currentTimeMillis() + "" + new Random().nextInt(10000)+".temp";
	}
	
	private String parseName(String id) {
		String[] array = id.split("\\.");
		return array[0]+"."+array[1];
	}
	
	class LocalFileItem extends FileItem{

		public OutputStream openOutpuStream() {
			File file = new File(root + File.separator + id);
			try {
				file.createNewFile();
				FileOutputStream fos = new FileOutputStream(file);
				return fos;
			} catch (IOException e) {
				throw new PlatformException("Open stream error "+id);
			}
			
		}
		
	}

}
