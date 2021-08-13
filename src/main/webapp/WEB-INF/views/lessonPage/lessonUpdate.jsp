<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="lesson.update.do" method="post"  enctype="multipart/form-data" >
<table>
<tr>
<td>수업 이름</td><td><input name="l_name" value="${l.l_name }"><input type="hidden"value="${l.l_no }" name="l_no"></td>
</tr>
<tr>
<td>수업 가격</td><td><input name="l_price" type="number" value="${l.l_price }"></td>
</tr>
<tr>
<td>수업 내용</td><td><textarea rows="10" cols="30"  name="l_content" placeholder="1000자이내로 적어주세요" >${l.l_content}</textarea> </td>
</tr>
<tr>
<td>분류</td>
<td>
<select name="l_label" >
<option value="드로잉">드로잉</option>
<option value="공예">공예</option>
<option value="요리">요리</option>
<option value="사진">사진</option>
<option value="음악">음악</option>
<option value="게임">게임</option>
<option value="디자인">디자인</option>
<option value="개발">개발</option>
<option value="글쓰기">글쓰기</option>
<option value="기타">기타</option>
</select> 
</td>
<tr>
<td>사진</td><td><input type="file" name="l_photo"><input type="hidden" name="l_photo_old" value="${l.l_photo }" ></td>
</tr>
<tr>
<td>영상</td><td><input type="file" name="l_video" ><input type="hidden" name="l_video_old" value="${l.l_video }"></td>
</tr>
<tr>
<td colspan="2" align="center"><button>수정하기</button> </td>
</tr>
</table>
</form>
</body>
</html>