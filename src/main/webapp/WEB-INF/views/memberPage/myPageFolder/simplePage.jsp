<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage.css">
</head>
<body>

<div class="simpleInfo_div">
<div class="img_div"> <img src="resources/img/${sessionScope.member_session.m_photo}"> </div>
<div class="info_div"> ${sessionScope.member_session.m_name}님 안녕하세요 </div>
</div>



</body>
</html>