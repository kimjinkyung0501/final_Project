package com.project.jk;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jk.store.Store;
import com.project.jk.store.StoreDAO;
import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.lesson.LessonDAO;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductDAO;
@Controller
public class HC {
	
//	@Autowired
//	private MDAO mdao;
	
	@Autowired
	private StoreDAO sdao;
	
	@Autowired
	private ProductDAO pdao;
	
	
	@Autowired
	private LessonDAO ldao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	
//	@RequestMapping(value = "common/home.go", method = RequestMethod.GET)
//	public String homeGo(HttpServletRequest req) {
//		return home(req);
//	}
	
	@RequestMapping(value = "/about.go", method = RequestMethod.GET)
	public String aboutGo(HttpServletRequest req) {
		req.setAttribute("contentPage", "about.jsp");
		return "index";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest req) {
		req.setAttribute("contentPage", "test.jsp");
		return "index";
	}

	
	@RequestMapping(value = "search.all", method = RequestMethod.GET)
	public String searchAll(Lesson l, Product p, Store s, HttpServletRequest request,
			@RequestParam(value = "keyword") String keyword
			) {
		
		sdao.searchHomestore(keyword, s,request);
		ldao.searchHomeLesson(keyword, l,request);
		pdao.searchHomeProduct(keyword, p,request);
		request.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/policy.go", method = RequestMethod.GET)
	public String policy(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "policy.jsp");
		return "index";
	}
	

	
	
}
