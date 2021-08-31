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
	left: 500px;
	top: 200px;
}

.hori_cont {
	padding: 30px;
	border: 1px solid lightgray;
	display: flex;
	margin-bottom: 30px;
}

.profile_wrap {
	width: 20%;
}

.profile_img {
	width: 152px;
	height: 152px;
	overflow: hidden;
	border-radius: 50%;
	margin: 0 auto;
}

.profile_img img {
	width: 100%;
	height: 100%;
}

.detail{
margin-left: 100px;
}

.middle{
font-size: 11pt;
}


</style>

</head>
<body>
${r}
<button onclick="self.close()">닫기</button>
</body>
</html>