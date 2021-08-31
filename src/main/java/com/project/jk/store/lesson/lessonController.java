package com.project.jk.store.lesson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.comment.L_CommentDAO;
import com.project.jk.store.product.ProductDAO;



@Controller
public class lessonController {
	
	@Autowired
	private LessonDAO ldao;
	@Autowired
	private ProductDAO pdao;
	@Autowired
	private L_CommentDAO lcdao;

	@RequestMapping(value = "lesson.reg.go", method = RequestMethod.GET)
	public String productreg( HttpServletRequest request) {
		
		request.setAttribute("contentPage", "lessonPage/lessonReg.jsp"); 
		return "index";
	}
	
	@RequestMapping(value = "lesson.reg.do", method = RequestMethod.POST)
	public String lessonregdo(Lesson l, HttpServletRequest request) {
	
		ldao.reglesson(l,request);
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
	}
	@RequestMapping(value = "lesson.delete", method = RequestMethod.GET)
	public String lessondelete(Lesson l, HttpServletRequest request) {
		ldao.deleteLesson(l, request);
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
	
	}
	@RequestMapping(value = "lesson.update.go", method = RequestMethod.GET)
	public String lessonupdatego(Lesson l, HttpServletRequest request) {
		ldao.getLesson(l, request);
		request.setAttribute("contentPage", "lessonPage/lessonUpdate.jsp");
		return "index";
		
	}
	@RequestMapping(value = "lesson.update.do", method = RequestMethod.POST)
	public String lessonupdatedo(Lesson l, HttpServletRequest request) {
		ldao.updatelesson(l, request);;
		request.setAttribute("contentPage", "lessonPage/Result.jsp");
		return "index";
		
	}
	@RequestMapping(value = "lesson.go", method = RequestMethod.GET)
	public String productgo(HttpServletRequest request) {
		ldao.getAllLesson(request);
		ldao.paging(1, request);
		pdao.getStore2(request);
		request.setAttribute("contentPage", "lessonPage/lessonView.jsp");
		return "index";
	}
	@RequestMapping(value = "lesson.paging", method = RequestMethod.GET)
	public String productpaging(HttpServletRequest request) {
		int p2 = Integer.parseInt(request.getParameter("p"));
		pdao.getStore2(request);
		ldao.paging(p2, request);
		request.setAttribute("contentPage", "lessonPage/lessonView.jsp");
		return "index";
	}
	@RequestMapping(value = "lesson.detail", method = RequestMethod.GET)
	public String sellerproductdetail(Lesson l, HttpServletRequest request) {
		lcdao.getAlllComment(l, request);
		lcdao.paging(1, request);
		ldao.getLesson(l, request);
		request.setAttribute("contentPage", "lessonPage/userLessondetail.jsp"); 
		return "index";
	}
	@RequestMapping(value = "lesson.label", method = RequestMethod.GET)
	public String LessonLabel(Lesson l,HttpServletRequest request) {
		ldao.Llabel(l);
		ldao.paging(1, request);
		pdao.getStore2(request);
		request.setAttribute("contentPage", "lessonPage/lessonView.jsp");
		return "index";
	}
	
}
