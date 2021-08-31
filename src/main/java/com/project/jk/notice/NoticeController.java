package com.project.jk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.jk.common.MemberDAO;


@Controller
public class NoticeController {
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private NoticeDAO ndao;
	
	@RequestMapping(value = "notice/notice.go", method = RequestMethod.GET)
	public String noticeGo(HttpSession session, HttpServletRequest request) {
		
		ndao.noticeAll(request);
		mdao.loginCheck(session, request);
		ndao.paging(1, request);
		request.setAttribute("contentPage", "notice/notice.jsp");
		return "index";
	}
	
	@RequestMapping(value = "notice/notice.reg.go", method = RequestMethod.GET)
	public String noticeRegGo(Notice n, HttpSession session, HttpServletRequest request) {
		
		mdao.loginCheck(session, request);
		request.setAttribute("contentPage", "notice/noticeReg.jsp");
		return "index";
	}
	
	@RequestMapping(value = "notice/notice.reg.do", method = RequestMethod.POST)
	public String noticeRegDo(Notice n, HttpSession session, HttpServletRequest request) {
		
		ndao.regNotice(n, request);
		ndao.noticeAll(request);
		mdao.loginCheck(session, request);
		ndao.paging(1, request);
		request.setAttribute("contentPage", "notice/notice.jsp");
		return "index";
	}
	
	@RequestMapping(value = "notice/notice.detail", method = RequestMethod.GET)
	public String noticeDetail(Notice n,HttpSession session, HttpServletRequest request) {
		
		mdao.loginCheck(session, request);
		ndao.updateNoticeCnt(n, request);
		ndao.getNotice(n, request);
		request.setAttribute("contentPage", "notice/noticeDetail.jsp");
		return "index";
	}
	
	@RequestMapping(value = "notice/notice.del", method = RequestMethod.GET)
	public String noticeDel(Notice n, HttpSession session, HttpServletRequest request) {
		
		if(mdao.loginCheck(session, request)) {
			ndao.delNotice(n, request);
			ndao.noticeAll(request);
			ndao.paging(1, request);
			request.setAttribute("contentPage", "notice/notice.jsp");
		} else {
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value = "notice/goUpdateNotice", method = RequestMethod.GET)
	public String noticeUpdateGo(Notice n, HttpSession session, HttpServletRequest request) {
		if(mdao.loginCheck(session, request)) {
			ndao.getNotice(n, request);
			request.setAttribute("contentPage", "notice/noticeUpdate.jsp");
		} else {
			ndao.noticeAll(request);
			ndao.paging(1, request);
			request.setAttribute("contentPage", "notice/notice.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value = "notice/notice.update.do", method = RequestMethod.POST)
	public String noticeUpdate(HttpSession session, HttpServletRequest request) {
		
		if(mdao.loginCheck(session, request)) {
			ndao.updateNotice(request);
		} 
			request.setAttribute("contentPage", "notice/noticeDetail.jsp");
		return "index";
	}
	


	
}
