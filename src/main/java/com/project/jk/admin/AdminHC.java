package com.project.jk.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.jk.PagingVO;
import com.project.jk.common.Member;
import com.project.jk.message.Complain;
import com.project.jk.store.StoreDAO;
import com.project.jk.store.lesson.LessonDAO;
import com.project.jk.store.product.ProductDAO;

@Controller
public class AdminHC {

	
	@Autowired
	private adminDAO Adao;
	
	@RequestMapping(value = "admin.go", method = RequestMethod.GET)
	public String AdminHome(Member m, HttpServletRequest request) {
		
		request.setAttribute("contentPage","admin/adminHome.jsp");
		return "index";
	}
	
	@RequestMapping(value = "admin.shopManagemen", method = RequestMethod.GET)
	public String AdminShopManagemen(Member m, HttpServletRequest request,PagingVO p) {
		
		
		//nowPage=2&cntPerPage=5&gubun=B&p1=2
		Adao.shopInfo(request,p);// 승인 대기 중인 상점 목록
		Adao.shopInfo2(request,p);// 승인 된 상점 목록 
		Adao.shopInfo3(request,p);// 판매 중지된 상점 목록 
		
		request.setAttribute("contentPage","admin/shopManagemen.jsp");
		
		return "index";
	}
	// 모든 회원정보 가져오기 
	@RequestMapping(value = "admin.memberManagemen", method = RequestMethod.GET)
	public String AdminMemberManagemen(Member m, HttpServletRequest request,PagingVO p) {
		
		Adao.getAllMembers(request,p);
		
		
		request.setAttribute("contentPage","admin/memberManagemen.jsp");
		
		
		return "index";
	}
	//  회원정보 수정
	@RequestMapping(value = "admin.memberRenew", method = RequestMethod.GET)
	public String AdminMemberRenew(Member m, HttpServletRequest request,PagingVO p) {
		
		Adao.memberRenem(request, m);
		Adao.getAllMembers(request,p);
		request.setAttribute("contentPage","admin/memberManagemen.jsp");
		
		return "index";
	}
	// 회원 검색
	@RequestMapping(value = "admin.memberSearch", method = RequestMethod.GET)
	public String memberSeach(Member m, HttpServletRequest request,PagingVO p) {
		
	
		Adao.memberSeach(request,m,p);
		
		
		request.setAttribute("contentPage","admin/memberManagemenSeach.jsp");
		
		return "index";
	}
	
	@ResponseBody 
	@RequestMapping(value = "admin.storeApprove", method = RequestMethod.GET)
	public String Store(Member m, HttpServletRequest request) {
		
     Adao.storeApprove(request,m);		
		
		return null;
	}
	// 사용자 불만 요청 사항을 처리상태를 갱신함
	@ResponseBody 
	@RequestMapping(value = "admin.complainHandle", method = RequestMethod.GET)
	public String complainHandle(Complain c, HttpServletRequest request) {
		
		Adao.complainHandle(request,c);		
		
		return null;
	}
	
	
	//사용자 불만을 다 가져옴
	@RequestMapping(value = "admin.complainManagement", method = RequestMethod.GET)
	public String complainManagement(Member m, HttpServletRequest request,PagingVO p) {
		
		Adao.complainManagement(request, p);
		request.setAttribute("contentPage","admin/complainManagement.jsp");
		
		return "index";
	}
	
	//사용자 불만을 검색
	@RequestMapping(value = "admin.complain.search", method = RequestMethod.GET)
	public String complainSearch(Member m, HttpServletRequest request) {
		
		Adao.complainSearch(request);
		request.setAttribute("contentPage","admin/complainManagement.jsp");
		
		return "index";
	}
	
	
}
