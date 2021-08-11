package com.project.jk.common;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Service
public class MemberDAO {


	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private TempMemberInfo tmp;
	
	
	
	//아직 사용은 안하는 중
	public boolean loginCheck(HttpSession session, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("member_session");
		if (member != null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//로그인 기능
	public boolean login(Member member, HttpServletRequest request) {
		
		String member_pw = member.getM_pw();
		Member memberInfo = ss.getMapper(MemberMapper.class).loginCheck(member);
		String member_dbpw = memberInfo.getM_pw();
		
		
		if(member_dbpw.equals(member_pw)) {
			HttpSession ss = request.getSession();
			ss.setAttribute("member_session", memberInfo);
			int login_number = 1;
			ss.setAttribute("login_number", login_number);
			return true;
		}
		else {
			return false;
		}
		
		
	}
	
	//로그아웃(세션 삭제)
	public void logout(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		session.removeAttribute("member_session");
		session.removeAttribute("login_number");
		session.invalidate();
		
	}
	
	//아이디 중복체크 부분
	public boolean checkId(Member m) {
		try {
			List<Member> member = ss.getMapper(MemberMapper.class).checkId_select(m);
			if (member.size() == 1) {
				return false;
			} else if (member.size() == 0) {
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return false;
	}

	//핸드폰 인증 관련(수정 필요 깊게 보지마요)
	public void insertPhoneKey(String key, String userPhoneNumber) {
		// TODO Auto-generated method stub
		ss.getConnection();
		String m_p_successInfo = "false";//아직 핸드폰 미인증 상태
		MemberPhoneKey mpk = new MemberPhoneKey(0, userPhoneNumber, key, m_p_successInfo);
		//유저 넘버, 핸드폰 번호, 휴대폰 번호 누르고 인증 눌렀을 떄 설정되는 값, 인증 상태 여부
		ss.insert("com.project.common.MemberMapper.insertPhoneKey", mpk);
		
	}
	
	//마찬가지(핸드폰 인증 관련)
	public boolean compareKey(MemberPhoneKey mpk) {
		// TODO Auto-generated method stub
		ss.getConnection();
		
		
		List<MemberPhoneKey> l_mpk = ss.selectList("com.project.common.MemberMapper.compareKey", mpk);
		//유저가 입력한 핸드폰 번호의 인증번호를 불러옴
		String dbKey = l_mpk.get(0).getM_p_id();
		//db에서 가져온 인증번호를 넣어둠
		String inputKey = mpk.getM_p_id();
		//사용자가 입력한 인증번호
		
		if(dbKey.equals(inputKey)) {
		//db에 미리 설정된 인증번호와 유저가 입력한 번호가 일치시
		mpk.setM_p_successInfo("true");
		//mpk 변수의 인증 상태 속성에 true를 설정
		ss.update("com.project.common.MemberMapper.updateSuccessInfo", mpk);
		//휴대폰 인증상태를 "true"로 업데이트
			return true;
		}
		else {
			return false;
		}
				
				
				
	}
	
	//회원가입의 제출 버튼 클릭시 실행되는 메소드
	public boolean checkSuccessInfo(MemberPhoneKey mpk) {
		// TODO Auto-generated method stub
		List<MemberPhoneKey> list_mpk = ss.getMapper(MemberMapper.class).checkSuccessInfo(mpk);
		//사용자의 휴대폰 번호의 인증상태를 불러와서 담음
		
		if (list_mpk.size()==1) {
			if (list_mpk.get(0).getM_p_successInfo().equals("true")) {
				//true일 경우 true를 리턴
				return true;
			}
			
		}
			return false;
		
		
	}
	
	
		//회원가입 부분(수정 필요)
	public void regin(HttpServletRequest request, Member member) throws IOException {
		
		String saveDirectory = request.getSession().getServletContext().getRealPath("resources/img");
		System.out.println(saveDirectory);
		int sizeLimit = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String m_id = mr.getParameter("m_id");
		String m_pw = mr.getParameter("m_pw");
		String m_name = mr.getParameter("m_name");
		String m_addr = mr.getParameter("m_addr");
		String m_addr2 = mr.getParameter("m_addr2");
		
		m_addr = m_addr + "!" + m_addr2;
		
		String m_phone = mr.getParameter("m_phone");
		String m_email = mr.getParameter("m_email");
		String m_photo = mr.getFilesystemName("m_photo");
		int m_grade = 1;
		//멤버 등급, 처음은 무조권 1을 넣은 후 판매자 신청 통과 시 2로 변경되게 설정할 예정
		
		member.setM_id(m_id);
		member.setM_pw(m_pw);
		member.setM_name(m_name);
		member.setM_addr(m_addr);
		
		member.setM_phone(m_phone);
		member.setM_email(m_email);
		member.setM_photo(m_photo);
		member.setM_grade(m_grade);
		
		tmp.setT_m_id(m_id);
		tmp.setT_m_email(m_email);
		tmp.setT_m_key("n");
		
		if (ss.getMapper(MemberMapper.class).regMember(member) == 1) {
			//성공적으로 멤버 등록 완료시
			ss.getMapper(MemberMapper.class).insertTempInfo(tmp);
			//임시 멤버 테이블에 아이디, 이메일, "no"를 넣음
			//인증 메일에서 "인증 하기" 버튼 누를 시 "y"로 바뀌게 구현
			System.out.println("성공");
		}
		else {
			System.out.println("실패");
		}
		
		
	}
	
	//이메일을 받고 인증하기 버튼 클릭 시 실행되는 메소드
	public boolean updateMemberInfo(TempMemberInfo tmi) {
		// TODO Auto-generated method stub
		
		if(ss.getMapper(MemberMapper.class).updateTempMemberInfo(tmi)==1) {
			//해당하는 멤버 아이디의 key값을 "y"로 변경
			return true;
		}
		else {
			return false;
		}
		
		
	}
	
	
	//회원 정보 사이트에서 이름 바꾸는 메소드
	public void changeName(DataChangeBean dcb, HttpServletRequest request) {
		// TODO Auto-generated method stub
		ss.getMapper(MemberMapper.class).changeName(dcb);
		Member member = (Member) request.getSession().getAttribute("member_session");
		System.out.println(member.getM_name());//기존에 DB에 있는 값
		String newName = dcb.getNewData();
		System.out.println(newName);			//새로 입력한 
		member.setM_name(newName);
		request.getSession().setAttribute("member_session", member);
		//다시 담아주면 되나?
		//되네요
		
	}

	public void changeId(DataChangeBean dcb, HttpServletRequest request) {
		ss.getMapper(MemberMapper.class).changeId(dcb);
		Member member = (Member) request.getSession().getAttribute("member_session");
		member.setM_id(dcb.getNewData());
		request.getSession().setAttribute("member_session", member);
	}

	
	public boolean comparePw(String inputPw, HttpServletRequest request, Member session_member) {
		// TODO Auto-generated method stub
		
		session_member.setM_pw(inputPw);
		if (ss.getMapper(MemberMapper.class).comparePw(session_member) != null) {
			return true;
		}
		else {
			return false;
		}
	
	}

	public void changePw(String newPw, Member member, HttpServletRequest request) {
		// TODO Auto-generated method stub
		Member member_session = (Member) request.getSession().getAttribute("member_session");
		member_session.setM_pw(newPw);
		ss.getMapper(MemberMapper.class).changePw(member_session);
		
		request.getSession().setAttribute("member_session", member_session);
		
		
	}

	public void changeProfile(Member member, HttpServletRequest request) {
		
		Member member_session = (Member) request.getSession().getAttribute("member_session");
		String m_photo = member.getM_photo();
		member_session.setM_photo(m_photo);
		
		
		ss.getMapper(MemberMapper.class).changeProfile(member_session);
		
		
		
	}
	


	
	


}
