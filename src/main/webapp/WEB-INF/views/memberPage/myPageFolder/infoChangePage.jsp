<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 15px;
}

.text-box {
	top: 30%;
	left: 40%;
}

#memberInfo_div {
margin-top : 10px;
	background-color: white;
	position: relative;
	color: #353535;
	line-height: 1.5;
	font-size: 11pt;
	letter-spacing: 0.5px;
	position: relative;
	height: auto;
}

.infoDiv {
	border: 0.5px solid #f1f1f1;
	color: #353535;
	height: auto;
}

.infoDiv label {
	padding: 11px 11px 10px 11px;
	border-bottom-width: 0;
	width : 130px;
	color: #353535;
	text-align: left;
	font-weight: normal;
	background-color: #fff;
}

.infoDiv span {
	border-bottom-width: 0;
	color: #353535;
	text-align: left;
	font-weight: normal;
	background-color: #fff;
	height: auto;
}

.infoDiv button {
	margin: 11px 11px 10px 11px;
}
</style>
</head>
<body>

	<h4>회원정보 수정</h4>

	<!--  전체틀 -->
	<section id="memberInfo_section" style="border: 1">




		<div id="memberInfo_div">

			<div class="infoDiv">
				<div class="title">
					<label>이미지</label>
						</div>
						<div class="content_img">
					<span> <input type="file" >
						</span>
				</div>
				</div>


			<div class="infoDiv">
				<div class="title">
					<label>이름</label>
				</div>
				<div class="content_name">
					<span id="memberName">${sessionScope.member_session.m_name}
						<button class="nameChangeBtn">수정하기</button>
					</span>

				</div>

			</div>
			<div class="infoDiv">
				<div class="title">
					<label>아이디</label>
				</div>
				<div class="content_id">
					<span id="memberId">${sessionScope.member_session.m_id}
						<button class="idChangeBtn">수정하기</button>
					</span>

				</div>
			</div>
			<div class="infoDiv">
				<div class="title">
					<label>비밀번호</label>
				</div>
				<div class="content_pw">
					<span><input type="password"
						value="${sessionScope.member_session.m_pw }" readonly></span>
					<button onclick="return changePwGo();">수정하기</button>
				</div>
			</div>
			<div class="infoDiv">
				<div class="title">
					<label>휴대전화</label>
				</div>
				<div class="content_phone">
					<span hidden="1">${sessionScope.member_session.m_phone}</span> <input
						style="width: 30px;" readonly
						value="${fn:substring(sessionScope.member_session.m_phone,0,3)}">
					<input style="width: 30px;" readonly
						value="${fn:substring(sessionScope.member_session.m_phone,3,7)}">
					<input style="width: 30px;" readonly value="****">
				</div>
				<div>
					<button>수정하기</button>
				</div>
			</div>
			<div class="infoDiv">
				<div class="title">
					<label>이메일</label>
				</div>
				<div class="content_email">
					<span>${sessionScope.member_session.m_email}</span>
				</div>
				<div>
					<button class="emailChangeBtn">수정하기</button>
				</div>
			</div>
		</div>
	</section>



















</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/myPageJS.js"></script>

</html>