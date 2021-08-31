package com.project.jk.store;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.common.Member;
import com.project.jk.order.OrderDAO;
import com.project.jk.order.p_order2;
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
	@Autowired
	private OrderDAO odao;

	@RequestMapping(value = "store.go", method = RequestMethod.GET)
	public String store(Member m, HttpServletRequest request) {
		sdao.getMemberInfo(m, request);
		request.setAttribute("contentPage","storePage/Storehome.jsp");
		return "index";
	}
	@RequestMapping(value = "store.MyPage", method = RequestMethod.POST)
	public String storeMyPage(Store s ,Product p, HttpServletRequest request) {
		
		sdao.getStoreInfo(s, request);
		Store sss = sdao.getStoreInfo5(s, request);
		pdao.getAllProduct2(sss,request);
		pdao.paging2(1, request);
		ldao.getAllLesson2(sss,request);
		ldao.paging2(1, request);
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
	@RequestMapping(value = "storeproduct.paging", method = RequestMethod.GET)
	public String paging(Store s,Product p, HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p"));
		
		sdao.getStoreInfo(s, request);
		Store sss = sdao.getStoreInfo5(s, request);
		pdao.getAllProduct2(sss,request);
		pdao.paging2(p2, request);
		ldao.getAllLesson2(sss,request);
		ldao.paging2(1, request);
		request.setAttribute("contentPage","storePage/StoreMyPage.jsp");
		
		
		return "index";
	}
	@RequestMapping(value = "storelesson.paging", method = RequestMethod.GET)
	public String paging2(Store s,Lesson l, HttpServletRequest request) {
		int p3 = Integer.parseInt(request.getParameter("p2"));
		
		sdao.getStoreInfo(s, request);
		Store sss = sdao.getStoreInfo5(s, request);
		pdao.getAllProduct2(sss,request);
		pdao.paging2(1, request);
		ldao.getAllLesson2(sss,request);
		ldao.paging2(p3, request);
		request.setAttribute("contentPage","storePage/StoreMyPage.jsp");
		
		
		return "index";
	}
	
	@RequestMapping(value = "userStoreDetail", method = RequestMethod.GET)
	public String userStoreDetail(Store s, HttpServletRequest request) {
		
		sdao.getStoreInfo3(s, request);
		pdao.storeProduct(s, request);
		pdao.paging2(1, request);
		ldao.storeLesson(s, request);
		ldao.paging2(1, request);

		request.setAttribute("contentPage","storePage/userStoreDetail.jsp");
		return "index";
	}
	@RequestMapping(value = "userStorelesson.paging", method = RequestMethod.GET)
	public String spaging2(Store s,Lesson l, HttpServletRequest request) {
		int p3 = Integer.parseInt(request.getParameter("p2"));
		
		sdao.getStoreInfo3(s, request);
		pdao.storeProduct(s, request);
		pdao.paging2(1, request);
		ldao.storeLesson(s, request);
		ldao.paging2(p3, request);
		request.setAttribute("contentPage","storePage/userStoreDetail.jsp");
		
		
		return "index";
	}
	@RequestMapping(value = "userStoreproduct.paging", method = RequestMethod.GET)
	public String spaging(Store s,Product p, HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p"));
		
		sdao.getStoreInfo3(s, request);
		pdao.storeProduct(s, request);
		pdao.paging2(p2, request);
		ldao.storeLesson(s, request);
		ldao.paging2(1, request);
		request.setAttribute("contentPage","storePage/userStoreDetail.jsp");
		
		
		return "index";
	}
	
	@RequestMapping(value = "store.Porder", method = RequestMethod.GET)
	public String sellerP_Order(Product p,p_order2 po2,HttpServletRequest request) {
		
		
		
		odao.PordercConfrim(p,request);
		odao.paging(1, request);
		request.setAttribute("contentPage", "storePage/storeOrder.jsp"); 
		return "index";
	}
	@RequestMapping(value = "storeProductOrder.paging", method = RequestMethod.GET)
	public String opaging2(Product p,p_order2 po2, HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p2"));
		
		odao.PordercConfrim(p,request);
		odao.paging(p2, request);
		request.setAttribute("contentPage","storePage/storeOrder.jsp");
		
		
		return "index";
	}
	
	
	
}
