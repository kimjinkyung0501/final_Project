package com.project.jk.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
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
	private KakaoService kakaoService;

	@Autowired
	private UserMailSendService mailsender;

	int count = 0;

	@RequestMapping(value = "common/login.main", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model, HttpSession session) throws IOException {

		dao.loginCheck(session, request);
		request.setAttribute("contentPage", "loginHome.jsp");
		return "index";

	}

	@RequestMapping(value = "/common/toOrderPage.go")
	public String toOrderPage(HttpServletRequest request) {
		dao.confirmedOrder(request);
		dao.orderPagin(request, 1);
		request.setAttribute("contentPage", "memberPage/myPageFolder/orderPage.jsp");
		return "index";
	}

	@RequestMapping(value = "common/orderPageController")
	public String orderPageController(HttpServletRequest request) {
		int p = Integer.parseInt(request.getParameter("p"));
		dao.orderPagin(request, p);
		request.setAttribute("contentPage", "memberPage/myPageFolder/orderPage.jsp");
		return "index";
	}

	@RequestMapping(value = "common/cartPageController")
	public String carPageController(HttpServletRequest request) {
		int p = Integer.parseInt(request.getParameter("p"));
		dao.pagin(request, p);

		request.setAttribute("contentPage", "memberPage/myPageFolder/cartPage.jsp");
		return "index";
	}

	@RequestMapping(value = "/common/take.class")
	public String take_a_class(HttpServletRequest request, HttpSession session) {
		dao.loginCheck(session, request);
		dao.getLessonList(request);
		request.setAttribute("contentPage", "memberPage/myPageFolder/lessonListPage.jsp");
		return "index";
	}

	@RequestMapping(value = "/common/seeMovie.go")
	public String seeMovie(@RequestParam("l_no") int l_no, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		dao.seeMovie(l_no, request, response);
		request.setAttribute("contentPage", "memberPage/myPageFolder/seeMovie.jsp");
		return "index";
	}

	@RequestMapping(value = "common/changeInfo.go")
	public String toChangeInfo(HttpServletRequest request, HttpSession session) {

		if (dao.loginCheck(session, request)) {
			request.setAttribute("contentPage", "memberPage/myPageFolder/infoChangePage.jsp");
			return "index";
		} else {

			request.setAttribute("contentPage", "loginHome.jsp");
			return "index";
		}

	}

	@RequestMapping(value = "common/regin.go", method = RequestMethod.GET)
	public String reginPage(HttpServletRequest request) {

		request.setAttribute("contentPage", "memberPage/reginPage.jsp");
		return "index";
	}

	// 회원가입 할 때 오는 컨트롤러
	@RequestMapping(value = "common/regin.do", method = RequestMethod.POST)
	public String regin(HttpServletRequest request, Member member) throws IOException {
		dao.regin(request, member);

		request.setAttribute("contentPage", "loginHome.jsp");
		return "index";
	}

	//마이페이지로 이동하는 컨트롤러
	@RequestMapping(value = "common/myPage.go")
	public String mypageGo(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		dao.loginCheck(session, request);
		dao.getCompletedOrderAnLesson(request, response);

		request.setAttribute("contentPage", "memberPage/myPageFolder/simplePage.jsp");
		return "index";
	}
	
	//패스워드를 변경할 때 오는 컨트롤러
	@RequestMapping(value = "common/changePw.go")
	public String changePwGo(HttpServletRequest request) {

		request.setAttribute("contentPage", "memberPage/myPageFolder/PwChangePage.jsp");

		return "index";
	}

	@RequestMapping(value = "common/openId.go")
	public String openId(HttpServletRequest request) {
		request.setAttribute("contentPage", "memberPage/searchMemberInfo/searchId.jsp");
		return "index";
	}

	@RequestMapping(value = "common/openPw.go")
	public String openPw(HttpServletRequest request) {
		request.setAttribute("contentPage", "memberPage/searchMemberInfo/searchPw.jsp");
		return "index";
	}

	// 주소 등록하는 페이지로 이동하기 위한 부분
	@RequestMapping(value = "common/regAddr.go")
	public String regAddr(HttpServletRequest request) {

		request.setAttribute("contentPage", "memberPage/myPageFolder/regAddr.jsp");
		return "index";
	}

	// 주소를 등록하기 위한 부분
	@RequestMapping(value = "common/regAddr.do", method = RequestMethod.POST)
	public String regAddrDo(HttpServletRequest request, Member member) {

		dao.regAddr(request, member);
		request.setAttribute("contentPage", "memberPage/myPageFolder/simplePage.jsp");
		return "index";
	}

	// 비밀번호를 찾기 위해서 사용하는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "common/searchPw.do", method = RequestMethod.POST)
	public boolean searchPw(Member member, HttpServletRequest request) {
		String tempPw = mailsender.getKey(false, 6);
		// 6자리의 임시 비밀번호 생성

		if (dao.searchIdByNameAndEmail(member, request)) {
			// 해당하는 이름과 이메일이 있을 경우에 실행
			dao.changePwWithTempPw(tempPw, member, request);
			// 현재 비밀번호를 임시 비밀번호로 바꾸는 메소드

			// searchIdByNameAndEmail에서 담은 멤버 정보를 가지고 옴
			Member returnMember = (Member) request.getAttribute("returnMember");

			// 그 회원의 객체의 m_pw 속성에 임시 비밀번호를 담음
			returnMember.setM_pw(tempPw);

			// 임시비밀번호를 회원의 이메일로 보냄
			mailsender.mailSendPw(returnMember, request);
			return true;
		} else {
			return false;
		}
	}

	@ResponseBody
	@RequestMapping(value = "common/searchId.do", method = RequestMethod.POST)
	public boolean searchId(Member member, HttpServletRequest request) {
		member.getM_name();
		member.getM_email();
		if (dao.searchIdByNameAndEmail(member, request)) {
			Member returnMember = (Member) request.getAttribute("returnMember");
			mailsender.mailSendId(returnMember, request);
			return true;
		} else {
			return false;
		}
	}
	
	
	//핸드폰을 활용한 아이디 인증 부분
	@ResponseBody
	@RequestMapping(value = "common/searchIdByPhone.do")
	public boolean searchIdByPhone(Member member) {
		return dao.searchIdByPhone(member);
	}

	@RequestMapping(value = "common/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Boolean loginDo(Member member, HttpServletRequest request) {
		return dao.login(member, request);

	}

	// ajax를 사용하여 사용자가 입력한 비밀번호를 실시간으로 비교하는 부분
	@ResponseBody
	@RequestMapping(value = "common/comparePw.do", method = RequestMethod.POST)
	public boolean comparePw(@RequestParam(value = "m_pw") String inputPw, HttpServletRequest request) {
		Member session_member = (Member) request.getSession().getAttribute("member_session");
		// boolean자료형으로 리턴을 시켜 ajax에서 받아서 사용
		return dao.comparePw(inputPw, request, session_member);
	}

	@RequestMapping(value = "common/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {

		dao.logout(request, session);

		request.setAttribute("contentPage", "loginHome.jsp");
		return "index";
	}

	// 아이디 중복 체크 할 때의 컨트롤러
	@RequestMapping(value = "common/checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkId(Member m) {
		return dao.checkId(m);

	}

	@RequestMapping(value = "common/checkPhoneKey.go", method = RequestMethod.GET)
	public String checkPhoneKey() {

		return "memberPage/phoneCer";
	}

	@ResponseBody
	@RequestMapping(value = "common/changeName.do")
	public String changeName(DataChangeBean dcb, HttpServletRequest request) {
		dao.changeName(dcb, request);
		request.setAttribute("contentPage", "memberPage/myPageFolder/infoChangePage.jsp");
		return "index";
	}

	// 회원 정보 수정에서 비밀번호를 변경할 때 오는 부분
	@RequestMapping(value = "common/changePw.do", method = RequestMethod.POST)
	public String changePwDo(@RequestParam(value = "newPw") String newPw, Member member, HttpServletRequest request) {
		dao.changePw(newPw, member, request);
		request.setAttribute("contentPage", "memberPage/myPageFolder/infoChangePage.jsp");
		return "index";
	}

	//ID중복 체크를 할 때 수행되는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "common/idCheck.do")
	public boolean checkId(HttpServletRequest request, Member member) {
		return dao.idCheck(request, member);
	}

	// 8월 24일 수정
	@RequestMapping(value = "common/changeProfile.do", method = RequestMethod.POST)
	public String changeProfile(HttpServletRequest request) throws IOException {

		dao.changePhoto(request);
		String oldPhoto = (String) request.getAttribute("oldPhoto");
		dao.deleteOldPhoto(oldPhoto, request);
		request.setAttribute("contentPage", "memberPage/myPageFolder/simplePage.jsp");
		return "index";
	}

	
	@ResponseBody
	@RequestMapping(value = "common/compareId.do", method = RequestMethod.POST)
	public boolean compareId(Member member, HttpServletRequest request) {
		return dao.compareId(member, request);
	}

