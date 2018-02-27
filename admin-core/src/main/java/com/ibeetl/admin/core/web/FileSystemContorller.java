package com.ibeetl.admin.core.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibeetl.admin.core.file.FileItem;
import com.ibeetl.admin.core.file.FileService;

@Controller
public class FileSystemContorller {
	private final Log log = LogFactory.getLog(this.getClass());
	private static final String MODEL = "/core/file";
	@Autowired
	FileService fileService;
	@GetMapping(MODEL + "/get.do")
	public ModelAndView index(HttpServletResponse response,String id) throws IOException {
		 response.setContentType("text/html; charset = UTF-8");  
		 FileItem fileItem = fileService.getFileItem(id);
		 response.setHeader("Content-Disposition", "attachment; filename="+fileItem.getName());  
		 fileService.copyTemp(id, response.getOutputStream());
		 return null;
	}
}
