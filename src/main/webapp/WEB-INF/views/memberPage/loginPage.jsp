<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="/common/">초기 화면</a>
	<div>
			<table>
				<tr>
					<td>로그인</td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input name="m_id" id="id_input" type="text"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input name="m_pw" id="pw_input" type="password"></td>
				</tr>
				<tr>
					<td>
						<button onclick="return loginCheck();">로그인</button>
					</td>
				</tr>
			</table>
	</div>
</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/Valid.js"></script>
</html>