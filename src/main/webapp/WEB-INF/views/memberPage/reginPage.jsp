<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/common/">초기화면</a>

<div>
<form action="regin.do" method="post" enctype="multipart/form-data">
 <table border="1">
<tr> <td colspan="3"> 회원 가입 </td> </tr>
<tr>
<td> 이름 </td>
<td colspan="2"> <input name="m_name" id="m_name" type="text"> </td>
</tr>
<tr>
<td> ID </td>
<td> <input type="text" name="m_id" id="m_id">
<button type="button" value="" class="checkId">중복체크</button>
</td>
</tr>
<tr>
<td> PW </td>
<td colspan="2"> <input name="m_pw" id="m_pw" type="password"> </td>
</tr>
<tr>
<td> PW확인 </td>
<td colspan="2"> <input id="m_pw_compare" type="password"> </td>
</tr>
<tr>
<td> 주소 </td>
<td colspan="2"> <input name="m_addr" id="m_addr" type="text"> </td>
</tr>
<tr>
<td> 상세 주소 </td>
<td colspan="2"> <input name="m_addr2" id="m_addr2" type="text"> </td>
</tr>
<tr>
<td> 휴대폰 번호 </td>
<td colspan="2"> <input name="m_phone" id="m_phone" type="text">
<input hidden="1" value="false" id="check_info">
<button class="phoneCheck" type="button" onclick="return phoneCer();">인증하기</button> 
</td>
	
</tr>
<tr>
<td> 이메일 </td>
<td colspan="2"> <input type="email" name="m_email" id="m_email"> </td>
</tr>
<tr>
<td> 사진 </td>
<td colspan="2"> <input name="m_photo" type="file"> </td>
</tr>
<tr>
<td colspan="3"> <button class="reginBtn">가입하기</button> </td>
									<!-- function과 ajax 둘 중 우선순위는 어디가 높지 -->
</tr>





</table>
</form>
</div>

</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/phoneCertification.js"></script>
<script type="text/javascript" src="resources/js/emailCheck.js"></script>
<script type="text/javascript" src="resources/js/Valid.js"></script>
<script type="text/javascript" src="resources/js/ValidLib.js"></script>

</html>