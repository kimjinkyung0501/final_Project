<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/searchMemberInfo.css">

</head>
<body>

<a href="/common/">홈으로</a>

<section class="search_section">
	<header class="search_header">
		<span class="header_1">비밀번호 찾기</span>
		<span class="header_2">비밀번호 찾기 방법을 선택해 주세요</span>
	</header>
	<div class="content_div">
		<div class="use_phone">
		<div id="use_phone_header">회원 정보에 입력한 휴대전화로 찾기</div>
		<span class="use_phone_span">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</span>
			<div id="use_phone_click">
				<table border="1">
				<tr>
				<td>이름</td> <td> <input id="nameInput1"> </td>
				</tr>
				<tr>
				<td>휴대전화</td> <td> <input id="phoneInput"> </td> <td> <button>인증번호 받기</button> </td>
				</tr>
				<tr>
				<td colspan="3"> <input> </td>
				</tr>
				<tr>
				<td colspan="3"> <button>인증하기</button> </td>
				</tr>
				</table>
			</div>
		</div>
		<div class="use_email">
		<div id="use_email_header">본인확인 이메일로 인증</div>
		<span class="use_phone_span">본인확인 이메일 주소와 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</span>
			<div id="use_email_click">
			<table border="1">
				<tr>
				<td>이름</td> <td> <input id="nameInput2"> </td>
				</tr>
				<tr>
				<td>이메일</td> <td> <input id="emailInput"> </td> <td> <button type="button" class="emailBtnForPw">인증메일 보내기</button> </td>
				</tr>
				</table>
			</div>
		</div>
	</div>
</section>



</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/searchMemberInfo.js"></script>
</html>