package com.project.jk.store.lesson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.project.jk.store.product.Product;



@Controller
public class lessonController {
	
	@Autowired
	private LessonDAO ldao;

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
}
