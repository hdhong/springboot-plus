package com.ibeetl.admin.core.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.beetl.ext.simulate.WebSimulate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 模拟所有还未实现的视图,或者json，或者直接访问相应的html页面
 * @author xiandafu
 *
 */
@Controller
public class SimulateController {
	@Autowired
	WebSimulate webSimulate;

	@RequestMapping("/**/*.do")
	public void simluateWeb(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		webSimulate.execute(request, response);
	}

	
	
}
