<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage.css">
</head>
<body>

<c:set var="login_number" value="${sessionScope.login_number}"/>
<c:choose>
<c:when test="${login_number == 1}">
<div class="simpleInfo_div">
<div class="img_div"> <img src="resources/img/${sessionScope.member_session.m_photo}"/> </div>
<div class="info_div"> ${sessionScope.member_session.m_name}님 안녕하세요 </div>
</div>
</c:when>

<c:when test="${login_number == 2}">
<div class="simpleInfo_div">
<div class="img_div"> <img src="${sessionScope.kakao_member_session.kakao_profile_img}"/> </div>
<div class="info_div"> ${sessionScope.kakao_member_session.kakao_nickname}님 안녕하세요 </div>
</div>
</c:when>
</c:choose>


</body>
</html>