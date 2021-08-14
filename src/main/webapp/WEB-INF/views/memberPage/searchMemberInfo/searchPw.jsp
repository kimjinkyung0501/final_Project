<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/searchMemberInfo.css">
<style type="text/css">
.text-box{
position: absolute;
	top: 200px;
	left: 35%;
}

body{
    margin: 15px;
}
</style>
</head>
<body>


		<span class="header_11">비밀번호 찾기</span>
		<div style="width: 100%; min-height: 1px; height: 30px;"></div>

<section class="search_section">
	<div class="search_header">
		<span class="header_21">비밀번호 찾기 방법을 선택해 주세요.</span>
	</div>
	<div class="content_div">
		<div class="use_phone">
		<div id="use_phone_header">회원 정보에 입력한 휴대전화로 찾기</div>
		<span class="use_phone_span">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</span>
					<div style="width: 100%; min-height: 1px; height: 30px;"></div>
			<div id="use_phone_click">
				<table class="table">
				<tr>
				<td>이름</td> <td> <input id="nameInputForPw"> </td>
				</tr>
				<tr>
				<td>휴대전화</td> <td> <input id="phoneInputForPw"> </td> <td> <button class="searchPwByPhone">인증번호 받기</button> </td>
				</tr>
				<tr>
				<td colspan="3"> <input id="phoneKeyInput" placeholder="인증번호"> </td>
				</tr>
				<tr>
				<td colspan="3"> <button class="submitPhoneKeyForPwBtm">인증하기</button> </td>
				</tr>
				</table>
			</div>
		</div>
		<div class="use_email">
		<div id="use_email_header">본인확인 이메일로 인증</div>
		<span class="use_phone_span">본인확인 이메일 주소와 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</span>
					<div style="width: 100%; min-height: 1px; height: 30px;"></div>
			<div id="use_email_click">
			<table class="table">
				<tr>
				<td>이름</td> <td> <input id="nameInputForPw2"> </td>
				</tr>
				<tr>
				<td>이메일</td> <td> <input id="emailInputForPw"> </td> <td> <button type="button" class="emailBtnForPw">인증메일 보내기</button> </td>
				</tr>
				</table>
			</div>
		</div>
	</div>

</section>



</body>

<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/searchMemberInfo.js"></script>

</html>