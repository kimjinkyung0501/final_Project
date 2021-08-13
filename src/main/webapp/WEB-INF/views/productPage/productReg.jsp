<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-box {
	position: absolute;
	top: 120px;
	left: 400px;
}

.border{
border: 0.1px solid lightgray;
}
</style>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>

<a style="font-size: 9px;">제품등록</a>
	
		<div style="width: 100%; min-height: 10px; height: 40px;"></div>
	
	<div class="border">
		<div style="width: 100%; min-height: 10px; height: 40px;"></div>
	<div class="container">
		
		
		<form name="newProduct" action="product.reg.do" class="form-horizontal" method="post" 
		enctype="multipart/form-data">
		
			
		
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="com-sm-3">
					<input type="text" id="name" name="p_name" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고</label>
				<div class="com-sm-3">
					<input type="text" id="unitsInStock" name="p_stock" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type="text" id="unitPrice" name="p_price" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">제품 설명</label>
				<div class="com-sm-5">
					<textarea cols="50" rows="2" class="form-control" name="p_content" placeholder="1000자이내로 적어주세요"></textarea>
			<input type="hidden" name="p_rn" value="${param.p_rn }"> 				
				</div>
			</div>
			
			
			
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="com-sm-5">
					<select name="p_label">
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
					<input type="file" class="form-control" name="p_photo1">
				</div>
			</div>
				
<div class="form-group row">
				<label class="col-sm-2">이미지2(선택)</label>
				<div>
					<input type="file"  class="form-control" name="p_photo2">
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
	
</body>
</html>