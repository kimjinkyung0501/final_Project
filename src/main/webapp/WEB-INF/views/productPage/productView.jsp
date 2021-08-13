<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="p" items="${products }" >
<div style="margin-left: 30px; border: 1px solid black ; width: 200px; height: 250px;" onclick="location.href='product.detail?p_no=${p.p_no}'">
<img alt="" src="resources/img/${p.p_photo1 }" style="width: 200px;height: 150px;">
${p.p_name }
${p.p_price }
</div>


</c:forEach>
</body>
</html>