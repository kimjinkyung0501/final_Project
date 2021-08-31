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
.text-box {
	top: 26%;
}

.table td {
	font-size: 9px;
}

.param {
	margin-bottom: 7px;
	line-height: 1.4;
}

.param-inline dt {
	display: inline-block;
}

.param dt {
	margin: 0;
	margin-right: 7px;
	font-weight: 600;
}

.param-inline dd {
	vertical-align: baseline;
	display: inline-block;
}

.param dd {
	margin: 0;
	vertical-align: baseline;
}

.shopping-cart-wrap .price {
	color: #168;
	font-size: 11px;
	font-weight: bold;
	margin-right: 5px;
	display: block;
}

var {
	font-style: normal;
}

.media img {
	margin-right: 1rem;
}

.img-sm {
	width: 90px;
	max-height: 75px;
	object-fit: cover;
}

.current {
	width: 50px !important;
	height: 30px !important;
	font-size: 13px;
	color: #fff;
	font-weight: normal;
	line-height: 33px;
	margin: 0;
	padding: 0;
	border: 0;
	border-radius: 2px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
}

.current:hover {
	background: #f2f2f2;
}


.first:hover {
	background: #f2f2f2;
}
.last:hover {
	background: #f2f2f2;
}

</style>
</head>
<body>

	<div class="container">
		<br>



		<div class="card">
			<table class="table table-hover shopping-cart-wrap">
				<thead class="text-muted">
					<tr>
						<th scope="col">Date</th>
						<th scope="col">Product</th>
						<th scope="col" width="100">Quantity</th>
						<th scope="col" width="100">Price</th>
						<th scope="col" width="180" class="text-right">Addr</th>
						<th scope="col" width="180" class="text-right">Order</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${completedOrderList}">

						<tr>
							<td>${list.p2_date}</td>
							<td>
								<figure class="media">
									<div class="img-wrap">
										<img style="height: 60px;"
											src="${pageContext.request.contextPath}/resources/img/${list.p2_p_photo}">
									</div>
									<figcaption class="media-body">
										<h6 class="text-truncate">${list.p2_s_name}</h6>
										<dl class="param param-inline small">
											<dt>${list.p2_name}</dt>
											<dt>${list.p2_no}</dt>
										</dl>
									</figcaption>
								</figure>
							</td>
							<td>
								<dt>${list.p2_p_quantidey}개</dt>
							</td>
							<td>
								<div class="price-wrap">
									<var class="price">
										<fmt:formatNumber value="${list.p2_sumPrice}" pattern="#,###" />
										원
									</var>
									<small class="text-muted">(배송료 0원)</small>
								</div> <!-- price-wrap .// -->
							</td>
							<td>
								<div class="price-wrap">
									<small class="text-muted">${list.p2_addr} </small>
								</div> <!-- price-wrap .// -->
							</td>
							<td class="text-right"><a title="" href=""
								class="btn btn-outline-success" data-toggle="tooltip"
								data-original-title="Save to Wishlist"> <i
									class="fa fa-heart"></i></a> <small class="text-muted">${list.p2_email}
							</small> <br> <small class="text-muted">${list.p2_phone} </small></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>


			<table id="paging">
				<tr>
					<td align="center"><a class="first"
						href="orderPageController?p=1">first</a> <c:forEach var="p"
							begin="1" end="${pageCount}">
							<a class="current" href="orderPageController?p=${p}">${p}</a>
						</c:forEach> <a class="last" href="orderPageController?p=${pageCount}">last</a></td>
				</tr>
			</table>

		</div>

		<!-- card.// -->

	</div>
	<!--container end.//-->

</body>
</html>