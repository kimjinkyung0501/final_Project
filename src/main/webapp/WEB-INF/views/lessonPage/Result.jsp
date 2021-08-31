<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.text-box {
	position: absolute;
	top: 300px;
	left: 750px;
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
	color: gray;
	display: block;
	font-size: 1.3em;
	font-weight: bold;
	margin: 1em auto;
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
<h3>${r}</h3>
<a class="btn-5" href="${pageContext.request.contextPath}/store.go?m_id=${sessionScope.member_session.m_id}">
					<img style="width: 45px; padding-bottom: 0;"
						src="${pageContext.request.contextPath}/resources/img/storeIcon.png"><br>상점가기
					
				</a>
</body>
</html>