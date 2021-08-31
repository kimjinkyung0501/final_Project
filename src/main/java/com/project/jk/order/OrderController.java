package com.project.jk.order;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.common.MemberDAO;
import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.lesson.LessonDAO;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductDAO;

@Controller
public class OrderController {
	@Autowired
	private ProductDAO pdao;
	@Autowired
	private OrderDAO odao;
	@Autowired
	private LessonDAO ldao;
	@Autowired
	private MemberDAO mdao;
	
	@RequestMapping(value = "order.go", method = RequestMethod.POST)
	public String p_order(Product p,HttpServletRequest request) {
		
		
		pdao.getProduct2(p, request);
		HttpSession hs= request.getSession();   
				hs.setAttribute("product", request.getAttribute("product"));
				hs.setAttribute("number",request.getParameter("p2_p_quantidey"));		
				hs.setAttribute("price",request.getParameter("p2_sumPrice"));		
				hs.setAttribute("s_name",request.getParameter("s_name"));		
				
	
				
				
		request.setAttribute("contentPage", "order/p_order.jsp");
		return "index";
	}
	@RequestMapping(value = "l_order.go", method = RequestMethod.POST)
	public String l_order(Lesson l,HttpServletRequest request) {
		
		
	
		
		ldao.getLesson(l, request);
		

		request.setAttribute("contentPage", "order/l_order.jsp");
		return "index";
	}
	
	@RequestMapping(value = "order.do", method = RequestMethod.POST)
	public String p_orderdo(p_order2 po2,HttpServletRequest request) {
		
		
		
		
		odao.RegP_Order(po2, request);
		odao.minusStrock(po2, request);
		odao.charge(po2,request);
		return "index";
	}
	@RequestMapping(value = "l_order.do", method = RequestMethod.POST)
	public String l_orderdo(L_order lo,HttpServletRequest request) {
		
		odao.RegL_Order(lo, request);
		odao.charge2(lo,request);

		

		return "index";
	}
	@RequestMapping(value = "cart.go", method = RequestMethod.POST)
	public void Cart(p_order po,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		
		pdao.insertCart(po, request);
		mdao.getMemberCart(request);
			mdao.pagin(request, 1);
			request.setAttribute("contentPage", "memberPage/myPageFolder/cartPage.jsp");
		
			response.sendRedirect("http://localhost:80/jk/common/toCart.go");

	}


	@RequestMapping(value = "cart.go2", method = RequestMethod.GET)
	public void Cart2(p_order po,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		
		pdao.insertCart(po, request);
		mdao.getMemberCart(request);
		mdao.pagin(request, 1);
		request.setAttribute("contentPage", "memberPage/myPageFolder/cartPage.jsp");
		response.sendRedirect("http://localhost:80/jk/common/toCart.go");
		
	}
	

	@RequestMapping(value = "order.do2", method = RequestMethod.GET)
	public String p_orderdo2(p_order2 po2,HttpServletRequest request) {
		
			odao.charge3(request);
		 request.setAttribute("contentPage", "order/kakaoPay.jsp");

		return "index";
	}
	
	
}

