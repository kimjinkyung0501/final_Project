<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td>class 번호</td><td>${l.l_no}</td>
</tr>
<tr>
<td>class 이름</td><td>${l.l_name }</td>
</tr>
<tr>
<td><img alt="" src="resources/img/${l.l_photo }" style="width: 100px; height: 100px;"> </td>
</tr>
<tr>
<td>클래스 가격</td><td>${l.l_price }</td>
</tr>
<tr>
<td>클래스 설명</td><td>${l.l_content}</td>
</tr>
<tr>
<td>클래스 분류</td><td>${l.l_label}</td>
</tr>
<tr>
<td colspan="2">영상</td>
</tr>
<tr>
<td><video src="resources/img/${l.l_video }" style="width: 200px;" height="200px;" controls="controls"></video> </td>
</tr>
</table>
<button onclick="location.href='${pageContext.request.contextPath}/lesson.update.go?l_no=${l.l_no }'">수정</button><button onclick="lessonDel(${l.l_no});">삭제</button>
<script type="text/javascript" src="resources/js/storeJs.js"></script>

</body>
</html>