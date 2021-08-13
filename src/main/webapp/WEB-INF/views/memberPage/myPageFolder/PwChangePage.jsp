<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/changePw.css">
</head>
<body>

<div>
<div>
	<div>현재 비밀번호</div>
	<div id="pwDiv"> 
	<input class="currentPw"> 
	<span id="spanTag"></span>
	</div>
</div>

<form action="changePw.do" method="post">
<div>
	<div>새로운 비밀번호</div>
	<div> 
	<input name="newPw" class="newPw"> 
	</div>
</div>
<div>
	<div>비밀번호 확인</div>
	<div> 
	<input class="confirmPw"> 
	</div>
</div>
<button onclick="return changePw();">변경</button>
</form>
</div>




</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/ValidLib.js"></script>
<script type="text/javascript" src="resources/js/myPageJS.js"></script>
</html>