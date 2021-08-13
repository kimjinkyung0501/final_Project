package com.project.jk.common;


import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class UserMailSendService {

	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private JavaMailSender mailsender;
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	   // 회원가입 발송 이메일(인증키 발송)
	   public void mailSendWithUserKey(TempMemberInfo tmi, HttpServletRequest request) {

	      String t_m_key = getKey(false, 20);
	      System.out.println(t_m_key);
	      String t_m_id = tmi.getT_m_id();
	      String t_m_email = tmi.getT_m_email();
	      
	      
	      tmi.setT_m_id(t_m_id);
	      tmi.setT_m_email(t_m_email);
	      
	      tmi.setT_m_key(t_m_key);
	      MemberMapper mm = ss.getMapper(MemberMapper.class);
	      mm.insertKey(tmi); 
	      //GetKey 라는 인터페이스가 있나보네
	      MimeMessage mail = mailsender.createMimeMessage();
	      String htmlStr = "<h2>안녕하세요 소상공인 장터입니다.</h2><br><br>" 
	            + "<h3>" + t_m_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
	            + "<a href='http://localhost:80" + request.getContextPath() + "/common/key_alter?user_id="+ t_m_id +"&user_key="+t_m_key+"&user_email="+t_m_email+"'>인증하기</a></p>"
	            + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
	      try {
	         mail.setSubject("[본인인증] 회원가입 인증메일입니다", "utf-8");
	         mail.setText(htmlStr, "utf-8", "html");
	         mail.addRecipient(RecipientType.TO, new InternetAddress(t_m_email));
	         mailsender.send(mail);
	      } catch (MessagingException e) {
	         e.printStackTrace();
	      }
	      
	      // 아마존 주소 : http://54.180.117.142/MS/user/key_alter?user_id=
	      
	   }
	// 이메일 난수 만드는 메서드

//[출처] Spring 이메일 인증 방법 + 데이터베이스 추가|작성자 순남2
	
	
	
	
	   public void mailSendId(Member returnMember, HttpServletRequest request) {
		      
		      String m_id = returnMember.getM_id();
		      String m_email = returnMember.getM_email();
		      MimeMessage mail = mailsender.createMimeMessage();
		      String htmlStr = "<h2>안녕하세요 소상공인 장터입니다.</h2><br><br>" 
		                  +"<span>회원 님의 아이디는 " + m_id + "입니다.</span>";
		      try {
		         mail.setSubject("요청하신 회원님의 아이디입니다.", "utf-8");
		         mail.setText(htmlStr, "utf-8", "html");
		         mail.addRecipient(RecipientType.TO, new InternetAddress(m_email));
		         mailsender.send(mail);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      
		      
		   }
		   
		   public void mailSendPw(Member returnMember, HttpServletRequest request) {
		      // TODO Auto-generated method stub
		      String tempPw = returnMember.getM_pw();
		      String m_id = returnMember.getM_id();
		      String m_email = returnMember.getM_email();
		      
		      MimeMessage mail = mailsender.createMimeMessage();
		      String htmlStr = "<h2>안녕하세요 소상공인 장터입니다.</h2><br><br>" 
		            + "<h3>" + m_id + "님</h3>" + "<p>임시 비밀번호는 " + tempPw +"입니다."
		            + "회원 정보 수정 페이지에서 비밀번호를 변경해주세요"
		            + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		      try {
		         mail.setSubject("요청하신 회원님의 임시 비밀번호입니다..", "utf-8");
		         mail.setText(htmlStr, "utf-8", "html");
		         mail.addRecipient(RecipientType.TO, new InternetAddress(m_email));
		         mailsender.send(mail);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      
		   }
	
	
	
	
	
	
	
	
	
	
}
