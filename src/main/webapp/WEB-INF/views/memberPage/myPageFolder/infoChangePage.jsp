<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<section id="memberInfo_section">
<div id="memberInfo_div">

	<div class="infoDiv">
		<div class="title">
			<span>이름</span>
		</div>
		<div class="content_name">
			<span id="memberName">${sessionScope.member_session.m_name}</span>
			<button class="nameChangeBtn">수정하기</button>
			
		</div>

	</div>
	<div class="infoDiv">
		<div class="title">
			<span>아이디</span>
		</div>
		<div class="content_id">
			<span id="memberId">${sessionScope.member_session.m_id}</span>
			<button class="idChangeBtn">수정하기</button>
		</div>
	</div>
	<div class="infoDiv">
		<div class="title">
			<span>비밀번호</span>
		</div>
		<div class="content_pw">
			<span><input type="password" value="${sessionScope.member_session.m_pw }" readonly></span>
			<button onclick="return changePwGo();">수정하기</button>
		</div>
	</div>
	<div class="infoDiv">
		<div class="title">
			<span>휴대전화</span>
		</div>
		<div class="content_phone">
			<span hidden="1">${sessionScope.member_session.m_phone}</span>
			<input style="width: 30px;" readonly value="${fn:substring(sessionScope.member_session.m_phone,0,3)}">
			<input style="width: 30px;" readonly value="${fn:substring(sessionScope.member_session.m_phone,3,7)}">
			<input style="width: 30px;" readonly value="****">
		</div>
		<div>
			<button>수정하기</button>
		</div>
	</div>
	<div class="infoDiv">
		<div class="title">
			<span >이메일</span>
		</div>
		<div class="content_email">
			<span>${sessionScope.member_session.m_email}</span>
		</div>
		<div>
			<button>수정하기</button>
		</div>
	</div>
</div>
</section>



















</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/myPageJS.js"></script>

</html>