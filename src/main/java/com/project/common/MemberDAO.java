package com.project.common;

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
	private Member member;
	
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
		
		ss.insert("com.project.common.MemberMapper.insertPhoneKey", mpk);
		
	}
	
	//마찬가지(핸드폰 인증 관련)
	public boolean compareKey(MemberPhoneKey mpk) {
		// TODO Auto-generated method stub
		ss.getConnection();
		
		
		List<MemberPhoneKey> l_mpk = ss.selectList("com.project.common.MemberMapper.compareKey", mpk);
		String dbKey = l_mpk.get(0).getM_p_id();
		String inputKey = mpk.getM_p_id();
		
		if(dbKey.equals(inputKey)) {
		mpk.setM_p_successInfo("true");
		ss.update("com.project.common.MemberMapper.updateSuccessInfo", mpk);
			return true;
		}
		else {
			return false;
		}
				
				
				
	}
	
	
	public boolean checkSuccessInfo(MemberPhoneKey mpk) {
		// TODO Auto-generated method stub
		List<MemberPhoneKey> list_mpk = ss.getMapper(MemberMapper.class).checkSuccessInfo(mpk);
		
		if (list_mpk.size()==1) {
			if (list_mpk.get(0).getM_p_successInfo().equals("true")) {
				return true;
			}
			
		}
			return false;
		
		
	}
		//이메일 인증관련 메소드
	public boolean updateMemberInfo(TempMemberInfo tmi) {
		// TODO Auto-generated method stub
		
		if(ss.getMapper(MemberMapper.class).updateTempMemberInfo(tmi)==1) {
			return true;
		}
		else {
			return false;
		}
		
		
	}
	
	
		//회원가입 부분(수정 필요)
	public void regin(HttpServletRequest request) throws IOException {
		
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
			ss.getMapper(MemberMapper.class).insertTempInfo(tmp);
			System.out.println("성공");
		}
		else {
			System.out.println("실패");
		}
		
		
	}



	


	
	


}
