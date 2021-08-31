<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body{
    margin: 15px;
}


#wrapper {
	left: 100px;
}

.text-box {
	position: absolute;
	left: 650px;
	top: 270px;
}
/* 입력폼 */
h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: 'Pretendard-Regular';
}

.box.int_id {
	padding-right: 110px;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}

.step_url {
	/*@naver.com*/
	position: absolute;
	top: 16px;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: 'Noto Sans KR', sans-serif;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
.btn_area {
	margin: 30px 0 91px;
}

#btnJoin {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: white;
	background-color: #4f4f4f;
	font-size: 20px;
	font-weight: 400;
}

.file_input_textbox {
	float: left;
	height: 29px;
}

/* imaged preview */
.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}



.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

#imageCanvas {
	position: absolute;
	width: 100px;
	height: 100px;
	left: 33%;
	top: 0;
	pointer-events: none;
	border-radius: 50px;
	background:
		url('${pageContext.request.contextPath}/resources/img/default_profile.jpg')
		50% 50%/cover no-repeat;
}
</style>

</head>
<body>







	<form action="regin.do" method="post" id="reginForm" enctype="multipart/form-data">


		<div class="preview">
			<div class="upload">
				<div class="post_btn">
					<canvas id="imageCanvas"></canvas>
				</div>
			</div>
		</div>
				<div style="width: 100%; min-height: 1px; height: 120px;"></div>
		<div class="filebox">
		<input class="upload-name" value="Profile" disabled="disabled"
				style="width: 200px;"> <label for="id_photo">업로드</label>
			<input type="file" name="m_photo" id="id_photo" class="upload-hidden">
	</div>
	
	
			

		<!-- photo-->
		<div style="width: 100%; min-height: 1px; height: 20px;"></div>

		<!-- name -->
		<div>
			<h3 class="join_title">
				<label for="id">이름</label>
			</h3>
			<span class="box int_name"> <input type="text" name="m_name"
				id="m_name" class="int" maxlength="20">
			</span>
		</div>
		<!-- ID -->
		<div>
			<h3 class="join_title">
				<label for="id">아이디</label>
			</h3>
			<span class="box int_id"> <input type="text" name="m_id"
				id="m_id" class="int" maxlength="20">
			</span> <span>
				<input hidden="1" id="checkIdValue" value="false">
				<button type="button" value="" id="checkId" >중복체크</button>
			</span>
						<span id="idspan_tag"></span>
			
		</div>

		<!-- PW1 -->
		<div>
			<h3 class="join_title">
				<label for="pswd1">비밀번호</label>
			</h3>
			<span class="box int_pass"> <input type="password" name="m_pw"
				id="m_pw" type="password" class="int" maxlength="20">
			</span>
		</div>

		<!-- PW2 -->
		<div>
			<h3 class="join_title">
				<label for="pswd2">비밀번호 재확인</label>
			</h3>
			<span class="box int_pass_check"> <input type="password"
				id="m_pw_compare" type="password" class="int" maxlength="20">
			</span>
		</div>
		<!-- MOBILE -->
		<div>
			<h3 class="join_title">
				<label for="phoneNo">휴대전화</label>
			</h3>
			<span class="box int_mobile"> <input id="m_phone"
				name="m_phone" type="text" class="int" maxlength="16"> <input
				hidden="1" value="false" id="check_info">
			</span> <span>
				<button class="phoneCheck" type="button"
					>인증하기</button>
			</span>
		</div>


		<!-- EMAIL -->
		<div>
			<h3 class="join_title">
				<label for="email">이메일</label>
			</h3>
			<span class="box int_email"> <input type="email"
				name="m_email" id="m_email" class="int" maxlength="100">
			</span>
			<input hidden="1" id="emailCheckValue" value="false">
			<button type="button" class="checkEmail">인증하기</button>
			<span id="emailSpan"></span>
		</div>


		<div style="width: 100%; min-height: 1px; height: 50px;"></div>

		<!-- JOIN BTN-->
		<button onsubmit="return reginValid();" class="reginBtn" id="btnJoin">가입하기</button>
	</form>




	<!-- <script>
		var fileInput = document.querySelector("#id_photo"), button = document
				.querySelector(".input-file-trigger"), the_return = document
				.querySelector(".file-return");

		// Show image
		fileInput.addEventListener('change', handleImage, false);
		var canvas = document.getElementById('imageCanvas');
		var ctx = canvas.getContext('2d');

		function handleImage(e) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				// var imgWidth =
				img.onload = function() {
					canvas.width = 300;
					canvas.height = 300;
					ctx.drawImage(img, 0, 0, 300, 300);
				};
				img.src = event.target.result;
				// img.width = img.width*0.5
				// canvas.height = img.height;
			};
			reader.readAsDataURL(e.target.files[0]);
		}
	</script> -->

</body>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ValidLib.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/reginPage.js"></script>
</html>