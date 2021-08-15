<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	top: 30%;
	left: 30%;
}

.title {
	margin-bottom: 5vh
}

.card {
	margin: auto;
	box-shadow : 0 6px 20px 0 rgba( 0, 0, 0, 0.02);
	border-radius: 1rem;
	border: transparent;
	display: flex;
	align-items: stretch; align-content : center;
	font-family: sans-serif;
	font-size: 0.8rem;
	font-family: sans-serif;
	align-content: center;
	box-shadow: 0 6px 5px 0 rgba(0, 0, 0, 0.01);
}

.cart {
	background-color: #fff;
	padding: 4vh 5vh;
	width: 500px;
}

.summary {
	background-color: #ddd;
	padding: 4vh;
	color: rgb(65, 65, 65);
}

.summary .col-2 {
	padding: 0
}

.summary .col-10 {
	padding: 0
}

.row {
	margin: 0;
}

.title b {
	font-size: 1.5rem
}

.main {
	margin: 0;
	padding: 2vh 0;
	width: 100%
}

.col-2, .col {
	padding: 0 1vh
}

a {
	padding: 0 1vh
}

.close {
	margin-left: auto;
	font-size: 0.7rem
}

.back-to-shop {
	margin-top: 4.5rem
}

.card select {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1.5vh 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
}

.card input {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
}

.card input:focus::-webkit-input-placeholder {
	color: transparent
}

.btn {
	background-color: #000;
	border-color: #000;
	color: white;
	width: 100%;
	font-size: 0.7rem;
	margin-top: 4vh;
	padding: 1vh;
}

.card img {
	width: 100px;
}

.btn:focus {
	box-shadow: none;
	outline: none;
	box-shadow: none;
	color: white;
	-webkit-box-shadow: none;
	-webkit-user-select: none;
	transition: none
}

.btn:hover {
	color: white
}

a {
	color: black
}

a:hover {
	color: black;
	text-decoration: none
}

#code {
	background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253),
		rgba(255, 255, 255, 0.185)),
		url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
	background-repeat: no-repeat;
	background-position-x: 95%;
	background-position-y: center
}
</style>
</head>
<body>




	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>STEP 1. CART</h4>
						</div>
					</div>
				</div>

				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
						<c:forEach var="p_order" items="${order_list}" varStatus="status">

							<div class="col-2">
								<img class="img-fluid"
									src="${pageContext.request.contextPath}/resources/img/${p_order.p_photo1}">
							</div>
							<div class="col">
								<div class="row">${p_order.s_name }</div>
							</div>
							<div class="col">
								<a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
							</div>
							<div class="col">${p_order.p_price}원
								<span class="close">&#10005;</span>
							</div>
							<div style="width: 100%; min-height: 10px; height: 50px;"></div>
						</c:forEach>
					</div>

				</div>




				<div class="back-to-shop">
					<a href="#">&leftarrow;</a><span class="text-muted">Back to
						shop</span>
				</div>
			</div>

		</div>
		<div class="col-md-4 summary">
			<div>
				<h5>
					<b>주문내역</b>
				</h5>
				<div style="width: 100%; min-height: 10px; height: 30px;"></div>
			</div>
			<hr>
			<div style="width: 100%; min-height: 10px; height: 30px;"></div>
			<div class="row">
				<div class="col" style="padding-left: 0;">총상품금액</div>
				<div class="col text-right" style="text-align: right;">${p_order.sumPrice}원</div>
			</div>
			<div style="width: 100%; min-height: 10px; height: 30px;"></div>
			<form>
				<p>배송</p>
				<select>
					<option class="text-muted">무료배송</option>
				</select>
				<p>할인코드</p>
				<input id="code" placeholder="할인쿠폰">
			</form>
			<div class="row"
				style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
				<div class="col">TOTAL PRICE</div>
				<div class="col text-right">${p_order.sumPrice}원</div>
			</div>
			<button class="btn">상품 주문</button>
		</div>
	</div>


</body>
</html>