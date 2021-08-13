package com.project.jk.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.common.Member;
import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.lesson.LessonDAO;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductDAO;



@Controller
public class StoreController {
	
	@Autowired
	private StoreDAO sdao;
	@Autowired
	private ProductDAO pdao;
	@Autowired
	private LessonDAO ldao;

	@RequestMapping(value = "store.go", method = RequestMethod.GET)
	public String store(Member m, HttpServletRequest request) {
		sdao.getMemberInfo(m, request);
		request.setAttribute("contentPage","storePage/Storehome.jsp");
		return "index";
	}
	@RequestMapping(value = "store.MyPage", method = RequestMethod.POST)
	public String storeMyPage(Store s ,Product p, HttpServletRequest request) {
		
		sdao.getStoreInfo(s, request);
		pdao.getAllProduct(request);
		ldao.getAllLesson(request);
		request.setAttribute("contentPage","storePage/StoreMyPage.jsp");
		return "index";
	}
	@RequestMapping(value = "store.reg.go", method = RequestMethod.GET)
	public String storereg(Store s,HttpServletRequest request) {
		request.setAttribute("contentPage","storePage/Storeinsert.jsp");
		return "index";
	}
	@RequestMapping(value = "store.reg.do", method = RequestMethod.POST)
	public String storeregdo(Member m,Store s,HttpServletRequest request) {
	
		sdao.reg(s, request);
		sdao.gradeup(m, request);
		request.setAttribute("contentPage","lessonPage/Result.jsp"); 
		return "index";
	}
	
	@RequestMapping(value = "home.go", method = RequestMethod.GET)
	public String homego(HttpServletRequest request) {

		request.setAttribute("contentPage","home.jsp");
		return "index";
	}
	@RequestMapping(value = "seller.product.detail", method = RequestMethod.GET)
	public String sellerproductdetail(Product p, HttpServletRequest request) {
		
		pdao.getProduct(p, request);
		request.setAttribute("contentPage", "storePage/productdetail.jsp"); 
		return "index";
	}
	@RequestMapping(value = "seller.lesson.detail", method = RequestMethod.GET)
	public String sellerLessondetail(Lesson l, HttpServletRequest request) {
		
		ldao.getLesson(l, request);
		
		
		request.setAttribute("contentPage", "storePage/LessonDetail.jsp"); 
		return "index";
	}
	@RequestMapping(value = "store.delete", method = RequestMethod.GET)
	public String sellerLessondetail(Store s,Member m ,HttpServletRequest request) {
		
		sdao.deleteStore(s, request); 
		sdao.gradedown(m, request);
		
		
		request.setAttribute("contentPage", "home.jsp"); 
		return "index";
	}
	
	
	
	@RequestMapping(value = "store.update.go", method = RequestMethod.GET)
	public String storeupdatedo(Store s,HttpServletRequest request) {
		
		sdao.getStoreInfo(s, request);
		request.setAttribute("contentPage", "storePage/storeUpdate.jsp"); 
		return "index";
	}
	@RequestMapping(value = "store.update.do", method = RequestMethod.POST)
	public String storeupdatego(Store s,HttpServletRequest request) {
		
		sdao.updateStore(s, request);
		request.setAttribute("contentPage", "lessonPage/Result.jsp"); 
		return "index";
	}
	
}
