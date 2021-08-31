<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	}); 



</script>
<style type="text/css">
body{
    margin: 15px;
}
.board_write .title_box img.non_member {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	position: absolute;
	left: -45px;
	top: 2px;
}

.non_member {
	vertical-align: middle;
}

.non_member {
	border: 0;
}

.board_write .title_box input, .board_write .non_member_tool span input,
	.write-body.schedule .title_box input {
	width: 100%;
	font-size: 20px;
	border: none;
	border-bottom: 1px solid rgba(128, 128, 128, 0.3);
	border-radius: 0;
	padding: 8px 118px 8px 0;
	line-height: 1.2;
}

.text-box {
	position: absolute;
	top: 200px;
	left: 600px;
}
/* 글등록버튼  */
.btn {
	background-color: white;
	border: solid 1px gray;
	color: gray;
	padding: 5px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	cursor: pointer;
	color: gray;
}

textarea {
	width: 600px;
	height: 300px;
	resize: none;
}

textarea::placeholder {
	color: grey;
	font-weight: 600;
	font-family: 'Noto Sans KR', sans-serif;
}

/*첨부파일  */
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

</head>
<body>
	<h5>공지사항 수정</h5>
	<form action="notice.update.do" method="post"
		enctype="multipart/form-data">
		<div class="board_write">
			<div class="title_box">
				<div class="board_title_wrap tabled full-width"
					style="position: relative">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/default_profile.png" class="non_member"
							alt="프로필 이미지">
					</div>
					<input name="n_no" type="hidden" value="${nt.n_no }">
					<input id="post_subject" name="n_title" class="title_name"
						type="text" value="${nt.n_title}" >
				</div>
				<div style="width: 100%; min-height: 1px; height: 10px;"></div>

				<div class="fr-wrapper" dir="ltr">
					<p>
						<textarea name="n_content">${nt.n_content}"</textarea>
					</p>
				</div>
			</div>
			<div class="filebox">
				<img alt="X" src="${pageContext.request.contextPath}/resources/img/${nt.n_photo }" style="width: 100px;">
				
				
				
				
				<input class="upload-name" value="${nt.n_photo }" disabled="disabled">
				<label for="ex_filename">업로드</label>
				
				 <input type="file"name="n_photo" id="ex_filename" class="upload-hidden">
			</div>


			<div id="boardcss_list_add_button_table">
				<button class="btn">등록</button>
			</div>
		</div>

	</form>


</body>
</html>