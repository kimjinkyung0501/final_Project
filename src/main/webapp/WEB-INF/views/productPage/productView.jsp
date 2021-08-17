<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 15px;
}

.text-box {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 1000px;
}

.hori_cont {
	display: flex;
	margin-bottom: 30px;
}

.contents_container {
	display: flex;
	flex-wrap: wrap;
	display: none;
	margin: 5px 5px 5px 5px;
}

.contents_container.active {
	display: flex;
	flex-wrap: wrap;
}

.contents_container .pic {
	max-width: 400px;
	max-height: 400px;
	overflow: hidden;
	margin-bottom: 18px;
	max-height: 300px;
	margin: 15px 15px 25px 25px;
}

#p_label {
	font-size: 9pt;
	color: #606060;
	text-align: center;
}
#p_name {
	font-size: 12pt;
	color: #606060;
	font-weight: bold;
	text-align: center;
}

#p_price {
	font-size: 11pt;
	color: #606060;
	text-align: center;
}

.contents_container .pic img {
	
}

.cartBtn{
border: none;
align-content: center;
background-color: white;
font-size: 11pt;
color: #606060;

}

.cartIcon{
margin-top : 20px;
margin-left: 114px;
width: 18px;
height: 18px;
align-content: center;
background-color: white;
}


</style>
</head>


<body>



	<h4 align="center">Product All</h4>
	<div style="margin-top: 70px;">
		<div class="mylist_contents contents_container active">
			<p>
			<p>
				<c:forEach var="p" items="${products}">
					<div class="pic">
						<a href="#"><img src="resources/img/${p.p_photo1 }"
							style="width: 250px; height: 200px;" alt=""></a>
						<p id="p_label">${p.p_label }</p>
						<p id="p_name">${p.p_name }</p>
						<p id="p_price"><fmt:formatNumber value="${p.p_price }" pattern="#,###" />원</p>
						<button class="cartBtn"><img class="cartIcon" src="${pageContext.request.contextPath}/resources/img/cartIcon.png"></button>
					</div>

				</c:forEach>
		</div>
	</div>
	
	
	
	
	
</body>
</html>