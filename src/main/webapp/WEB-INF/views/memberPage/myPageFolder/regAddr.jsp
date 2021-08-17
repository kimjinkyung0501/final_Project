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
	left: 650px;
	top: 240px;
}

body {
	margin: 15px;
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


.jb-table {
	display: table;
	margin-left: 30px;
}

.jb-table-row {
	display: table-row;
}

.jb-table-cell {
	display: table-cell;
	padding: 0px 30px;
	height: 120px;
}

.jb-top {
	vertical-align: top;
}

#form {
	border-collapse: collapse;
	border-top: 2px solid #168;
	border-left: none;
	border-right: none;
	border-collapse: collapse;
}

#form td {
	color: #168;
	text-align: center;
	padding: 10px;
}

#addrDetail {
width : 230px;
	margin-left: 78px;
	color: #168;
	text-align: center;
	padding: 8px;
	border: 0.5px solid #ddd;
	color: #168;
}

#roadFullAddr {
width : 230px;
	margin-left: 68px;
	color: #168;
	text-align: center;
	padding: 8px;
	border: 0.5px solid #ddd;
	color: #168;
}

#zipNo {
width : 230px;
	margin-left: 82px;
	color: #168;
	text-align: center;
	padding: 8px;
	border: 0.5px solid #ddd;
	color: #168;
}

.addrBtn{
margin-left: 80px;
margin-bottom : 10px;
}

button {
margin-left: 5px;
margin-bottom : 10px;
	border: 1px solid #777e88;
	background-color: rgba(0, 0, 0, 0);
	color: #4f4f4f;
	padding: 5px;
}
</style>
</head>

<body>

	<p>주소등록</p>

	<div style="width: 100%; min-height: 1px; height: 50px;"></div>

	<div class="jb-table">
		<div class="jb-table-cell" style="float: left;">
			<div class="box" style="background: #BDBDBD; margin-right: 10px;">
				<img class="profile" style="vertical-align: middle;"
					src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
			</div>
			<p style="margin-top: 20px; font-size: 13px;" class="info_div">이름
				: ${sessionScope.member_session.m_name}님</p>
		</div>
	</div>

	<div style="width: 100%; min-height: 1px; height: 100px;"></div>


	<form action="regAddr.do" name="form" id="form" method="post">
	<div style="width: 100%; min-height: 1px; height: 10px;"></div>
		<input hidden="1" name="m_id"
			value="${sessionScope.member_session.m_id}"> 도로명주소<input
			type="text" id="roadFullAddr" name="m_addr" /><br> 상세주소 <input
			type="text" id="addrDetail" name="m_addr2" /><br> 우편번호<input
			type="text" id="zipNo" name="m_addr_zipno" /> <br> <br>
		<span class="addrBtn">STEP. 1 <button type="button" onclick="goPopup();">검색하기</button></span>
		<br> 
		<span class="addrBtn">STEP. 2 <button onsubmit="return regAddr();">등록하기</button></span>
	</form>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/reginPage.js"></script>

</body>
</html>