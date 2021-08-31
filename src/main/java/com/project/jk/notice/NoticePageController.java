package com.project.jk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.common.MemberDAO;


@Controller
public class NoticePageController {
	
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private NoticeDAO ndao;
	
	@RequestMapping(value = "/NoticePageController", method = RequestMethod.GET)
	public String paging(HttpSession session, HttpServletRequest req) {
		
		int p = Integer.parseInt(req.getParameter("p"));
		ndao.paging(p, req);
		
		mdao.loginCheck(session, req);
		req.setAttribute("contentPage", "notice/notice.jsp");
		
		return "index";
	}

}
