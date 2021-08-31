<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	position: absolute;
	left: 680px;
	top: 200px;
}

.container {
	padding: 2em;
	font-family: 'Pretendard-Regular';
}

.box {
	width: 130px;
	height: 130px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.jb-table .jb-table-row .jb-table-cell {
	
}

.jb-table {
	display: table;
}

.jb-table-row {
	display: table-row;
}

.jb-table-cell {
	display: table-cell;
	margin-left:25px;
	height: 120px;
}

.jb-top {
	vertical-align: top;
}

/* GENERAL BUTTON STYLING */
.btn-5, .btn-5::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-5 {
	background: none;
	border: 3px solid gray;
	border-radius: 5px;
	display: block;
	font-size: 1.3em;
	font-weight: bold;
	padding: 1em 3em;
	position: relative;
	text-transform: uppercase;
}

.btn-5::before, .btn-5::after {
	content: '';
	position: absolute;
	z-index: -1;
}

.btn-5:hover {
	color: darkgray;
}

/* BUTTON 5 */
.btn-5 {
	overflow: hidden;
}

.btn-5::after {
	/*background-color: #f00;*/
	height: 100%;
	left: -35%;
	top: 0;
	transform: skew(50deg);
	transition-duration: 0.6s;
	transform-origin: top left;
	width: 0;
}

.btn-5:hover:after {
	height: 100%;
	width: 135%;
}
</style>

</head>
<body>
	<div style="width: 0; min-height: 10px; height: 50px;"></div>


	<c:choose>
		<c:when test="${m.m_grade==1}">

			<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell" style="float: left;">
						<div class="box" style="background: #BDBDBD; margin-right: 10px;">
							<img class="profile" style="vertical-align: middle;"
								src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
						</div>
						<p style="margin-top: 20px; font-size: 18px;" class="info_div">${sessionScope.member_session.m_name}님
							<br> 환영합니다 :)
						</p>
					</div>
				</div>
			</div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
			<a href="${pageContext.request.contextPath}/store.reg.go"
				class="btn-5"><img style="width: 45px; padding-bottom: 0; "
				src="${pageContext.request.contextPath}/resources/img/storeIcon.png"><br>입점신청</a>

		</c:when>
	<c:when test="${m.m_grade==2}">
	<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell" style="float: left;">
						<div class="box" style="background: #BDBDBD; margin-right: 10px;">
							<img class="profile" style="vertical-align: middle;"
								src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
						</div>
						<p style="margin-top: 20px; font-size: 18px;" class="info_div">${sessionScope.member_session.m_name}님
							<br> 입점 신청 대기중입니다 :)
						</p>
					</div>
				</div>
			</div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
	
	
	
	
	</c:when>

		<c:when test="${m.m_grade==3}">
			<form action="${pageContext.request.contextPath}/store.MyPage"
				method="Post">

				<div class="jb-table">
					<div class="jb-table-row">
						<div class="jb-table-cell" style="float: left;">
							<div class="box" style="background: #BDBDBD; margin-right: 20px;">
								<img class="profile" style="vertical-align: middle;"
									src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
							</div>
							<p style="margin-top: 20px; width : 170px; font-size: 16px;" class="info_div">${sessionScope.member_session.m_name}
								판매자님 안녕하세요. <br> <br>생활수집과 함께 해주셔서 감사합니다. :)
							</p>
						</div>
					</div>
				</div>
				<div style="width: 0; min-height: 10px; height: 100px;"></div>
				<input type="hidden" name="s_id"
					value="${sessionScope.member_session.m_id}">
				<div style="width: 0; min-height: 10px; height: 50px;"></div>
				<button class="btn-5">
					<img style="width: 45px; padding-bottom: 0;"
						src="${pageContext.request.contextPath}/resources/img/storeIcon.png"><br>상점
					관리
				</button>
			</form>

		</c:when>
		<c:when test="${m.m_grade==4}">
	<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell" style="float: left;">
						<div class="box" style="background: #BDBDBD; margin-right: 10px;">
							<img class="profile" style="vertical-align: middle;"
								src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
						</div>
						<p style="margin-top: 20px; font-size: 18px;" class="info_div">${sessionScope.member_session.m_name}님
							<br> 판매 중지된 상점입니다 :)
						</p>
					</div>
				</div>
			</div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
			<div style="width: 0; min-height: 10px; height: 50px;"></div>
	
	
	</c:when>
		
		
		
		
	</c:choose>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/locationFile.js"></script>
	<script type="text/javascript" src="resources/js/Valid.js"></script>
</body>
</html>