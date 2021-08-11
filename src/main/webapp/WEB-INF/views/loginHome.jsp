<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.loginForm {
	padding: 0px; margin-right : auto;
	margin-left: auto;
	margin-top: 10px;
	width: 130%;
	margin-right: auto;
}

.float_r {
	float: right !important;
}

.over_h {
	overflow: hidden;
}

.txt_c {
	text-align: center !important;
}

#id_input {
	width: 100%;
	height: 50px;
	margin-top: 10px;
}

#pw_input {
	width: 100%;
	height: 50px;
	margin-top: 10px;
}

fieldset {
	border-color: gray;
	border-width: 1px 0 0 0;
}

#loginbtn {
	width: 100%;
	height: 50px;;
	margin-top: 10px;
	color: white;
	background-color: #8393a7 !important;
	font-size: 20px;
	border-color: #8393a7 !important;
}

#regb {
	color: white;
	background-color: #8393a7 !important;
	font-size: 20px;
	border-color: #5a7e50;
	font-size: 20px;
}

.border {
	background: #8393a7 !important;
	height: 1px;
	position: absolute;
	left: 0;
	width: 40%;
	top: 50%;
}

.border right {
	left: auto;
	right: 0;
}

.text-box {
	position: absolute;
	top: 250px;
	left: 600px;
}
</style>
</head>
<body>

	${sessionScope.login_number}
	<!-- 세션 값 확인 -->

	<div>
		<c:set var="login_number" value="${sessionScope.login_number}" />
		<c:choose>
			<c:when test="${login_number == 1}">
${sessionScope.member_session.m_id}님 안녕하세요
<button onclick="logout()">로그아웃</button>
				<div onclick="return goMyPage('${sessionScope.login_number}');">마이
					페이지</div>
			</c:when>

			<c:when test="${login_number == 2}">
${sessionScope.kakao_member_session.kakao_nickname}
<button onclick="kakaoLogout()">로그아웃(카카오톡)</button>
				<div onclick="return goMyPage('${sessionScope.login_number}');">마이
					페이지</div>
			</c:when>
		</c:choose>
	</div>



	<div class="loginForm">
		<div class="input_block">
			<div class="input_form">
				<input name="m_id" placeholder="ID" id="id_input" type="text">
			</div>
			<div class="input_form">
				<input name="m_pw" type="password" placeholder="PW" id="pw_input"
					type="text">
			</div>
		</div>
		<p>
			<button id="loginbtn" onclick="return loginCheck();">로그인</button>
		</p>
		<div class="over_h">
			<a href="searchMemberInfo.go">아이디·비밀번호 찾기</a> <a href="regin.go"
				class="float_r">회원가입</a>
		</div>

		<div style="width: 100%; min-height: 10px; height: 40px;"></div>
		<div class="divider txt_c">
			<fieldset><legend>또는</legend></fieldset>
		</div>
		<div>
			<img onclick="kakaoLogin();" src="resources/img/kakaoImg.png"
				style="width: 200px; align-content: center;">
		</div>
	</div>


</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/ValidLib.js"></script>
<script type="text/javascript" src="resources/js/locationFile.js"></script>
<script type="text/javascript" src="resources/js/kakaoJS.js"></script>
<script type="text/javascript" src="resources/js/Valid.js"></script>
</html>