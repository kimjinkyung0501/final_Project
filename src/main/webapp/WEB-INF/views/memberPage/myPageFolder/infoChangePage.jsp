<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
<td>프로필 사진</td>
<td> <img src="resources/img/${sessionScope.member_session.m_photo}"> </td>
</tr>
<tr>
<td>아이디</td>
<td>${sessionScope.member_session.m_id}</td>
</tr>
<tr>
<td>이름</td>
<td>${sessionScope.member_session.m_name}</td>
</tr>
<tr>
<td>비밀번호</td>
<td> <input type="password" value="${sessionScope.member_session.m_pw }" readonly> </td>
</tr>
<tr>
<td>휴대전화</td>
<td> ${sessionScope.member_session.m_phone }</td>
</tr>
<tr>
<td>이메일</td>
<td> ${sessionScope.member_session.m_email }</td>
</tr>
<tr>
<td> <button>회원정보 수정하기</button> </td>
</tr>

</table>

</body>
</html>