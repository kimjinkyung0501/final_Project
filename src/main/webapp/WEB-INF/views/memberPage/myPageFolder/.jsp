<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="regAddr.do" name="form" id="form" method="post">
	<input hidden="1" name="m_id" value="${sessionScope.member_session.m_id}">
	도로명주소<input type="text" id="roadFullAddr" name="m_addr" /><br>
	고객입력 상세주소<input type="text" id="addrDetail" name="m_addr2" /><br>
	우편번호<input type="text" id="zipNo" name="m_addr_zipno" />
	<br> <br>
	<button type="button" onClick="goPopup();">검색하기</button>
	<br> <br>
	<button onsubmit="return regAddr();">등록하기</button>
</form>



</body>
</html>