<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-box {
	top: 30%;
}

ul.mylist, ol.mylist {
	align-content: center;
	list-style: none;
	margin: 3px;
	padding: 3px;
	max-width: 600px;
	width: 600px;
	margin-left: 100px;
		font-family: 'Pretendard-Regular';
	
}

ul.mylist li, ol.mylist li {
text-align : center;
	display: inline-block;
	padding: 18px;
	margin-bottom: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	display: inline-block;
		font-family: 'Pretendard-Regular';
	
}

ul.mylist li, ol.mylist li {
	-webkit-transition: background-color 0.3s linear;
	-moz-transition: background-color 0.3s linear;
	-ms-transition: background-color 0.3s linear;
	-o-transition: background-color 0.3s linear;
	transition: background-color 0.3s linear;
}
</style>
</head>
<body>



	<ul class="mylist">
		<li style="width: 150px; height: 100px;"><a
			onClick="location.href='admin.memberManagemen'"
			style="font-weight: bold;">MEMBER MANAGE</a><br>
			<button
				style="border: none; margin-top: 10px; font-size: 12pt; background-color: white;"
				onClick="location.href='admin.memberManagemen'">회원관리</button></li>
		<li style="width: 150px; height: 100px;"><a
				onClick="location.href='admin.shopManagemen'"
			style="font-weight: bold;">STORE MANAGE</a><br>
			<button
				style="border: none; margin-top: 10px; font-size: 12pt; background-color: white;"
				onClick="location.href='admin.shopManagemen'">상점관리</button></li>
		<li style="width: 150px; height: 100px;"><a
				onClick="location.href='admin.complainManagement'"
			style="font-weight: bold;">CSS<br></a><br>
			<button
				style="border: none; width: 120px; margin-top: 3px; font-size: 12pt; background-color: white;"
				onClick="location.href='admin.complainManagement'">신고/불편사항</button></li>

	</ul>



</body>
</html>