package com.ibeetl.admin.core.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibeetl.admin.core.file.FileItem;
import com.ibeetl.admin.core.file.FileService;
import com.ibeetl.admin.core.util.FileUtil;
import com.ibeetl.admin.core.util.PlatformException;

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
	
	@GetMapping(MODEL + "/downloadTemplate.do")
    public ModelAndView dowloadTemplate(HttpServletResponse response,String path) throws IOException {
         response.setContentType("text/html; charset = UTF-8");  
         int start1 = path.lastIndexOf("\\");
         int start2 = path.lastIndexOf("/");
         if(start2>start1) {
             start1 = start2;
         }
         String file = path.substring(start1+1);
         response.setHeader("Content-Disposition", "attachment; filename="+file);  
         InputStream input = Thread.currentThread().getContextClassLoader().getResourceAsStream("excelTemplates/"+path);
         FileUtil.copy(input, response.getOutputStream());
         return null;
    }
	
   @GetMapping(MODEL + "/simpleUpload.do")
    public ModelAndView simpleUploadPage(String uploadUrl,String templatePath,String fileType) throws IOException {
       ModelAndView view = new ModelAndView("/common/simpleUpload.html");
       view.addObject("uploadUrl",uploadUrl);
       view.addObject("templatePath",templatePath);
       view.addObject("fileType",fileType);
      
       return view;
   }
}
