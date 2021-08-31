package com.project.jk.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.http.protocol.HTTP;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jk.PagingVO;
import com.project.jk.common.Member;
import com.project.jk.common.OrderPage;
import com.project.jk.message.Complain;
import com.project.jk.store.Store;

@Service
public class adminDAO {

	@Autowired
	private SqlSession ss;

//승인 대기 중인 상점 
	public void shopInfo(HttpServletRequest request, PagingVO p) {
		String gubun = request.getParameter("gubun");

		String nowPage = Integer.toString(p.getNowPage());
		String cntPerPage = Integer.toString(p.getCntPerPage());
		int total = ss.getMapper(AdminMapper.class).countStore();
		p.setTotal(total);
		int C = p.getTotal();
		System.out.println("--------------------------------");
		System.out.println("gubun : " + gubun);
		System.out.println("A : " + nowPage);
		System.out.println("B : " + cntPerPage);
		System.out.println("C : " + C);

		if (gubun == null || !gubun.equals("A")) {

			nowPage = "1";
			cntPerPage = "5";

			System.out.println("꾸뿐이 널일경우");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores = ss.getMapper(AdminMapper.class).getShopInfo(p);

			request.setAttribute("paging", p);
			request.setAttribute("Stores", Stores);

		} else {

			System.out.println("A일꼉우");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores = ss.getMapper(AdminMapper.class).getShopInfo(p);

			request.setAttribute("paging", p);
			request.setAttribute("Stores", Stores);
		}

	}

	public void shopInfo2(HttpServletRequest request, PagingVO p) {
		// 승인된 상점

		String gubun = request.getParameter("gubun");

		String nowPage = Integer.toString(p.getNowPage());
		String cntPerPage = Integer.toString(p.getCntPerPage());
		int total = ss.getMapper(AdminMapper.class).countStore2();
		p.setTotal(total);
		int C = p.getTotal();
		System.out.println("22--------------------------------");
		System.out.println("22gubun : " + gubun);
		System.out.println("22A : " + nowPage);
		System.out.println("22B : " + cntPerPage);
		System.out.println("22C : " + C);

		if (gubun == null || !gubun.equals("B")) {

			nowPage = "1";
			cntPerPage = "5";

			System.out.println("꾸뿐이 널일경우");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores2 = ss.getMapper(AdminMapper.class).getShopInfo2(p);

			request.setAttribute("paging2", p);
			request.setAttribute("Stores2", Stores2);

		} else {

			System.out.println("B일꼉우");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores2 = ss.getMapper(AdminMapper.class).getShopInfo2(p);

			request.setAttribute("paging2", p);
			request.setAttribute("Stores2", Stores2);
		}

	}

	public void shopInfo3(HttpServletRequest request, PagingVO p) {
		// 승인된 상점

		String gubun = request.getParameter("gubun");

		String nowPage = Integer.toString(p.getNowPage());
		String cntPerPage = Integer.toString(p.getCntPerPage());
		int total = ss.getMapper(AdminMapper.class).countStore2();
		p.setTotal(total);
		int C = p.getTotal();
		System.out.println("--grade4--------------------------------");
		System.out.println("--grade4gubun : " + gubun);
		System.out.println("--grade4A : " + nowPage);
		System.out.println("--grade4B : " + cntPerPage);
		System.out.println("--grade4C : " + C);

		if (gubun == null || !gubun.equals("C")) {

			nowPage = "1";
			cntPerPage = "5";

			System.out.println("꾸뿐이 널일경우--grade4");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores3 = ss.getMapper(AdminMapper.class).getShopInfo3(p);

			request.setAttribute("paging3", p);
			request.setAttribute("Stores3", Stores3);

		} else {

			System.out.println("C일꼉우--grade4");

			p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("D : " + p.getStart());
			System.out.println("E : " + p.getEnd());

			ArrayList<Store> Stores3 = ss.getMapper(AdminMapper.class).getShopInfo3(p);
			request.setAttribute("paging3", p);
			request.setAttribute("Stores3", Stores3);
		}

	}

