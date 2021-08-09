package com.project.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class HomeController {
	
	
	@Autowired
	private MemberDAO dao;	
	
	
	@Autowired
	private UserMailSendService mailsender;
	
	
	@RequestMapping(value = "/go", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		Member member_session = (Member) request.getSession().getAttribute("member_session");
		request.setAttribute("member_session", member_session);
		return "home";
	}
	
	@RequestMapping(value = "/toOrderPage.go")
	public String toOrderPage(HttpServletRequest request) {
		request.setAttribute("contentPage", "myPageFolder/orderPage.jsp");
		
		return "memberPage/myPage";
	}
	@RequestMapping(value = "/toCart.go")
	public String toCart(HttpServletRequest request) {
		request.setAttribute("contentPage", "myPageFolder/cartPage.jsp");
		return "memberPage/myPage";
	}
	@RequestMapping(value = "/changeInfo.go")
	public String toChangeInfo(HttpServletRequest request) {
		request.setAttribute("contentPage", "myPageFolder/infoChangePage.jsp");
		return "memberPage/myPage";
	}
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginPage() {
		
		return "memberPage/loginPage";
	}
	
	@RequestMapping(value = "/regin.go", method = RequestMethod.GET)
	public String reginPage() {
		
		return "memberPage/reginPage";
	}
	
	
	@RequestMapping(value = "/myPage.go")
	public String mypageGo(HttpServletRequest request, HttpSession session) {
		dao.loginCheck(session, request);
		
		request.setAttribute("contentPage","myPageFolder/simplePage.jsp");
		return "memberPage/myPage";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean loginDo(Member member, HttpServletRequest request) {
		
		
		return dao.login(member, request);
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
		dao.logout(request, session);
		
		return "home";
	}
	
	
	@RequestMapping(value = "/regin.do", method = RequestMethod.POST)
	public String regin(HttpServletRequest request) throws IOException {
		dao.regin(request);
		
		return "memberPage/loginPage";
	}
	
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkId(Member m) {
		return dao.checkId(m);
		
		
	}
	
	
	@RequestMapping(value = "checkPhoneKey.go", method = RequestMethod.GET)
	public String checkPhoneKey() {
		
		return "memberPage/phoneCer";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendSNS", method = RequestMethod.POST)
	public HashMap<String, String> sendSMS(String userPhoneNumber) throws Exception { // 휴대폰 문자보내기
		
		String commandPhoneNumber = "01032084487";
		String api_key = "NCSCZ7JDQ0T5WPB1";
	    String api_secret = "Z5RMQUNF0ZPS2TYAUQB4FJQTUGD2MUUO";
	    String getNumber = NumberGen.createNumber(6, 2);
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    HashMap<String, String> sendPhoneNumber = new HashMap<String, String>();

	    params.put("to", userPhoneNumber);
	    params.put("from", commandPhoneNumber);
	    params.put("type", "SMS");
	    params.put("text", "인증번호는" + getNumber + "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    dao.insertPhoneKey(getNumber, userPhoneNumber);
	    sendPhoneNumber.put("phoneNumber", userPhoneNumber);
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    return sendPhoneNumber;
	}
	
	@ResponseBody
	@RequestMapping(value = "/compareKey", method = RequestMethod.POST)
	public boolean compareKey(MemberPhoneKey mpk) {
		
		//일치하면 true 일치하지 않으면 false를 리턴
		return dao.compareKey(mpk);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkSuccessInfo.do", method = RequestMethod.GET)
	public boolean checkSuccessInfo(MemberPhoneKey mpk) {
		System.out.println("여기 오니");
		
		return dao.checkSuccessInfo(mpk);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendEmail.do", method = RequestMethod.GET)
	public void sendEmail(TempMemberInfo tmi, HttpServletRequest request) {
		System.out.println(request.getParameter("t_m_id"));
		System.out.println(request.getParameter("t_m_email"));
		
		mailsender.mailSendWithUserKey(tmi, request);
	}
	
	
	//사용자가 이메일 인증 완료시 들어오는 부분
	@RequestMapping(value = "/key_alter")
	public String alterUserKey(@RequestParam("user_id")String m_id, @RequestParam("user_key")String m_key) {
		
		TempMemberInfo tmi = new TempMemberInfo();
		tmi.setT_m_id(m_id);
		tmi.setT_m_key(m_key);
		dao.updateMemberInfo(tmi);
		
		return "memberPage/emailResult";
	}
	
	
}
