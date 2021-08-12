<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage.css">
</head>
<body>

<a href="/jk/">home</a>

<div class="sideMenu_div">
<div id="myPage"> My Page </div>
<div id="sideMenu1"> 주문 조회</div>
<div id="sideMenu2"> 장바구니 </div>
<div id="sideMenu3"> 정보수정 </div>
</div>

<div class="myPage_include">
<jsp:include page="${contentPage}"></jsp:include>
</div>





</body>

</html>