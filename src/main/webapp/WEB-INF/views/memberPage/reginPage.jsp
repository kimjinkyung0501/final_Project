<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');

				fileTarget.on('change', function() { // 값이 변경되면
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출
					}

					// 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});
			});

	//preview image 
	var imgTarget = $('.preview-image .upload-hidden');

	imgTarget
			.on(
					'change',
					function() {
						var parent = $(this).parent();
						parent.children('.upload-display').remove();

						if (window.FileReader) {
							//image 파일만
							if (!$(this)[0].files[0].type.match(/image\//))
								return;

							var reader = new FileReader();
							reader.onload = function(e) {
								var src = e.target.result;
								parent
										.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
							}
							reader.readAsDataURL($(this)[0].files[0]);
						}

						else {
							$(this)[0].select();
							$(this)[0].blur();
							var imgSrc = document.selection.createRange().text;
							parent
									.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

							var img = $(this).siblings('.upload-display').find(
									'img');
							img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
									+ imgSrc + "\")";
						}
					});
</script>
<style type="text/css">
#wrapper {
	left: 100px;
}

.text-box {
	position: absolute;
	top: 250px;
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
	font-family: 'Noto Sans KR', sans-serif;
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
</style>
<script>
	
</script>
</head>
<body>







	<form action="regin.do" method="post" enctype="multipart/form-data">
		<!-- photo-->
		<div>
			<div id="fileupload_profile_img2" class="fileupload_profile_img">
				<div id="profile_img2" class="img-circle"
					style="margin: 0 auto; width: 80px; height: 80px; background: url('resources/img/default_profile.jpg') 50% 50%/cover no-repeat;"></div>

				<span></span>
			</div>
		</div>


<div class="filebox bs3-primary preview-image">
              <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">

			<label for="input-file">업로드</label> <input type="file" name="m_photo" 
				id="input-file" class="upload-hidden">
		</div>

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
				<button type="button" value="" class="checkId">중복체크</button>
			</span>
		</div>

		<!-- PW1 -->
		<div>
			<h3 class="join_title">
				<label for="pswd1">비밀번호</label>
			</h3>
			<span class="box int_pass"> <input type="text" name="m_pw"
				id="m_pw" type="password" class="int" maxlength="20">
			</span>
		</div>

		<!-- PW2 -->
		<div>
			<h3 class="join_title">
				<label for="pswd2">비밀번호 재확인</label>
			</h3>
			<span class="box int_pass_check"> <input type="text"
				id="m_pw_compare" type="password" class="int" maxlength="20">
			</span>
		</div>
		<!-- MOBILE -->
		<div>
			<h3 class="join_title">
				<label for="phoneNo">휴대전화</label>
			</h3>
			<span class="box int_mobile"> <input name="m_phone"
				type="text" class="int" maxlength="16"> <input hidden="1"
				value="false" id="check_info">
			</span> <span>
				<button class="phoneCheck" type="button"
					onclick="return phoneCer();">인증하기</button>
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
		</div>

		<!--  주소 -->
		<div>
			<h3 class="join_title">
				<label for="phoneNo">주소</label>
			</h3>
			<span class="box int_mobile"><input name="m_addr" id="m_addr"
				type="text" class="int" maxlength="100"> </span>
		</div>
		<div>
			<h3 class="join_title">
				<label for="phoneNo">상세 주소</label>
			</h3>
			<span class="box int_mobile"><input name="m_addr2"
				id="m_addr2" type="text" class="int" maxlength="100"> </span>
		</div>
		<div style="width: 100%; min-height: 1px; height: 50px;"></div>

		<!-- JOIN BTN-->
		<button class="reginBtn" id="btnJoin">가입하기</button>
	</form>


</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/phoneCertification.js"></script>
<script type="text/javascript" src="resources/js/emailCheck.js"></script>
<script type="text/javascript" src="resources/js/Valid.js"></script>
<script type="text/javascript" src="resources/js/ValidLib.js"></script>
</html>