package com.project.jk;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class HC {
	
//	@Autowired
//	private MDAO mdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String homeGo(HttpServletRequest req) {
		return home(req);
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String aboutGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "about.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/search.all", method = RequestMethod.GET)
	public String searchAll(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	
	
	
}
