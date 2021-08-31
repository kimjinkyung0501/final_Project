<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	left: 500px;
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

.form-control {
	margin-left: 15px;
	display: block;
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

textarea {
	width: 230px;
	height: 100px;
	resize: vertical;
	margin-left: 15px;
	border-radius: .25rem;
	background-clip: padding-box;
	border: 1px solid #ced4da;
}

.container {
	width: 670px;
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
</style>

</head>
<body>

	<a style="font-size: 9px;">제품등록</a>

	<div style="width: 100%; min-height: 10px; height: 40px;"></div>

	<div class="border">
		<div style="width: 100%; min-height: 10px; height: 40px;"></div>
		<div class="container">


			<form name="newProduct" action="product.reg.do"
				class="form-horizontal" method="post" enctype="multipart/form-data">



				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="com-sm-3">
						<input type="text" id="name" name="p_name" class="form-control" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">재고</label>
					<div class="com-sm-3">
						<input type="number" id="unitsInStock" name="p_stock"
							class="form-control" required="required">
					</div>
				</div>



				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="com-sm-3">
						<input type="number" id="unitPrice" name="p_price"
							class="form-control" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">제품 설명</label>
					<div class="com-sm-5">
						<textarea cols="50" rows="2" class="form-control" name="p_content"
							placeholder="1000자 이내로 적어주세요."  required="required"></textarea>
						<input type="hidden" name="p_rn" value="${param.p_rn }">
					</div>
				</div>




				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="com-sm-5">
						<select class="select" name="p_label">
							<option value="식품">식품</option>
							<option value="악세사리">악세사리</option>
							<option value="의류">의류</option>
							<option value="전자기기">전자기기</option>
							<option value="주방">주방</option>
							<option value="잡화">잡화</option>
							<option value="인테리어">인테리어</option>
							<option value="육아">육아</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">이미지</label>
					<div>
						<input type="file" class="form-control" name="p_photo1" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">이미지2(선택)</label>
					<div>
						<input type="file" class="form-control" name="p_photo2">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">이미지3(선택)</label>
					<div>
						<input type="file" class="form-control" name="p_photo3">
					</div>
				</div>


				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary" value="등록">등록</button>
					</div>
				</div>

			</form>
		</div>

	</div>

<script type="text/javascript">

</script>

</body>
</html>