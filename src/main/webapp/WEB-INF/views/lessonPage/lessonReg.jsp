<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

article, aside, dialog, figcaption, figure, footer, header, hgroup, main, nav, section {
   display: inline-block; 
}

.text-box {
	position: absolute;
	top: 120px;
	left: 400px;
}

.border {
	border: 0.1px solid lightgray;
}


</style>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

	<a style="font-size: 9px;">수업등록</a>

	<div style="width: 100%; min-height: 10px; height: 40px;"></div>

	<div class="border">
		<div style="width: 100%; min-height: 10px; height: 40px;"></div>


		<div class="container">


			<form name="newProduct" class="form-horizontal"
				action="lesson.reg.do" method="post" enctype="multipart/form-data">



				<div class="form-group row">
					<label class="col-sm-2">수업명</label>
					<div class="com-sm-3">
						<input type="text" id="name" name="l_name" class="form-control">
						<input type="hidden" name="l_rn" value="${param.l_rn }">
					</div>
				</div>


				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="com-sm-3">
						<input type="text" id="unitPrice" name="i_price"
							class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">수업설명</label>
					<div class="com-sm-5">
						<textarea cols="50" rows="2" class="form-control" name="i_content"
							placeholder="1000자이내로 적어주세요"></textarea>

					</div>
				</div>




				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="com-sm-5">
						<select name="p_label">
							<option value="드로잉">드로잉</option>
							<option value="공예">공예</option>
							<option value="요리">요리</option>
							<option value="사진">사진</option>
							<option value="음악">음악</option>
							<option value="게임">게임</option>
							<option value="디자인">디자인</option>
							<option value="개발">개발</option>
							<option value="글쓰기">글쓰기</option>
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
					<label class="col-sm-2">영상</label>
					<div>
						<input type="file" name="l_video">
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