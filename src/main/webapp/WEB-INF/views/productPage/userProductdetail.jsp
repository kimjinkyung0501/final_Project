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
<td>제품 이름</td><td>${p.p_name }</td>
</tr>
<tr>
<td><img alt="" src="resources/img/${p.p_photo1}" style="width: 100px; height: 100px;"> </td>
</tr>
<tr>
<td>제품 가격</td><td>${p.p_price }</td>
</tr>
<tr>
<td>제품 설명</td><td>${p.p_content}</td>
</tr>
<tr>
<td>제품 분류</td><td>${p.p_label}</td>
</tr>
</table>
<button>주문하기</button><button>장바구니</button>
</body>
</html>