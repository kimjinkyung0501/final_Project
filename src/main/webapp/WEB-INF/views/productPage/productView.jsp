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
	margin-bottom: 18px;
	max-height: 300px;
	margin: 15px 15px 25px 25px;
	max-height: 300px;
}

#s_name {
	font-size: 9pt;
	color: #606060;
	margin-bottom: 2px;
	text-align: center;
}

#p_name {
	font-size: 12pt;
	color: #606060;
	font-weight: bold;
	margin-top: 2px;
	text-align: center;
}

#p_price {
	font-size: 11pt;
	color: #606060;
	margin-top: 1px;
	margin-bottom: 0px;
	text-align: center;
}

.contents_container .pic img {
	
}

.cartBtn {
	border: none;
	align-content: center;
	background-color: white;
	font-size: 11pt;
	color: #606060;
}

.cartIcon {
	margin-top: 20px;
	margin-left: 114px;
	width: 18px;
	height: 18px;
	align-content: center;
	background-color: white;
}

#paging {
	display: inline-block;
}

#paging a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 50%;
}

#paging a.active {
	background-color: tomato;
	color: white;
}

#paging a:hover:not(.active) {
	background-color: silver;
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
						<a
							href="${pageContext.request.contextPath}/product.detail?p_no=${p.p_no}&p_rn=${p.p_rn}"><img
							src="${pageContext.request.contextPath}/resources/img/${p.p_photo1 }"
							style="width: 250px; height: 200px;" alt=""></a>
						<c:forEach var="s" items="${stores }">
							<c:if test="${s.s_no==p.p_rn }">
								<p id="s_name">
									<a href="userStoreDetail?s_no=${s.s_no}">${s.s_name }</a>
								</p>
							</c:if>
						</c:forEach>
						<p id="p_name">${p.p_name }</p>
						<p id="p_price">
							<fmt:formatNumber value="${p.p_price }" pattern="#,###" />
							원
						</p>
						<button class="cartBtn"
							onclick="location.href='cart.go2?o_no=${p.p_no}&o_id=${sessionScope.member_session.m_id}&o_m_addr=${sessionScope.member_session.m_addr}&o_quantidey=1&o_phone=${sessionScope.member_session.m_phone}'">
							<img class="cartIcon"
								src="${pageContext.request.contextPath}/resources/img/cartIcon.png">
						</button>
					</div>

				</c:forEach>
		</div>
	</div>




	<table id="paging" style="margin-top: 100px; margin-left: 380px;">
		<tr>
			<td align="center"><a href="product.paging?p=1">&laquo;</a> <c:forEach
					var="p" begin="1" end="${pageCount }">
					<a href="product.paging?p=${p}">${p }</a>
				</c:forEach> <a href="product.paging?p=${pageCount }">&raquo;</a></td>
		</tr>
	</table>



</body>
</html>