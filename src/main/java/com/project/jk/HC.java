package com.project.jk;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.jk.order.OrderDAO;
import com.project.jk.order.p_order;
import com.project.jk.order.p_order2;
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
	private HDAO hdao;


	@Autowired
	private ProductDAO pdao;

	@Autowired
	private LessonDAO ldao;
	@Autowired
	private OrderDAO odao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {

		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/best.collection", method = RequestMethod.GET)
	public String bestSelec(Lesson l, Product p, HttpServletRequest request) {

			
		odao.rankProduct(request);
		//odao.rankLesson(request);

		request.setAttribute("contentPage", "collect.jsp");
		return "index";
	}

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


	@RequestMapping(value = "/search.all", method = RequestMethod.GET)
	public String searchAll(HttpServletRequest req, @RequestParam("search")String keyword, HttpSession session) {
		hdao.searchAll(req, keyword, session);
		req.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/searchClass.do", method = RequestMethod.GET)
	public String searchClass(HttpServletRequest req, @RequestParam("keyword")String keyword) {
		hdao.searchClass(req, keyword);
		req.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/searchProduct.do", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest req, @RequestParam("keyword")String keyword) {
		hdao.searchProduct(req, keyword);
		req.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/searchStore.do", method = RequestMethod.GET)
	public String searchStore(HttpServletRequest req, @RequestParam("keyword")String keyword) {
		hdao.searchStore(req, keyword);
		req.setAttribute("contentPage", "searchAll.jsp");
		return "index";
	}
	
	

	@RequestMapping(value = "/policy.go", method = RequestMethod.GET)
	public String policy(HttpServletRequest req) {

		req.setAttribute("contentPage", "policy.jsp");
		return "index";
	}

	@RequestMapping(value = "/kakaopaySuccess", method = RequestMethod.GET)
	public String Success(HttpServletRequest request) {
		
		
		request.setAttribute("r", "결제성공");
		request.setAttribute("contentPage", "order/orderResult.jsp"); 
		return "index";
	}
	@RequestMapping(value = "/kakaopayFail", method = RequestMethod.GET)
	public String fail(p_order2 po2,HttpServletRequest request) {
		
		
		odao.returnStock(po2);
		request.setAttribute("r", "결제실패");
		request.setAttribute("contentPage", "order/orderResult.jsp"); 
		return "index";
	}
	@RequestMapping(value = "/kakaopayFail2", method = RequestMethod.GET)
	public String fail2(HttpServletRequest request) {
		
		
		
		request.setAttribute("r", "결제실패");
		request.setAttribute("contentPage", "order/orderResult.jsp"); 
		return "index";
	}
	
	
	
	
	
	
	
}
