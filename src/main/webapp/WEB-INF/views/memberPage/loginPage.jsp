<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
			
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
	</div>
</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/Valid.js"></script>
<script type="text/javascript" src="resources/js/kakaoJS.js"></script>
</html>