//   여기서부터는 API 메소드들
	@ResponseBody
	@RequestMapping(value = "common/sendSNS", method = RequestMethod.POST)
	public HashMap<String, String> sendSMS(String userPhoneNumber) throws Exception { // 휴대폰 문자보내기

		String commandPhoneNumber = "01051500376";
		String api_key = "NCSMCBDHSHNCLYQH";
		String api_secret = "9LCZRYM8BDU1MEJOCHAIRTZB4ZECWGVW";
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

	//아이디 찾을 때 핸드폰 인증하는 부분
	@ResponseBody
	@RequestMapping(value = "common/sendSNS.searchId", method = RequestMethod.POST)
	public void sendSNS(String userPhoneNumber) throws Exception { // 휴대폰 문자보내기

		String commandPhoneNumber = "01051500376";
		String api_key = "NCSMCBDHSHNCLYQH";
		String api_secret = "9LCZRYM8BDU1MEJOCHAIRTZB4ZECWGVW";
		String getNumber = NumberGen.createNumber(6, 2);
		Message coolsms = new Message(api_key, api_secret);
		
		System.out.println(getNumber);
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();

		params.put("to", userPhoneNumber);
		params.put("from", commandPhoneNumber);
		params.put("type", "SMS");
		params.put("text", "인증번호는" + getNumber + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		dao.insertPhoneKey(getNumber, userPhoneNumber);

		try {
			// 여기가 메세지 보내는 기능
			JSONObject obj = (JSONObject) coolsms.send(params);

			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	@ResponseBody
	@RequestMapping(value = "common/sendSNS.searchPw", method = RequestMethod.POST)
	public void sendSNSforPw(String userPhoneNumber) throws Exception { // 휴대폰 문자보내기

		String commandPhoneNumber = "01051500376";
		String api_key = "NCSMCBDHSHNCLYQH";
		String api_secret = "9LCZRYM8BDU1MEJOCHAIRTZB4ZECWGVW";
		String getNumber = NumberGen.createNumber(6, 2);
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();

		params.put("to", userPhoneNumber);
		params.put("from", commandPhoneNumber);
		params.put("type", "SMS");
		params.put("text", "인증번호는" + getNumber + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		dao.insertPhoneKey(getNumber, userPhoneNumber);

		try {
			// 여기가 메세지 보내는 기능
			JSONObject obj = (JSONObject) coolsms.send(params);

			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	@ResponseBody
	@RequestMapping(value = "common/submitOrder.do", method = RequestMethod.POST)
	public boolean submitOrder(HttpServletRequest request) {
		ArrayList<OrderPage> orderList = dao.submitOrder(request);

		return dao.regP_order(orderList, request);
	}
	
	
	//아이디 찾기에서 핸드폰 인증 중 사용자가 입력한 키값과 데이터베이스의 키값이
	//일치하는지 여부를 확인
	@ResponseBody
	@RequestMapping(value = "common/compareKey", method = RequestMethod.POST)
	public boolean compareKey(MemberPhoneCheck mpk) {

		// 인증이 성공적으로 수행될 경우 true가 리턴, 실패 시 false
		// compareKey.js의 $('.submitKey').click 함수의 success : function()로 데이터를 넘김
		return dao.compareKey(mpk);
	}

	// 회원가입 화면에서 가입버튼을 눌렀을 때 오는 컨트롤러 부분
	@ResponseBody
	@RequestMapping(value = "common/checkSuccessInfo.do", method = RequestMethod.POST)
	public boolean checkSuccessInfo(@RequestParam("m_id") String m_id, @RequestParam("m_phone") String m_phone) {
		// 인증상태가 완료되어있을 경우 true, 아니면 false가 리턴됨
		// Valid.js의 $('.reginBtn').click 함수의 success : function()로 데이터를 넘김
		System.out.println(m_id);
		System.out.println(m_phone);

		// boolean상태로 값을 반환
		return dao.checkSuccessInfo(m_id, m_phone);
	}

	@ResponseBody
	@RequestMapping(value = "common/sendEmail.do", method = RequestMethod.GET)
	public boolean sendEmail(TempMemberInfo tmi, HttpServletRequest request) {
		if (dao.emailCheck(tmi)) {
			// 안에 계정이 없으면 true를 리턴을 하게 되고 아래의 메일 보내는 메소드를 실행
			mailsender.mailSendWithUserKey(tmi, request);
			// 그리고 ajax $(.checkEmail) 부분으로 리턴
			return true;
		} else {
			return false;
		}
	}

	
	//회원이 등록한 핸드폰을 활용하여 아이디를 이메일로 보내는 부분
	@ResponseBody
	@RequestMapping(value = "common/sendEmail.checkId", method = RequestMethod.GET)
	public boolean sendEmailForCheckId(Member member, HttpServletRequest request) {
		return mailsender.sendIdPhoneCheck(member, request);
	}

	// 핸드폰을 활용하여 회원 비밀번호를 찾는(임시 비밀번호를 보내는)기능
	@ResponseBody
	@RequestMapping(value = "common/sendEmail.checkPw", method = RequestMethod.GET)
	public boolean sendEmailForCheckPW(Member member, HttpServletRequest request) {
		// 임시 비밀번호를 생성함
		String tempPw = mailsender.getKey(false, 6);

		// 유저가 현재 사용하고 있는 이메일을 리턴값으로 받아와 담음
		String userEmail = dao.getUserEmail(member);
		// 해당 이메일을 맴거 객체에 세팅을 함
		member.setM_email(userEmail);
		// 회원 테이블의 비밀번호를 임시 비밀번호로 업데이트를 하는 부분
		dao.changePwWithTempPw(tempPw, member, request);

		return mailsender.mailSendTempPw(tempPw, member, request);
	}

	@ResponseBody
	@RequestMapping(value = "common/newEmailSend.do", method = RequestMethod.GET)
	public boolean newEmailSend(TempMemberInfo tmi, HttpServletRequest request) {
		if (dao.emailCheck(tmi)) {
			// 멤버들 중에 해당하는 이메일을 사용하는 계정이 없으면 아래의 메소드가 실행
			dao.deleteOldEmail(tmi);
			// 전에 사용하던 이메일의 임시 정보를 삭제
			mailsender.changeEmailSend(tmi, request);
			// 그리고 ajax $(.checkEmail) 부분으로 리턴
			return true;
		} else {
			return false;
		}
	}

	// 사용자가 이메일 인증 버튼 클릭 시 이 쪽으로 들어오게 됨
	@RequestMapping(value = "common/key_alter")
	public String alterUserKey(@RequestParam("user_id") String m_id, @RequestParam("user_key") String m_key,
			@RequestParam("user_email") String m_email, HttpServletRequest request) {
		// 이 메소드는 파라미터로 user_id, user_email, user_key를 가지고 있음
		TempMemberInfo tmi = new TempMemberInfo();
		tmi.setT_m_id(m_id);
		tmi.setT_m_key(m_key);
		tmi.setT_m_email(m_email);
		// tmi 객체를 생성하고 파라미터 값을 세팅
		dao.updateMemberInfo(tmi); // 임시 멤버 테이블 업데이트 메소드

		return "loading"; // 수정한 부분, 자료형도 String으로 바꿔줭

	}

	// 새로운 이메일을 인증할 때 들어오는 부분
	@RequestMapping(value = "common/changeEmail")
	public String changeEmail(@RequestParam("user_id") String m_id, @RequestParam("user_key") String m_key,
			@RequestParam("user_email") String m_email, HttpServletRequest request) {
		// 이 메소드는 파라미터로 user_id, user_email, user_key를 가지고 있음
		TempMemberInfo tmi = new TempMemberInfo();
		tmi.setT_m_id(m_id);
		tmi.setT_m_key(m_key);
		tmi.setT_m_email(m_email);
		System.out.println(m_email);
		// tmi 객체를 생성하고 파라미터 값을 세팅
		dao.updateMemberInfo(tmi); // 임시 멤버 테이블 업데이트 메소드
		dao.memberEmailChange(tmi, request); // 멤버 테이블 이메일 바꾸는 메소드

		request.setAttribute("contentPage", "loading.jsp");
		return "index";
	}

	@ResponseBody
	@RequestMapping(value = "common/checkTempInfo.do")
	public boolean checkTempInfo(@RequestParam("m_email") String m_email, HttpServletRequest request) {
		return dao.checkTempInfo(m_email, request);
	}

	// 카카오톡 로그인 기능
	@RequestMapping(value = "/common/kakao.login")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request,
			HttpSession session) {
		System.out.println("#########" + code);
		if (count == 0) {
			// 동일한 인증 코드로 두 번이상 요청시 400에러가 발생함
			String access_Token = kakaoService.getAccessToken(code);

			HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token, request, session);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###userInfo#### : " + userInfo.get("account_email"));
			System.out.println("###nickname#### : " + userInfo.get("profile_nickname"));
			System.out.println("###profile_image#### : " + userInfo.get("profile_image"));

			count++;

			request.setAttribute("contentPage", "home.jsp");
			return "index";
		} else {
			request.setAttribute("contentPage", "loginHome.jsp");
			return "index";
		}

	}

	// 서비스 로그아웃이든 계정까지 로그아웃이든 이쪽으로 들어옴
	@RequestMapping(value = "/common/kakao.logout")
	public String kakaoLogout(HttpSession session, HttpServletRequest request) throws IOException {
		KakaoMember kakaoMember = (KakaoMember) request.getSession().getAttribute("kakao_member_session");

		if (kakaoMember != null) {
			System.out.println(kakaoMember.getAccess_token());
			// session에 담겨져 있는 카카오 회원 정보를 가지고 와서 담음
			String access_token = kakaoMember.getAccess_token();
			// 해당 멤버의 access_token을 담음
			kakaoService.logout(access_token, session, request);

			count = 0;

			request.setAttribute("contentPage", "home.jsp");
			return "index";
		} else {
			// 만약 등록되어 있는 session값이 없을 경우 로그인 페이지로
			request.setAttribute("contentPage", "loginHome.jsp");
			return "index";
		}

	}
	
	
	//도로명 주소API에서 주소 팝업창을 띄우는 부분
	@RequestMapping(value = "common/jusoPopup.open")
	public String jusoPopupOpen() {
		return "memberPage/jusoPopup";
	}
	
	//장바구니 페이지로 이동하는 컨트롤러
	@RequestMapping(value = "common/toCart.go")
	public String toCart(HttpServletRequest request) {

		if (dao.getMemberCart(request)) {
			dao.pagin(request, 1);
			request.setAttribute("contentPage", "memberPage/myPageFolder/cartPage.jsp");
			return "index";
		} else {

			request.setAttribute("contentPage", "loginHome.jsp");
			return "index";
		}
	}
	
	//장바구니에서 선택한 제품을 취소시키는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "common/deleteOrder.do")
	public boolean deleteOrder(HttpServletRequest request, OrderPage order) {
		
		if (dao.deleteOrder(request, order)) {
		//성공적으로 삭제한 후에 1페이지로 돌아가도록 세팅
			dao.pagin(request, 1);
			return true;
		} else {
			return false;
		}
	}

}