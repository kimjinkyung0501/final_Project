<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 15px;
}

.border {
	border: 0.1px solid lightgray;
}

.text-box {
	position: absolute;
	top: 120px;
	left: 400px;
}

.col, .col-1, .col-10, .col-11, .col-12, .col-2, .col-3, .col-4, .col-5,
	.col-6, .col-7, .col-8, .col-9, .col-auto, .col-lg, .col-lg-1,
	.col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4,
	.col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-auto,
	.col-md, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2,
	.col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8,
	.col-md-9, .col-md-auto, .col-sm, .col-sm-1, .col-sm-10, .col-sm-11,
	.col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
	.col-sm-7, .col-sm-8, .col-sm-9, .col-sm-auto, .col-xl, .col-xl-1,
	.col-xl-10, .col-xl-11, .col-xl-12, .col-xl-2, .col-xl-3, .col-xl-4,
	.col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-auto {
	position: relative;
	width: 25%;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
	left: 4%;
}

.form-group {
	margin-bottom: 1rem;
}

.btn-primary {
	color: #fff;
	background-color: gray;
	border-color: gray;
}

.form-control {
	margin-left: 15px;
	display: block;
	width: 120%;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	border-radius: .25rem;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.row {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	margin-right: -15px;
	margin-left: -15px;
	margin-right: -15px;
}

.select {
	margin-left: 13px;
	height: 30px;
	width: 100px;
	font-size: 10pt;
}

.textarea {
	width: 285px;
	height: 100px;
	resize: vertical;
	margin-left: 15px;
	border-radius: .25rem;
	background-clip: padding-box;
	border: 1px solid #ced4da;
}

.container {
	width: 620px;
}

.btn-primary {
	color: #fff;
	background-color: gray;
	border-color: gray;
}

.btn {
	width: 100px;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.btn {
	width: 100px;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

div.box_type_3 {
	width: 740px;
	margin: 0 auto;
}

div.box_type_3 .e_prod_view_left {
	float: left;
}

div.box_type_3 .e_prod_view_left .prodHr {
	height: 15px;
}

div.e_prod_view_x2 {
	display: inline-block;
}

div.e_prod_view_left {
	margin-right: 17px;
}

.productInfo {
	color: #495057;
	padding-left: 10px;
	padding-top : 5px;
	width: 285px;
	min-height : 100px;
	height: auto;
	resize: vertical;
	margin-left: 15px;
	border-radius: .25rem;
	background-clip: padding-box;
	border: 1px solid #ced4da;
}
</style>

</head>
<body>

	<a style="font-size: 9px;">상품 상세 페이지</a>

	<div style="width: 100%; min-height: 10px; height: 40px;"></div>

	<div class="border">
		<div style="width: 100%; min-height: 10px; height: 40px;"></div>
		<div class="container">


			<c:choose>



				<c:when
					test="${!empty p.p_photo1 && p.p_photo2 eq '없다' && p.p_photo3 eq '없다' }">

					<div>
						<img class="col-sm-2" alt="" src="resources/img/${p.p_photo1}"
							style="width: 550px; height: 430px;">


					</div>

				</c:when>

				<c:when
					test="${!empty p.p_photo1 && !empty p.p_photo2 && p.p_photo3 eq '없다'}">
					<div class="e_view_box">
						<div class="e_prod_view_x2 e_prod_view_left">
							<div>
								<img class="col-sm-2" alt="" src="resources/img/${p.p_photo1}"
									style="width: 280px; height: 280px;">
							</div>
						</div>
						<div class="e_prod_view_x2">
							<div>
								<img class="col-sm-2" alt="" src="resources/img/${p.p_photo2}"
									style="width: 280px; height: 280px;">
							</div>
						</div>
					</div>

				</c:when>

				<c:when
					test="${!empty p.p_photo1 && !empty p.p_photo2 && !empty p.p_photo3}">
					<div class="e_view_box box_type_3" style="margin: 0 auto;">
						<div class="e_prod_view_left">
							<div>
								<img alt="" src="resources/img/${p.p_photo1}"
									style="height: 160px; margin-left: 20px;">
							</div>
							<div class="prodHr"></div>
							<div>
								<img alt="" src="resources/img/${p.p_photo2}"
									style="height: 160px; margin-left: 20px;">
							</div>
						</div>

						<div class="e_prod_view_right">
							<div>
								<img alt="" src="resources/img/${p.p_photo3}"
									style="height: 340px; width: 320px; margin-left: 20px;">
							</div>
						</div>
						<div class="clr"></div>
					</div>
				</c:when>






			</c:choose>

		</div>



		<div style="width: 100%; min-height: 10px; height: 40px;"></div>

		<div class="form-group row">
			<label class="col-sm-2">제품명</label>
			<div class="com-sm-3">
				<input type="text" id="name" name="p_name" class="form-control"
					value="${p.p_name }" readonly="readonly">

			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="com-sm-3">
				<input type="text" id="unitPrice" name="p_price"
					class="form-control" value="${p.p_price }" readonly="readonly">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">제품 설명</label>
			<div class="com-sm-5">
				<div class="productInfo">
					<input name="p_content" hidden="1"> ${p.p_content}
				</div>

				<!-- cols="50" rows="2" > -->
			</div>
		</div>


		<div class="form-group row">
			<label class="col-sm-2">제품 분류</label>
			<div class="com-sm-3">
				<input type="text" id="unitPrice" name="p_label"
					class="form-control" value="${p.p_label }" readonly="readonly">
			</div>
		</div>



	</div>

	<div style="width: 100%; min-height: 10px; height: 20px;"></div>
	<button class="btn"
		onclick="location.href='${pageContext.request.contextPath}/product.update.go?p_no=${p.p_no }'">수정</button>
	<button class="btn" onclick="prodcutDel(${p.p_no});">삭제</button>
	<button class="btn"
		onclick="location.href='${pageContext.request.contextPath}/store.Porder?p_no=${p.p_no }'">주문확인</button>

	<script type="text/javascript" src="resources/js/storeJs.js"></script>
</body>
</html>