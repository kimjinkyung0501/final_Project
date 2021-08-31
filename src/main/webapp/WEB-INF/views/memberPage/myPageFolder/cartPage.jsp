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
	
}

.text-box {
	top: 20%;
	left: 30%;
}

.title {
	margin-bottom: 5vh
}

.addrForm input {
	border: 1px solid #ececec;
	font-size: 12px;
	color: #4c4c4c;
	height: 18px;
	margin-top: 3px;
	padding: 10px;
	width: 150px;
}

.orderinfoForm {
	border: 1px solid #ececec;
	font-size: 12px;
	color: #4c4c4c;
	height: 16px;
	padding: 10px;
	width: 150px;
}

.searchaddr {
	border: 1px solid #ececec;
	font-size: 12px;
	color: #4c4c4c;
	height: 18px;
	width: 50px;
}

.card {
	margin: auto;
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.02);
	border-radius: 1rem;
	border: transparent;
	display: flex;
	align-items: stretch;
	align-content: center;
	font-family: sans-serif;
	font-size: 0.8rem;
	font-family: sans-serif;
	align-content: center;
	box-shadow: 0 6px 5px 0 rgba(0, 0, 0, 0.01);
}

.card p {
	font-weight: bold;
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

.quantidey {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
}

.sumPrice {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
}

#code {
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
	<h4 style="text-align: center;">STEP 1. CART</h4>

	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row"
						style="display: flex; flex-direction: row; justify-content: space-between;">
						<div class="col" style="display: flex"></div>
						<div class="col"
							style="width: 100px; display: flex; justify-content: flex-end; margin-left: 300px;">
							전체선택<input class="allCheckBox" type="checkbox">
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

							<div class="col" style="display: flex; flex-direction: column;">
								<div class="row" id="col_row" style="display: flex;">
									<div class="nameDiv" style="display: flex;">${p_order.s_name }</div>
									<div class="checkBtnDiv"
										style="display: flex; justify-content: flex-end;">
										<input defaultValue="${p_order.p_price}"
											value1="${p_order.o_no}" value2="${p_order.p_price}"
											value3="${p_order.o_quantidey}" value4="${p_order.p_photo1}" value5="${p_order.o_o_nop}"
											style="margin-bottom: 0px; margin-left: 280px;"
											type="checkbox" class="listCheckbox"> <input
											hidden="1" value="${p_order.p_price}">
										<button
											style="border: none; background-color: white; margin-left: 5px;"
											onclick="return deleteOrder('${p_order.o_o_nop}');">
											<img alt=""
												style="color: white; background-color: white; width: 10px;"
												src="${pageContext.request.contextPath }/resources/img/cartDelIcon.png">삭제
										</button>
									</div>
								</div>
								<div class="row">${p_order.p_name}</div>
							</div>
							<div class="col">
								<c:set var="price" value="${p_order.p_price}" />
								<c:set var="quantidey" value="${p_order.o_quantidey}" />
								<input style="width: 50px; height: 30px; margin-bottom: 0px;"
									value="${p_order.o_quantidey}" min="1" class="quantidey"
									type="number"> <input hidden="1" name="p_price"
									value="${price}"> <input type="number" readonly
									style="width: 80px; height: 30px;" value="${price*quantidey}"
									class="sumPrice" />
							</div>

							<div class="col">
								<c:set var="session" value="${sessionScope.member_session}" />
								<c:choose>
									<c:when test="${!empty session}">
										<input hidden="1" class="normal_m_id"
											value="${sessionScope.member_session.m_id}">
									</c:when>
									<c:otherwise>
										<input hidden="1" class="kakao_m_id"
											value="${sessionScope.kakao_member_session.m_id}">
									</c:otherwise>
								</c:choose>
							</div>
							<div style="width: 100%; min-height: 10px; height: 10px;"></div>
						</c:forEach>



						<!-- 페이징  -->
						<table id="paging">
							<tr>
								<td align="center"><a href="cartPageController?p=1">[맨처음]</a>

									<c:forEach var="p" begin="1" end="${pageCount}">
										<a href="cartPageController?p=${p}">[${p}]</a>
									</c:forEach> <a href="cartPageController?p=${pageCount}">[맨끝]</a></td>
							</tr>
						</table>


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
				<div class="col text-right" id="resultPrice"
					style="text-align: right;">
					<span style="width: 100%; height: 30px;"  id="ss"></span>
				</div>
			</div>
			<div style="width: 100%; min-height: 10px; height: 30px;"></div>
			<p>배송</p>
			<select>
				<option class="text-muted">무료배송</option>
			</select>
			<p>구매자 이름</p>
			<input class="orderinfoForm" id="m_name" placeholder="이름을 입력 해 주세요.">
			<p>배송지</p>
			<form action="regAddr.do" name="form" id="form" method="post"
				class="addrForm">
				<input hidden="1" name="m_id"
					value="${sessionScope.member_session.m_id}">
				<button class="searchaddr" type="button" onClick="goPopup();">검색</button>
				<br> <input type="text" id="roadFullAddr" name="m_addr"
					placeholder="도로명주소" /><br> <input type="text" id="addrDetail"
					name="m_addr2" placeholder="상세주소" /><br> <input type="text"
					id="zipNo" name="m_addr_zipno" placeholder="우편번호" />
			</form>
			<div class="row"
				style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
				<div class="col">
					<p>결제방법</p>
					<div>
						<span>카카오페이</span> <input style="width: 30px; margin-bottom: 0px;"
							value="kakao" type="radio" name="payRadio">
					</div>
					<div>
						<span>카드결제</span> <input style="width: 30px; margin-bottom: 0px;"
							value="nonBank" type="radio" name="payRadio">
					</div>
					<div>
						<span>무통장입금</span> <input style="width: 30px; margin-bottom: 0px;"
							value="accountPay" type="radio" name="payRadio">
					</div>
				</div>
			</div>
			<button class="btn">상품 주문</button>
		</div>
	</div>


</body>
<script type="text/javascript">

function deleteOrder(o_o_nop){
var ok = confirm("주문을 취소하시겠습니까?");
if(ok){
			alert(o_o_nop);
	$(document).ready(function(){
		$.ajax({
			url : "/jk/common/deleteOrder.do",
			method : "get",
			data : {
				o_o_nop : o_o_nop
			},
			success : function(data){
 				location.reload();
 			}
		})
		.fail(function(){
			alert("통신 실패");
		})
		
	})
}
else{
	return false;
}

}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/cartPage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/reginPage.js"></script>
	

</html>