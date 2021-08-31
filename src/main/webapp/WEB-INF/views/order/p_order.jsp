<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	
}

.dlist-align {
	font-size: 11pt;
	margin: 5px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	display: flex;
}

.container-fluid {
	margin-top: 70px;
}

.table {
	width: 400px;
}

.info {
	margin-top: 15px;
}

.col-lg-3 {
	margin-left: 15px;
}

.row {
	display: flex;
	flex-wrap: nowrap;
	flex-direction: row;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 8px;
	font-size: 10pt;
}

.img-sm {
	width: 80px;
	height: 80px
}

.table td {
	color: black;
	text-align: left;
	font-size: 10pt;
	margin-left: 100px;
}

.itemside .info {
	padding-left: 15px;
	padding-right: 7px
}

.table-shopping-cart .price-wrap {
	line-height: 1.2
}

.table-shopping-cart .price {
	font-weight: bold;
	margin-right: 5px;
	display: block
}

#Form input {
	width: 40 px;
	margin: 3px;
	padding: 3px 3px;
	font-size: 9px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
}

.addrbtn {
	border: none;
	background-color: white;
	font-size: 8pt;
}

.text-muted {
	color: #969696 !important
}

a {
	text-decoration: none !important
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: 0px
}

.itemside {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	width: 100%
}

.dlist-align {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex
}

.coupon {
	border-radius: 1px
}

.title {
	display: inline;
}

.price {
	font-weight: 600;
	color: #212529
}

br {
	mso-data-placement: same-cell;
}

.btn {
	background-color: #4f4f4f;
	border-color: #4f4f4f;
	border-width: 1px;
	color: #fff;
	height: 40px;
}

h6 {
	margin: 3px;
	font-size: 13px;
	font-weight: bold;
}
</style>
</head>
<body>
<script type="text/javascript">
	function goPopup(){
   var pop = window.open("/jk/common/jusoPopup.open","pop","width=570,height=420, scrollbars=yes, resizable=yes"); };

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                  , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   
   document.Form.roadFullAddr.value = roadFullAddr;
   document.Form.addrDetail.value = addrDetail;
   document.Form.zipNo.value = zipNo;
}
	
</script>

	<form action="order.do" name="Form" id="Form" method="post"
		onsubmit="return stockCheck(${sessionScope.product.p_stock},${sessionScope.number})">
		<div class="container-fluid">
			<div class="row">
				<aside class="col-lg-9">
					<div class="card">
						<div class="table-responsive">
							<table class="table table-borderless table-shopping-cart">
								<thead class="text-muted">
									<tr class="small text-uppercase">
										<th scope="col" class="text-right d-none d-md-block"
											width="200"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- 여기에오더 객체에 필요한 정보 최대한 담기 -->
										<td><input type="hidden" value="${sessionScope.s_name}"
											name="p2_s_name"> <input type="hidden"
											value="${sessionScope.member_session.m_id}" name="m_id">
											<input type="hidden"
											value="${sessionScope.member_session.m_id}" name="p2_o_id">
											<input type="hidden"
											value="${sessionScope.member_session.m_name}" name="m_name">
											<input type="hidden"
											value="${sessionScope.member_session.m_name}" name="o_name">
											<input type="hidden" value="${sessionScope.product.p_no}"
											name="p_no"> <input type="hidden"
											value="${sessionScope.product.p_no}" name="p2_o_no">
											<input type="hidden" value="${sessionScope.product.p_name}"
											name="p_name"> <input type="hidden"
											value="${sessionScope.product.p_photo1}" name="p2_p_photo">
											<input type="hidden" value="${sessionScope.product.p_name}"
											name="p2_p_name"> <input type="hidden"
											value="${sessionScope.number}" name="p2_p_quantidey">
											 <input type="hidden"
											value="${sessionScope.price}" name="p2_sumPrice">
											<input type="hidden"
											value="${sessionScope.member_session.m_email}"
											name="p2_email">
											<figure class="itemside align-items-center">
												<div class="aside">
													<img alt=""
														src="resources/img/${sessionScope.product.p_photo1}"
														style="width: 160px; height: 140px;">
												</div>
												<figcaption class="info">
													<a class="title1 text-dark">${sessionScope.product.p_name}</a>
													<br> <a class="title1 text-dark">${sessionScope.price}원</a>
													<p class="text-muted small">
														${sessionScope.number}개 <br> ${sessionScope.s_name}
													</p>
												</figcaption>
											</figure></td>
									</tr>
									<tr style="margin-left: 40px;">
										<td><h6>주문자 정보 &nbsp;
												${sessionScope.member_session.m_name}
												(${sessionScope.member_session.m_phone})</h6> <br> <a
											class="title text-dark1"> <input type="text"
												required="required" name="p2_name"
												value="${sessionScope.member_session.m_name}">
										</a> <br> <a class="title text-dark1"> <input type="text"
												required="required" name="p2_phone"
												value="${sessionScope.member_session.m_phone}">
										</a></td>
									</tr>
									<tr>
									
										<td>
											<h6>배송지</h6> <input placeholder="우편번호" name="zipNo" required="required">
											<button class="addrbtn" type="button" onclick="goPopup()">주소찾기</button>
											<br> <input placeholder="기본주소" name="addrDetail" required="required"> 
											<br> <input placeholder="나머지주소" name="roadFullAddr" required="required">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</aside>
				<aside class="col-lg-3">
					<div class="card mb-3">
						<div class="card-body">
							<div class="form-group">

								<dl class="dlist-align">
									<dt>상품가격</dt>
									<dd class="text-right ml-3">${sessionScope.price}원</dd>
								</dl>
								<dl class="dlist-align">
									<dt>배송비</dt>
									<dd class="text-right text-danger ml-3">무료배송</dd>
								</dl>

							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">

							<dl class="dlist-align">
								<dt>총 결제금액</dt>
								<dd class="text-right text-dark b ml-3"
									style="text-align: right;">
									<strong>${sessionScope.price}</strong>원
								</dd>
							</dl>
						</div>
					</div>


					<div class="card" style="margin-top: 15px;">
						<div class="card-body">
							<dl class="dlist-align">
								<dt>결제방법</dt>
							</dl>
							<br> <input type="radio" name="charge" value="카카오페이"
								checked="checked">카카오페이 <input type="radio"
								name="charge" value="카드결제">카드결제 <input type="radio"
								name="charge" value="무통장입금">무통장/입금
						</div>
						<button class="btn">결제</button>
					</div>

					<!-- 결제 동의 머 그런거 -->

				</aside>
			</div>
		</div>
	</form>


</body>

	
	
	
	
	<script type="text/javascript">
function stockCheck(stock,amount) {
	if (stock < amount) {
		alert('재고가 부족합니다');
		return false;
	} 
		return true;

}
</script>


	<script type="text/javascript" src="resources/js/storeJS.js"></script>
</html>