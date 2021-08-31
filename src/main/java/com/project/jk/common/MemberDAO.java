package com.project.jk.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	private List<OrderPage> order_list;

	private List<ConfirmOrder> confirmList;

	// 아직 사용은 안하는 중
	public boolean loginCheck(HttpSession session, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("member_session");
		KakaoMember kakao_member = (KakaoMember) request.getSession().getAttribute("kakao_member_session");
		//카카오 멤버와 일반 멤버의 세션을 불러옴
		
		if (member != null && kakao_member == null) {
			session.setAttribute("member_session", member);
			//멤버 세션에 값이 있고 카카오 멤버 세션에 값이 없을 경우 member를 세션에 담음
			return true;
		} else if (member == null && kakao_member != null) {
			session.setAttribute("kakao_member_session", kakao_member);
			//위에의 반대
			return true;
		} else {
			request.setAttribute("contentPage", "loginHome.jsp");
			//세션에 값이 둘 다 없을 경우 loginHome.jsp로 이동시킴
			return true;
		}
	}

	// 로그인 기능
	public boolean login(Member member, HttpServletRequest request) {

		String member_pw = member.getM_pw();
		//로그인 폼에서 회원이 입력한 pw를 받아옴
		Member memberInfo = ss.getMapper(MemberMapper.class).loginCheck(member);
		//입력되어진 ID값 회원의 정보를 불러옴
		String member_dbpw = memberInfo.getM_pw();
		//DB안에 저장된 회원의 PW를 저장

		if (member_dbpw.equals(member_pw)) {
			//DB에 저장된 비밀번호와 폼에서 입력한 값이 일치할 경우 true를 리턴
			HttpSession ss = request.getSession();
			ss.setAttribute("member_session", memberInfo);
			//세션을 불러온 후 DB에서 가져온 값을 member_session에 저장
			int login_number = 1;
			ss.setAttribute("login_number", login_number);
			//일반 회원과 카카오 회원을 구분하기 위해서 1을 저장
			//카카오 멤버의 경우 2가 저장
			return true;
		} else {
			return false;
		}

	}

	// 로그아웃(세션 삭제)
	public void logout(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("member_session");
		session.removeAttribute("login_number");
		session.invalidate();
		//로그아웃 할 때 member_session의 값과 login_number값을 지움

	}

	// 아이디 중복체크 부분
	public boolean checkId(Member m) {
		try {
			List<Member> member = ss.getMapper(MemberMapper.class).checkId_select(m);
			//해당하는 회원의 정보들을 불러옴
			if (member.size() == 1) {
				//나온 리스트의 길이가 1일 때(이미 해당 아이디를 사용하고 있는 회원이 있다.)
				return false;
			} else if (member.size() == 0) {
				//0이면 사용중인 아이디가 없기 때문에 0이 나옴
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	// 핸드폰 인증 관련(수정 필요 깊게 보지마요)
	public void insertPhoneKey(String key, String userPhoneNumber) {
		// TODO Auto-generated method stub
		ss.getConnection();
		String m_p_successInfo = "false";// 아직 핸드폰 미인증 상태를 넣음
		MemberPhoneCheck mpk = new MemberPhoneCheck(0, userPhoneNumber, key, m_p_successInfo);
		// 유저 넘버, 핸드폰 번호, 휴대폰 번호 누르고 인증 눌렀을 떄 설정되는 값, 인증 상태 여부
		ss.insert("com.project.jk.common.MemberMapper.insertPhoneKey", mpk);

	}

	//아아디 찾기 휴대폰 인증키 업데이트
	public void updatePhoneKey(String getNumber, String userPhoneNumber) {
		int memberUniqueNo = ss.getMapper(MemberMapper.class).memberUniqueNo(userPhoneNumber);
		//해당 핸드폰의 고유 번호가 담겨져 있음
		String m_p_successInfo = "false";
		//핸드폰 인증 상태를 다시 false를 담기 위해 선언
		MemberPhoneCheck mpk = new MemberPhoneCheck(memberUniqueNo, null, getNumber, m_p_successInfo);
		//PK, (핸드폰 인증 시 보내지는 인증번호), (인증상태를 나타내는 false)를 담은 객체
		ss.getMapper(MemberMapper.class).updatePhoneKey(mpk);

	}

	//보내진 인증번호와 회원이 입력한 인증번호를 비교하는 기능
	public boolean compareKey(MemberPhoneCheck mpk) {
		// TODO Auto-generated method stub
		ss.getConnection();
		List<MemberPhoneCheck> l_mpk = ss.selectList("com.project.jk.common.MemberMapper.compareKey", mpk);
		// 유저가 입력한 핸드폰 번호의 인증번호를 가지고 와서 객체 담음
		String dbKey = l_mpk.get(0).getM_p_id();
		// db에서 가져온 인증번호를 넣어둠
		String inputKey = mpk.getM_p_id();
		// 사용자가 입력한 인증번호

		if (dbKey.equals(inputKey)) {
			// db에 미리 설정된 인증번호와 유저가 입력한 번호가 일치시
			mpk.setM_p_successInfo("true");
			// mpk 변수의 인증 상태 속성에 true를 설정
			ss.update("com.project.jk.common.MemberMapper.updateSuccessInfo", mpk);
			// 휴대폰 인증상태를 "true"로 업데이트
			return true;
		} else {
			return false;
		}

	}

	// 회원가입의 제출 버튼 클릭시 실행되는 메소드
	public boolean checkSuccessInfo(String m_id, String m_phone) {
		//ajax로 회원 ID와 핸드폰 번호를 받아옴
		MemberPhoneCheck mpc = new MemberPhoneCheck();
		TempMemberInfo tmi = new TempMemberInfo();
		mpc.setM_p_number(m_phone);
		tmi.setT_m_id(m_id);
		//받아온 ID와 핸드폰 번호를 MemberPhoneCheck(핸드폰 인증 관련 객체)
		//TempMemberInfo(이메일 인증 관련 객체)에 담음
		
		//해당하는 핸드폰 번호의 인증 상태를 불러와서 객체에 담음
		MemberPhoneCheck mpk = (MemberPhoneCheck) ss.getMapper(MemberMapper.class).checkSuccessInfo(mpc);
		
		//해당하는 아이디의 이메일 인증상태를 불러옴
		TempMemberInfo emailInfo = (TempMemberInfo) ss.getMapper(MemberMapper.class).checkEmailSuccess(tmi);
		
		System.out.println(mpk.getM_p_successInfo());
		System.out.println(emailInfo.getT_m_key());

		//핸드폰 인증상태가 true이고 이메일 인증 상태가 y일 경우 가입 성공
		if (mpk.getM_p_successInfo().equals("true") && emailInfo.getT_m_key().equals("y")) {
			System.out.println("성공");
			return true;
			//성공시 true를 리턴
		}
		System.out.println("실패");
		return false;
	}

	// 회원가입 부분
	public void regin(HttpServletRequest request, Member member) throws IOException {

		//회원 가입 시 프로필 이미지를 서버에 저장하기 위한 경로를 담음
		String saveDirectory = request.getSession().getServletContext().getRealPath("resources/img");
		System.out.println(saveDirectory);
		//이미지 사이즈
		int sizeLimit = 1024 * 1024 * 10;

		//enctype가 Multipart/form-data일 때 값을 받아오기 위한 기능
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, sizeLimit, "utf-8",
				new DefaultFileRenamePolicy());

		String m_id = mr.getParameter("m_id");
		String m_pw = mr.getParameter("m_pw");
		String m_name = mr.getParameter("m_name");
		
		//회원가입 시 주소를 받지 않기 때문에 임시로 값을 넣음
		String m_addr = "tempaddr!detailaddr";
		String m_phone = mr.getParameter("m_phone");
		String m_email = mr.getParameter("m_email");
		String m_photo = mr.getFilesystemName("m_photo");
		
		// 멤버 등급, 처음은 무조권 1을 넣은 후 판매자 신청 통과 시 2로 변경되게 설정할 예정
		int m_grade = 1;
		
		//사진을 등록하지 않았을 때 임시로 값을 넣음
		if (m_photo == null) {
			m_photo = "tempImg.jpg";
		}

		member.setM_id(m_id);
		member.setM_pw(m_pw);
		member.setM_name(m_name);
		member.setM_addr(m_addr);

		member.setM_phone(m_phone);
		member.setM_email(m_email);
		member.setM_photo(m_photo);
		member.setM_grade(m_grade);
		
		//회원가입 폼에서 받아온 값들을 Member클래스의 객체에 담음
		
		//멤버 등록하는 기능
		ss.getMapper(MemberMapper.class).regMember(member);
			
	}

	// 이메일을 받고 인증하기 버튼 클릭 시 실행되는 메소드
	public void updateMemberInfo(TempMemberInfo tmi) {
		// 해당하는 멤버 아이디의 key값을 "y"로 변경
		ss.getMapper(MemberMapper.class).updateTempMemberInfo(tmi);
	}

	// 회원 정보 사이트에서 이름 바꾸는 메소드
	public void changeName(DataChangeBean dcb, HttpServletRequest request) {
		//회원의 ID, 현재 사용중인 이름을 조건으로 새로운 이름으로 수정
		ss.getMapper(MemberMapper.class).changeName(dcb);
		//member_session에 저장되어있는 현재 멤버의 세션값을 불러옴
		Member member = (Member) request.getSession().getAttribute("member_session");
		System.out.println(member.getM_name());// 기존에 DB에 있는 값
		String newName = dcb.getNewData();
		System.out.println(newName); // 새로 입력한 이름
		member.setM_name(newName);
		//Member클래스의 객체에 새로운 이름을 담음
		request.getSession().setAttribute("member_session", member);
	}

	//사용자가 입력과 동시에 현재 사용중인 비밀번호를 비교
	public boolean comparePw(String inputPw, HttpServletRequest request, Member session_member) {
		//사용자의 현재 비밀번호를 세션에서 불러옴
		session_member.setM_pw(inputPw);
		
		//실시간으로 비교되는 sql문을 실행
		if (ss.getMapper(MemberMapper.class).comparePw(session_member) != null) {
			//값이 있을 때 실행되는 부분(즉 비밀번호가 일치한다는 의미)
			return true;
		} else {
			//값이 일치하지 않을 때 false를 리턴
			return false;
		}

	}
	
	//비밀번호를 변경할 때 실행되는 메소드
	public void changePw(String newPw, Member member, HttpServletRequest request) {
		//member_session에서 사용자의 현재 정보들을 불러옴
		Member member_session = (Member) request.getSession().getAttribute("member_session");
		//ajax를 통해서 받아온 새로운 비밀번호를 member_session에 세팅
		member_session.setM_pw(newPw);
		//새로운 비밀번호와 회원의 정보가 담겨져 있는 객체를 사용, member 테이블
		//에 저장되어 있는 회원의 비밀번호를 변경
		ss.getMapper(MemberMapper.class).changePw(member_session);
		
		//새로운 비밀번호가 세팅된 채로 다시 member_session에 담음
		request.getSession().setAttribute("member_session", member_session);

	}


	// 프로필 사진 변경하는 메소드
	public void changePhoto(HttpServletRequest request) throws IOException {
		
		//이미지를 서버에 저장하기 위한 경로를 구함
		String saveDirectory = request.getSession().getServletContext().getRealPath("resources/img");
		System.out.println(saveDirectory);
		
		//현재 세션값에 저장되어 있는 현재 이미지를 불러옴
		Member member_session = (Member) request.getSession().getAttribute("member_session");
		String oldPhoto = member_session.getM_photo();
		
		//enctype를 처리하기 위한 MultipartRequest객체
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, 31457280, "utf-8",
				new DefaultFileRenamePolicy());
		
		String m_photo = mr.getFilesystemName("m_photo");
		//새로운 이미지를 세션값에 저장
		member_session.setM_photo(m_photo);
		//전에 사용하던 이미지를 삭제하기 위해서 request.setAttribute를 통해서 보냄
		request.setAttribute("oldPhoto", oldPhoto);
		
		//이미지를 변경하기 위한 sql문을 실행
		if (ss.getMapper(MemberMapper.class).changeProfile(member_session) == 1) {
			System.out.println("성공");
		}

		request.setAttribute("member_session", member_session);
	}

	// 프로필 사진 수정하였을 때 예전 이미지 삭제하는 메소드
	public void deleteOldPhoto(String oldPhoto, HttpServletRequest request) {
		//전에 사용하던 이미지가 저장되어 있는 경로를 가지고 옴
		String saveDirectory = request.getSession().getServletContext().getRealPath("resources/img/" + oldPhoto);
		File file = new File(saveDirectory);
		
		//해당 경로의 oldPhoto 이름의 파일이 존재하면 실행되는 부분
		if (file.exists()) {
			//존재하면 해당 파일을 삭제
			file.delete();
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

	}
	
	//멤버들 중에 해당하는 이메일을 사용하는 사람이 있는지 체크하는 부분
	public boolean emailCheck(TempMemberInfo tmi) {
		// 이메일을 사용하는 계정이 있으면 1 없으면 0로 나옴
		if (ss.getMapper(MemberMapper.class).checkEmail(tmi) == 1) {
			return false;
		} else {
			return true;
		}

	}
	
	//멤버 테이블에서 이메이을 변경하는 기능
	public boolean memberEmailChange(TempMemberInfo tmi, HttpServletRequest request) {

		if (ss.getMapper(MemberMapper.class).changeMemberEmail(tmi) == 1) {
			// 해당 회원의 이메일을 새로운 이메일로 변경하는 update문
			Member member_session = (Member) request.getSession().getAttribute("member_session");
			// session 값이 정보를 불러온 후
			member_session.setM_email(tmi.getT_m_email());
			// 새로운 이메일을 값을 세팅
			request.getSession().setAttribute("member_session", member_session);
			// 보내
			return true;
		} else {
			return false;
		}
	}

	//사용자의 이름과 이메일을 이용해서 회원 정보를 불러옴
	public boolean searchIdByNameAndEmail(Member member, HttpServletRequest request) {
		//해당하는 이름과 이메일의 멤버 정보를 불러와서 Member클래스의 객체에 담음ㄴ
		Member returnMember = ss.getMapper(MemberMapper.class).searchIdByNameAndEmail(member);
		if (returnMember != null) {
			//만약 그 객체가 비어있지 않을 경우 해당 객체를 담음
			request.setAttribute("returnMember", returnMember);
			return true;
		} else {
			return false;
		}

	}
	
	//비밀번호 찾기 기능 중 이메일로 보내진 임시 비밀번호를 저장하는 기능
	public void changePwWithTempPw(String tempPw, Member member, HttpServletRequest request) {
		//해당하는 회원을 찾기 위해서 회원 이름과 이메일을 받음
		String m_name = member.getM_name();
		String m_email = member.getM_email();
		
		//임시 비밀번호를 변경하기 위해서 hashMap에 담음(새로운 bean파일을 안 만들기 위해서)
		HashMap<String, String> tempPwMap = new HashMap<String, String>();
		tempPwMap.put("tempPw", tempPw);
		tempPwMap.put("m_name", m_name);
		tempPwMap.put("m_email", m_email);

		
		//회원 테이블의 비밀번호를 임시 비밀번호로 업데이트 하기 위한 sql문을 실행
		ss.getMapper(MemberMapper.class).changePwWithTempPw(tempPwMap);

	}
	
	//주소를 등록하기 위한 메소드
	public void regAddr(HttpServletRequest request, Member member) {
		Member session_member = (Member) request.getSession().getAttribute("member_session");
		
		//주소 등록 api를 통해서 받아온 회원 아이디와 주소를 각각의 변수에 담음
		String m_id = request.getParameter("m_id");
		String temp_m_addr = request.getParameter("m_addr");
		String m_addr_zipno = request.getParameter("m_addr_zipno");

		StringBuilder sb = new StringBuilder();
		sb.append(m_addr_zipno + "-" + temp_m_addr);
		String m_addr = sb.toString();
		
		//해당하는 멤버를 찾기 위한 멤버 ID와 등록할 주소를 객체에 담음
		member.setM_id(m_id);
		member.setM_addr(m_addr);
		
		try {
			//멤버 테이블에서 주소를 등록(실질적으로는 update문)
			ss.getMapper(MemberMapper.class).regAddr(member);
			session_member.setM_addr(m_addr);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 휴대폰 번호로 아이디 찾는 기능
	public boolean searchIdByPhone(Member member) {
		//전에 사용한 인증정보를 삭제함
		ss.getMapper(MemberMapper.class).deleteOldPhoneInfo(member);
		
		//휴대폰 번호를 활용해서 ID값을 가져옴
		Member checkMember = ss.getMapper(MemberMapper.class).searchIdByPhone(member);
		if (checkMember != null) {
			//해당하는 휴대폰 번호의 아이디가 있을 경우 true를 리턴
			return true;
		} else {
			return false;
		}

	}
	
	//회원이 현재 사용하고 있는 핸드폰을 이용해서 임시 비밀번호를 이메일로 보내는 기능
	public String getUserEmail(Member member) {
		//해당하는 핸드폰의 현재 사용 중 이메일을 불러옴
		Member userInfo = ss.getMapper(MemberMapper.class).getUserEmail(member);
		String userEmail = userInfo.getM_email();
		
		//해당 이메일을 리턴
		return userEmail;
	}

	
	//접속한 회원의 장바구니 목록을 가져오는 메소드
	public boolean getMemberCart(HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("member_session");
		KakaoMember kakao_member = (KakaoMember) request.getSession().getAttribute("kakao_member_session");
		if (member != null && kakao_member == null) {
			order_list = ss.getMapper(MemberMapper.class).getUserCart(member);
			for (int i = 0; i < order_list.size(); i++) {
				int sumPrice = order_list.get(i).getP_price() * order_list.get(i).getO_quantidey();
				order_list.get(i).setSumPrice(sumPrice);
			}
			request.setAttribute("order_list", order_list);
			return true;
		} else {
			return false;
		}
	}
	
	   //결재 완료된 제품과 수업의 개수를 가져오는 메소드
	   public void getCompletedOrderAnLesson(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      Member session_member = (Member) request.getSession().getAttribute("member_session");
	      KakaoMember kakao_member = (KakaoMember) request.getSession().getAttribute("kakao_member_session");
	      
	      if (session_member != null && kakao_member == null) {
	         //제품과 수업 각각의 개수를 가져와 변수에 담음
	         int orderCount = ss.getMapper(MemberMapper.class).getOrderCount(session_member);
	         int lessonCount = ss.getMapper(MemberMapper.class).getLessonCount(session_member);
	         
	         //
	         request.setAttribute("orderCount", orderCount);
	         request.setAttribute("lessonCount", lessonCount);
	      }
	      else if(session_member == null && kakao_member != null){
	         int orderCount2 = 0;
	         int lessonCount = 0;
	         
	         request.setAttribute("orderCount", orderCount2);
	         request.setAttribute("lessonCount", lessonCount);
	      }
	      

	   }
	//orderPage 페이징 기능
	public void orderPagin(HttpServletRequest request, int page) {

		request.setAttribute("curPageNO", page);
		int cnt = 3;
		int total = confirmList.size();
		if (total != 0) {

			int pageCount = (int) Math.ceil(total / (double) cnt);

			request.setAttribute("pageCount", pageCount);

			int start = total - (cnt * (page - 1));

			int end = (page == pageCount) ? -1 : start - (cnt + 1);

			ArrayList<ConfirmOrder> items = new ArrayList<ConfirmOrder>();
			for (int i = start - 1; i > end; i--) {
				items.add(confirmList.get(i));
			}

			request.setAttribute("completedOrderList", items);
		}

	}
	
	//주문 목록에서 해당하는 제품을 삭제시키는 메소드
	public boolean deleteOrder(HttpServletRequest request, OrderPage order) {
		//영향받은 행이 1개일 경우 true를 리턴 시키도록 함
		if (ss.getMapper(MemberMapper.class).deleteOrder(order) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	//장바구니 페이지 페이징 기능
	public void pagin(HttpServletRequest request, int page) {

		request.setAttribute("curPageNO", page);
		int cnt = 3;
		int total = order_list.size();
		if (total != 0) {

			int pageCount = (int) Math.ceil(total / (double) cnt);

			request.setAttribute("pageCount", pageCount);

			int start = total - (cnt * (page - 1));

			int end = (page == pageCount) ? -1 : start - (cnt + 1);

			ArrayList<OrderPage> items = new ArrayList<OrderPage>();
			for (int i = start - 1; i > end; i--) {
				items.add(order_list.get(i));
			}

			request.setAttribute("order_list", items);
		}

	}

	//아이디 일치 여부를 확인하는 메소드
	public boolean idCheck(HttpServletRequest request, Member member) {
		//해당하는 아이디가 존재할 때 true를 리턴하도록 구성
		if (ss.getMapper(MemberMapper.class).idCheck(member) == 1) {
			return true;
		} else {
			return false;
		}

	}
	
	
	public boolean compareId(Member member, HttpServletRequest request) {
		//해당하는 아이디의 회원 정보를 가지고 오는 부분
		Member dbMember = ss.getMapper(MemberMapper.class).compareId(member);
		
		if (dbMember == null) {
			return true;
		} else {
			return false;
		}

	}

	public boolean changeQuantidey(String idList, int orderNo) {
		String m_id = "";
		int o_o_nop = orderNo;

		JsonParser js = new JsonParser();
		JsonElement element = js.parse(m_id);
		String normal_m_id = element.getAsJsonObject().get("normal_m_Id").getAsString();
		String kakao_m_id = element.getAsJsonObject().get("kakao_m_id").getAsString();

		if (normal_m_id != "" && kakao_m_id == "") {
			m_id = normal_m_id;
		} else if (normal_m_id == "" && kakao_m_id != "") {
			m_id = kakao_m_id;
		}

		HashMap<String, Integer> changeQuantidey = new HashMap<String, Integer>();
		changeQuantidey.put(m_id, o_o_nop);

		if ((ss.getMapper(MemberMapper.class).changeQuantidey(changeQuantidey)) == 1) {
			System.out.println("성공");
			return true;
		} else {
			System.out.println("실패");
			return false;
		}
	}

	public ArrayList<OrderPage> submitOrder(HttpServletRequest request) {
		ArrayList<OrderPage> orderList = new ArrayList<OrderPage>();

		String m_name = request.getParameter("m_name");
		String roadFullAddr = request.getParameter("roadFullAddr");
		String addrDetail = request.getParameter("addrDetail");
		String zipNo = request.getParameter("zipNo");

		String m_addr = zipNo + "-" + roadFullAddr + addrDetail;

		request.setAttribute("m_name", m_name);
		request.setAttribute("m_addr", m_addr);

		OrderPage op;
		String values = request.getParameter("checkList");
		System.out.println(values);

		JSONParser jp = new JSONParser();
		JSONObject jo;

		try {

			jo = (JSONObject) jp.parse(values);
			JSONArray jsonArray = (JSONArray) jo.get("data");

			for (int i = 0; i < jsonArray.size(); i++) {
				op = new OrderPage();

				JSONObject objectInArray = (JSONObject) jsonArray.get(i);
				String o_no_BeforeInt = (String) objectInArray.get("o_no");
				Long p_priceBeforeParse = (Long) objectInArray.get("p_price");
				Long o_quantideyBoforeParse = (Long) objectInArray.get("o_quantidey");
				String s_name = (String) objectInArray.get("s_name");
				String p_name = (String) objectInArray.get("p_name");
				String productPhoto = (String) objectInArray.get("p_photo");
				String o_o_nopS = (String) objectInArray.get("o_o_nop");
				int o_o_nop = Integer.parseInt(o_o_nopS);
				System.out.println(o_o_nop);
				int o_no = Integer.parseInt(o_no_BeforeInt);
				int p_price = p_priceBeforeParse.intValue();
				int o_quantidey = o_quantideyBoforeParse.intValue();
				op.setS_name(s_name);
				op.setP_name(p_name);
				op.setP_price(p_price);
				op.setP_photo1(productPhoto);
				op.setO_no(o_no);
				op.setO_quantidey(o_quantidey);
				op.setO_o_nop(o_o_nop);

				orderList.add(op);
			}

			return orderList;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public boolean regP_order(ArrayList<OrderPage> orderList, HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("member_session");
		String m_name = (String) request.getAttribute("m_name");
		String m_addr = (String) request.getAttribute("m_addr");
		String m_id = member.getM_id();

		
		ArrayList<ConfirmOrder> confirmOrder = new ArrayList<ConfirmOrder>();
		ConfirmOrder co;
		for (int i = 0; i < orderList.size(); i++) {
			co = new ConfirmOrder();
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(HH시 mm분)");
			String p2_date = sdf.format(today);

			co.setP2_name(m_name);
			co.setP2_o_id(m_id);
			co.setP2_email(member.getM_email());
			co.setP2_addr(m_addr);
			co.setP2_phone(member.getM_phone());
			co.setP2_s_name(orderList.get(i).getS_name());
			co.setP2_p_name(orderList.get(i).getP_name());
			co.setP2_p_photo(orderList.get(i).getP_photo1());
			co.setP2_sumPrice(orderList.get(i).getP_price());
			co.setP2_p_quantidey(orderList.get(i).getO_quantidey());
			co.setP2_o_no(orderList.get(i).getO_no());
			co.setP2_date(p2_date);
			co.setO_o_nop(orderList.get(i).getO_o_nop());

			ss.getMapper(MemberMapper.class).confirmOrder(co);
			ss.getMapper(MemberMapper.class).decreaseQuantidey(co);
			ss.getMapper(MemberMapper.class).deleteCart(co);
			System.out.println(orderList.get(i).getO_o_nop());
			// 해당 객체의 o_no를 넣어서 p2_no를 뽑아내야함
			// 그런데 같은 제품임을 나타내는 o_no가 여러 개 있을 경우 2개 이상의 값이 나와버림
			// taken_p_order의 p2_no 와 taken_p_pk 의 p_pk_p2_no이 같은 칼럼의 p_pk_no을 뽑음
			int p2_no = ss.getMapper(MemberMapper.class).getPrimary(co);

			ConfirmOrder order = ss.getMapper(MemberMapper.class).getOrderList(p2_no);

			confirmOrder.add(order);
			System.out.println("성공 : " + i);
		}

		request.setAttribute("confirmOrder", confirmOrder);
		return true;

	}

	   public void confirmedOrder(HttpServletRequest request) {

	      Member member = (Member) request.getSession().getAttribute("member_session");
	      confirmList = ss.getMapper(MemberMapper.class).getCompletedOrder(member);

	      request.setAttribute("completedOrderList", confirmList);
	   }

	public void getLessonList(HttpServletRequest request) {
		Member session_member = (Member) request.getSession().getAttribute("member_session");
		List<LessonBean> lesson_list = ss.getMapper(MemberMapper.class).getLessonList(session_member);
		request.setAttribute("lesson_list", lesson_list);
	}

	public boolean seeMovie(int l_no, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String saveDirectory = request.getSession().getServletContext().getRealPath("resources/img/");
		LessonBean lessonWithMovie = ss.getMapper(MemberMapper.class).getMovie(l_no);
		String video_name = lessonWithMovie.getL_video();
		request.setAttribute("video_name", video_name);

		String[] filename_seperate = video_name.split("\\.");
		String exp;
		if (filename_seperate.length <= 1) {
			// 확장자 에러 //
			throw new RuntimeException("Wrong file name. You need to include expand file name"); //
//	         response.getOutputStream().write(resultMsg.getBytes(SystemInfo.ENCODING)); 
//	         response.getOutputStream().flush(); 
//	         return null; 
		} else {
			exp = filename_seperate[1];
		}
		// Progressbar 에서 특정 위치를 클릭하거나 해서 임의 위치의 내용을 요청할 수 있으므로
		// 파일의 임의의 위치에서 읽어오기 위해 RandomAccessFile 클래스를 사용한다.
		// 해당 파일이 없을 경우 예외 발생
		File file = new File(saveDirectory + video_name);
		if (!file.exists())
			throw new FileNotFoundException();
		RandomAccessFile randomFile = new RandomAccessFile(file, "r");
		long rangeStart = 0; // 요청 범위의 시작 위치
		long rangeEnd = 0; // 요청 범위의 끝 위치
		boolean isPart = false; // 부분 요청일 경우 true, 전체 요청의 경우 false // randomFile 을 클로즈 하기 위하여 try~finally 사용
		try { // 동영상 파일 크기
			long movieSize = randomFile.length();
			// 스트림 요청 범위, request의 헤더에서 range를 읽는다.
			String range = request.getHeader("range");
			// 브라우저에 따라 range 형식이 다른데, 기본 형식은 "bytes={start}-{end}" 형식이다.
			// range가 null이거나, reqStart가 0이고 end가 없을 경우 전체 요청이다.
			// 요청 범위를 구한다.
			if (range != null) {
				// 처리의 편의를 위해 요청 range에 end 값이 없을 경우 넣어줌
				if (range.endsWith("-")) {
					range = range + (movieSize - 1);
				}
				int idxm = range.trim().indexOf("-"); // "-" 위치
				rangeStart = Long.parseLong(range.substring(6, idxm));
				rangeEnd = Long.parseLong(range.substring(idxm + 1));
				if (rangeStart > 0) {
					isPart = true;
				}
			} else {
				// range가 null인 경우 동영상 전체 크기로 초기값을 넣어줌. 0부터 시작하므로 -1
				rangeStart = 0;
				rangeEnd = movieSize - 1;
			} // 전송 파일 크기
			long partSize = rangeEnd - rangeStart + 1; // 전송시작
			response.reset(); // 전체 요청일 경우 200, 부분 요청일 경우 206을 반환상태 코드로 지정
			response.setStatus(isPart ? 206 : 200); // mime type 지정
			response.setContentType("video/mp4"); // 전송 내용을 헤드에 넣어준다. 마지막에 파일 전체 크기를 넣는다.
			response.setHeader("Content-Range", "bytes " + rangeStart + "-" + rangeEnd + "/" + movieSize);
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Length", "" + partSize);
			OutputStream out = response.getOutputStream(); // 동영상 파일의 전송시작 위치 지정
			randomFile.seek(rangeStart); // 파일 전송... java io는 1회 전송 byte수가 int로 지정됨
			// 동영상 파일의 경우 int형으로는 처리 안되는 크기의 파일이 있으므로
			// 8kb로 잘라서 파일의 크기가 크더라도 문제가 되지 않도록 구현
			int bufferSize = 8 * 1024;
			byte[] buf = new byte[bufferSize];
			do {
				int block = partSize > bufferSize ? bufferSize : (int) partSize;
				int len = randomFile.read(buf, 0, block);
				out.write(buf, 0, len);
				partSize -= block;
			} while (partSize > 0);
		} catch (IOException e) {
			// 전송 중에 브라우저를 닫거나, 화면을 전환한 경우 종료해야 하므로 전송취소.
			// progressBar를 클릭한 경우에는 클릭한 위치값으로 재요청이 들어오므로 전송 취소.
			e.printStackTrace();
		} finally {
			randomFile.close();
		}
		return false;

	}
	
	
	//8월 24일 작업
	public void deleteOldEmail(TempMemberInfo tmi) {
		// TODO Auto-generated method stub
		ss.getMapper(MemberMapper.class).deleteTempInfo(tmi);
		
	}

	//8월 24일 작업
	public boolean checkTempInfo(String m_email, HttpServletRequest request) {
		
		String userKey = ss.getMapper(MemberMapper.class).compareEmailKey(m_email);
		if(userKey.equals("y")) {
			return true;
		}
		else {
			return false;
		}
		
	}

}
