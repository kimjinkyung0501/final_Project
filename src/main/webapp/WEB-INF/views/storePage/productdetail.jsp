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
<td>제품 번호</td><td>${p.p_no}</td>
</tr>
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
<tr>
<td>재고량</td><td>${p.p_stock}</td>
</tr>
<tr>
<td>주문량</td><td></td>
</tr>
</table>
<button onclick="location.href='${pageContext.request.contextPath}/product.update.go?p_no=${p.p_no }'">수정</button><button onclick="prodcutDel(${p.p_no});">삭제</button><button>주문확인</button>
<script type="text/javascript" src="resources/js/storeJs.js"></script>
</body>
</html>