	// 입점 거부&승인을 하는 메서드
	public void storeApprove(HttpServletRequest request, Member m) {

		String m_grade = request.getParameter("m_grade");
		String m_id = request.getParameter("m_id");

		System.out.println(m_grade);
		System.out.println(m_id);

		if (m_grade.equals("4")) {
			ss.getMapper(AdminMapper.class).deleteShop(m);
			System.out.println("삭제 메서드까지 옴");
		}

		ss.getMapper(AdminMapper.class).storeApprove(m);

	}

	public void getAllMembers(HttpServletRequest request, PagingVO p) {
		// 모든 회원 정보를 가져옴

		String nowPage = Integer.toString(p.getNowPage());
		String cntPerPage = Integer.toString(p.getCntPerPage());

		// 총 회원의 숫자 파악
		int total = ss.getMapper(AdminMapper.class).countMember();

		p.setTotal(total);

		int C = p.getTotal();
		System.out.println("총회원 수 :" + C);
		System.out.println("--회원정보--------------------------------");
		System.out.println("-회원정보-nowPage : " + nowPage);
		System.out.println("-회원정보-cntPerPage : " + cntPerPage);

		if (nowPage.equals("0") && cntPerPage.equals("0")) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage.equals("0")) {
			nowPage = "1";
		} else if (cntPerPage.equals("0")) {
			cntPerPage = "5";
		}
		System.out.println("2-회원정보-nowPage : " + nowPage);
		System.out.println("2-회원정보-cntPerPage : " + cntPerPage);

		
		p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//p.setStart(0);
		System.out.println("D : " + p.getStart());
		System.out.println("E : " + p.getEnd());
		List<Member> AllMembers = ss.getMapper(AdminMapper.class).getAllMember(p);

	
		
		request.setAttribute("paging", p);
		request.setAttribute("AllMembers", AllMembers);
	}

	// 회원 정보 수정
	public void memberRenem(HttpServletRequest request, Member m) {

		System.out.println("수정할 정보 ");
		System.out.println(m.getM_id());
		System.out.println(m.getM_pw());
		System.out.println(m.getM_name());
		System.out.println(m.getM_addr());
		System.out.println(m.getM_phone());
		System.out.println(m.getM_grade());
		System.out.println(m.getM_email());

		if (ss.getMapper(AdminMapper.class).memberRenew(m) >= 1) {
			request.setAttribute("result", "수정 성공");

		} else {
			request.setAttribute("result", "실패");

		}

	}

