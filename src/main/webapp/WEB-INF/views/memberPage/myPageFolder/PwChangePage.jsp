<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/changePw.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/searchMemberInfo.css">
<style type="text/css">
.text-box {
	position: absolute;
	top: 200px;
	left: 50%
}
.table{
width: 200px;
}

#spanTag{
font-size: 9pt;
}


body {
	margin: 15px;
}
</style>

</head>
<body>


<div class="table">
<div>
	<div class="pw">현재 비밀번호</div>
	<div id="pwDiv"> 
	<input class="currentPw"> 
	<span id="spanTag"></span>
	</div>
</div>

<form action="changePw.do" method="post">
<div>
	<div class="pw">새로운 비밀번호</div>
	<div> 
	<input name="newPw" class="newPw"> 
	</div>
</div>
<div>
	<div class="pw">비밀번호 확인</div>
	<div> 
	<input class="confirmPw"> 
	</div>
</div>
<button class="changePwbtn" onclick="return changePw();">변경</button>
</form>
</div>



</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ValidLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/myPageJS.js"></script>
</html>