<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>

<style type="text/css">
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
	margin-left: 0px;
}

.itemside .info {
	padding-left: 5px;
	padding-right: 7px;
	margin-left: 10px;
}

.table-shopping-cart .price-wrap {
	line-height: 1.2
}

.table-shopping-cart .price {
	font-weight: bold;
	margin-right: 5px;
	display: block
}

#infoForm input {
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
	<form action="l_order.do" name="infoForm" id="infoForm" method="post">
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
										<td><input type="hidden"
											value="${sessionScope.member_session.m_id}" name="m_id">
											<input type="hidden" name="o_no" value="${l.l_no }">
											<input type="hidden" name="l_name" value="${l.l_name }">
											<input type="hidden" name="o_id"
											value="${sessionScope.member_session.m_id}"> <input
											type="hidden" name="m_name"
											value="${sessionScope.member_session.m_name}"> <input
											type="hidden" value="${sessionScope.member_session.m_email}"
											name="o_email"> <input type="hidden"
											value="${sessionScope.member_session.m_phone}" name="phone">
											<input type="hidden" value="${l.l_price }" name="price">
											<figure class="itemside align-items-center">
												<div class="aside">
													<img alt="" src="resources/img/${l.l_photo }"
														style="width: 160px; height: 140px;">
												</div>
												<figcaption class="info">
													<a class="title1 text-dark"> ${l.l_name}</a> <br> <br>
													<a class="title1 text-dark"> ${l.l_price }원</a>
													<p class="text-muted small"></p>
												</figcaption>
											</figure></td>
									</tr>
									<tr style="margin-left: 40px;">
										<td><h6>주문자 정보 &nbsp;
												${sessionScope.member_session.m_name}
												(${sessionScope.member_session.m_phone})</h6> <br> <a
											class="title text-dark1"> <input type="text"
												required="required" name="o_name"
												value="${sessionScope.member_session.m_name}">
										</a> <br> <a class="title text-dark1"> <input type="text"
												required="required" name="o_phone"
												value="${sessionScope.member_session.m_phone}">
										</a></td>
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
									<dd class="text-right ml-3">${l.l_price }원</dd>
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
									<strong>${l.l_price }</strong>원
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
	<script type="text/javascript">
		function stockCheck(stock, amount) {
			if (stock < amount) {
				alert('재고가 부족합니다');
				return false;
			}
			return true;

		}
	</script>


	<script type="text/javascript" src="resources/js/storeJS.js"></script>
	<script type="text/javascript" src="resources/js/reginPage.js"></script>

</body>
</html>