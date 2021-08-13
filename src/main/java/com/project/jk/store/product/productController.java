package com.project.jk.store.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.store.lesson.Lesson;



@Controller
public class productController {
	
	@Autowired
	private ProductDAO pdao;
	



	@RequestMapping(value = "product.reg.go", method = RequestMethod.GET)
	public String productreg( HttpServletRequest request) {
	
		request.setAttribute("contentPage", "productPage/productReg.jsp");
		return "index" ;
	}
	@RequestMapping(value = "product.reg.do", method = RequestMethod.POST)
	public String productregdo(Product p, HttpServletRequest request) {

	
		pdao.regproduct(p,request);
		
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
	}
	
	@RequestMapping(value = "product.delete", method = RequestMethod.GET)
	public String productdelete(Product p, HttpServletRequest request) {
		pdao.deleteProduct(p, request);
		
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
	}
	@RequestMapping(value = "product.go", method = RequestMethod.GET)
	public String productgo(HttpServletRequest request) {
		pdao.getAllProduct(request);
		request.setAttribute("contentPage", "productPage/productView.jsp");
		return "index";
	}
	@RequestMapping(value = "product.update.go", method = RequestMethod.GET)
	public String lessonupdatego(Product p, HttpServletRequest request) {
		pdao.getProduct(p, request);;
		request.setAttribute("contentPage", "productPage/productUpdate.jsp");
		return "index";
		
	}
	@RequestMapping(value = "product.update.do", method = RequestMethod.POST)
	public String lessonupdatedo(Product p, HttpServletRequest request) {
		pdao.updateproduct(p, request);
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
		
	}
	@RequestMapping(value = "product.detail", method = RequestMethod.GET)
	public String sellerproductdetail(Product p, HttpServletRequest request) {
		
		pdao.getProduct(p, request);
		request.setAttribute("contentPage", "productPage/userProductdetail.jsp"); 
		return "index";
	}

}
