package com.project.jk.comment;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.store.lesson.Lesson;
import com.project.jk.store.lesson.LessonDAO;
import com.project.jk.store.product.Product;
import com.project.jk.store.product.ProductDAO;

@Controller
public class CommentController {
	
	@Autowired
	private P_CommentDAO pcdao;
	@Autowired
	private ProductDAO pdao; 
	@Autowired
	private L_CommentDAO lcdao;
	@Autowired
	private LessonDAO ldao;

	@RequestMapping(value = "p_comment.reg", method = RequestMethod.GET)
	public String p_commentreg(P_Comment pc,Product p,HttpServletRequest request) {
		
		pcdao.regComment(pc,request);
		pcdao.getAllPComment(p, request);
		pcdao.paging(1, request);
		pdao.getProduct(p, request);
		
		request.setAttribute("contentPage", "productPage/userProductdetail.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "p_comment.paging", method = RequestMethod.GET)
	public String paging(Product p, HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p"));

		pcdao.paging(p2, request);
		pdao.getProduct(p, request);
		request.setAttribute("contentPage", "productPage/userProductdetail.jsp"); 
		return "index";
	}
	
	@RequestMapping(value = "p_comment.delete", method = RequestMethod.GET)
	public String delete(Product p, P_Comment pc,HttpServletRequest request) {
		
		pcdao.delete(pc);
		pcdao.getAllPComment(p, request);
		pcdao.paging(1, request);
		pdao.getProduct(p, request);
		request.setAttribute("contentPage", "productPage/userProductdetail.jsp"); 
		return "index";
	}
	@RequestMapping(value = "p_comment.update", method = RequestMethod.GET)
	public String update(Product p, P_Comment pc,HttpServletRequest request) {
		
		pcdao.update(pc);
		pcdao.getAllPComment(p, request);
		pcdao.paging(1, request);
		pdao.getProduct(p, request);
		request.setAttribute("r", "수정성공");
		return "Result";
	}
	
	@RequestMapping(value = "l_comment.reg", method = RequestMethod.GET)
	public String l_commentreg(L_Comment lc,Lesson l,HttpServletRequest request) {
		
		lcdao.regComment(lc,request);
		lcdao.getAlllComment(l, request);
		lcdao.paging(1, request);
		ldao.getLesson(l, request);
		
		request.setAttribute("contentPage", "lessonPage/userLessondetail.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "l_comment.paging", method = RequestMethod.GET)
	public String paging2(Lesson l, HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p"));
		
		lcdao.paging(p2, request);
		ldao.getLesson(l, request);
		request.setAttribute("contentPage", "lessonPage/userLessondetail.jsp"); 
		return "index";
	}
	
	@RequestMapping(value = "l_comment.delete", method = RequestMethod.GET)
	public String ldelete(Lesson l, L_Comment lc,HttpServletRequest request) {
		
		lcdao.delete(lc);
		lcdao.getAlllComment(l, request);
		lcdao.paging(1, request);
		ldao.getLesson(l, request);
		request.setAttribute("contentPage", "lessonPage/userLessondetail.jsp"); 
		return "index";
	}
	@RequestMapping(value = "l_comment.update", method = RequestMethod.GET)
	public String lupdate(Lesson l, L_Comment lc,HttpServletRequest request) {
		
		lcdao.update(lc);;
	
		request.setAttribute("r", "수정성공");
		return "Result";
	}
	
	
	
	 @RequestMapping(value = "updatePC")
	   public String updatePC() {
	      return "productPage/updatePC";
	   }
	 @RequestMapping(value = "updateLC")
	 public String updateLC() {
		 return "lessonPage/updateLC";
	 }
	   
	
}