// 회원 정보 검색
	public void memberSeach(HttpServletRequest request, Member m, PagingVO p) {

		
	
		
		
		
		String option = request.getParameter("option");
		String Search_v = request.getParameter("Search_v");

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("Search_v", Search_v);

		if (option.equals("m_id")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByID(map);
			request.setAttribute("AllMembers", AllMembers);

		} else if (option.equals("m_name")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByName(map);
			request.setAttribute("AllMembers", AllMembers);

		} else if (option.equals("m_phone")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByPhone(map);
			request.setAttribute("AllMembers", AllMembers);

		} else if (option.equals("m_addr")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByAddr(map);
			request.setAttribute("AllMembers", AllMembers);

		} else if (option.equals("m_grade")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByGrade(map);
			request.setAttribute("AllMembers", AllMembers);

		} else if (option.equals("m_email")) {
			List<Member> AllMembers = ss.getMapper(AdminMapper.class).memberSeachByEmail(map);
			request.setAttribute("AllMembers", AllMembers);

		}

		
		
		
	
		
		
	}

	// 불편사항신고 목록
	public void complainManagement(HttpServletRequest request,PagingVO p) {

		String nowPage = Integer.toString(p.getNowPage());
		String cntPerPage = Integer.toString(p.getCntPerPage());

		// 총 회원의 숫자 파악
		int total = ss.getMapper(AdminMapper.class).countComplain();

		p.setTotal(total);

		int C = p.getTotal();
		System.out.println("총회원 수 :" + C);
		System.out.println("--회원정보--------------------------------");
		System.out.println("-회원정보-nowPage : " + nowPage);
		System.out.println("-회원정보-cntPerPage : " + cntPerPage);

		if (nowPage.equals("0") && cntPerPage.equals("0")) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage.equals("0")) {
			nowPage = "1";
		} else if (cntPerPage.equals("0")) {
			cntPerPage = "5";
		}
		System.out.println("2-회원정보-nowPage : " + nowPage);
		System.out.println("2-회원정보-cntPerPage : " + cntPerPage);

		
		p = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//p.setStart(0);
		System.out.println("D : " + p.getStart());
		System.out.println("E : " + p.getEnd());
		
		
		
		List<Complain> complains = ss.getMapper(AdminMapper.class).getComplains(p);
		request.setAttribute("complains", complains);
		request.setAttribute("paging", p);
	}

	// 불편사항 처리 상태 분류
	public void complainHandle(HttpServletRequest request, Complain c) {

		System.out.println("여기까지는 온다---불만요청처리");
		System.out.println("" + c.getC_no());
		System.out.println("" + c.getC_state());

		String aa = request.getParameter("c_state");
		System.out.println(aa);

		if (c.getC_state().equals("2")) {
			ss.getMapper(AdminMapper.class).complainHandle_S(c);

		} else if (c.getC_state().equals("3")) {
			ss.getMapper(AdminMapper.class).complainHandle_C(c);

		} else if (c.getC_state().equals("4")) {
			ss.getMapper(AdminMapper.class).complainHandle_P(c);

		}

	}

	// 불만사항 검색
	public void complainSearch(HttpServletRequest request) {

		HashMap<String, String> c_map = new HashMap<String, String>();

		String option_c = request.getParameter("option");
		String seach_C = request.getParameter("seach_C");

		System.out.println("불만사항 검색분류값:" + option_c);
		System.out.println("불만 사항 검색키워드" + seach_C);

		c_map.put("seach_C", seach_C);

		System.out.println(c_map.get("seach_C"));

		if (option_c.equals("c_id")) {
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch1(c_map);
			request.setAttribute("complains", complains);

		} else if (option_c.equals("c_content")) {
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch2(c_map);
			request.setAttribute("complains", complains);
			
		} else if (option_c.equals("c_phone")) {
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch3(c_map);
			request.setAttribute("complains", complains);
			
			
			
		} else if (option_c.equals("c_email")) {
			
			
			
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch4(c_map);
			request.setAttribute("complains", complains);
			
		} else if (option_c.equals("c_reason")) {
			
			
			if (c_map.get("seach_C").contains("사용")||c_map.get("seach_C").contains("유저")) {
				c_map.put("seach_C", "otherUser");
				System.out.println("여기 오나?");	
				
			}else if (c_map.get("seach_C").contains("거래")) {
				c_map.put("seach_C", "contrects");
				System.out.println("여기 오나?");				
				
			}else if (c_map.get("seach_C").contains("계정")) {
				c_map.put("seach_C", "accounts");
				System.out.println("여기 오나?");				
				
			}else if (c_map.get("seach_C").contains("기")) {
				c_map.put("seach_C", "ETC");
				System.out.println("여기 오나?");				
				
			}
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch5(c_map);
			request.setAttribute("complains", complains);
			
		} else if (option_c.equals("c_state")) {
			
			if (seach_C.equals("접수")) {
				c_map.put("seach_C", "1");
				
			}else if (seach_C.equals("처리 중")) {
				c_map.put("seach_C", "2");
				
			}else if (seach_C.equals("처리완료")) {
				c_map.put("seach_C", "3");
				
			}else if (seach_C.equals("보류")) {
				c_map.put("seach_C", "4");
				
			}
			
			List<Complain> complains = ss.getMapper(AdminMapper.class).complainSearch6(c_map);
			request.setAttribute("complains", complains);

		}

	}


	
	
}
