<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


body {
	margin: 15px;
}




.holder {
	position: relative;
}

#board-title {
	font-size: 25px;
	margin-bottom: 15px;
}

#board_view header .view_tit {
	display: inline-block;
	margin-bottom: 0;
}

#board-title holder {
	font-family: 'Noto Sans', 'sans-serif';
	color: #4f4f4f;
	font-size: 16px;
	line-height: 1.6;
	letter-spacing: 0px;
	font-weight: normal;
	font-style: normal;
	text-decoration: N;
	background-color: #fff;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

#board_view .board_txt_area {
	padding: 22px 0;
	margin: 0;
	word-break: normal;
	word-wrap: break-word;
}

#board_summary {
	float: left;
}

.text-box {
	position: absolute;
	top: 30%;
	left: 30%;
}

/* 
#test_btn111 {
	margin-right: 0px;
}

#test_btn211 {
	margin-left: 2px;
}

#btn_group11 {
	border: 1px solid gray;
	background-color: rgba(0, 0, 0, 0);
	color: gray;
	padding: 5px;
}

.btn_group11 button:hover {
	color: white;
	background-color: gray;
}
 */
#boardcss_list_add_button_table {
	width: 100%;
	margin: 0 auto 15px;
	/*position: relative; background: #bddcff; font-weight: bold;*/
}

/* 화면에 보여지는 글 등록 버튼 */
#boardcss_list_add_button_table .add_button {
	cursor: pointer;
	border: 1px solid #bebebe;
	position: absolute;
	left: 0px;
	top: 10px;
	width: 80px;
	padding: 6px 0 6px;
	text-align: center;
	font-weight: bold;
}

</style>
</head>
<body>

		<div class="board_view ">
			<h2>${nt.n_title}</h2>
			<div class="board_name">
				<a style="font-size: 4px" href="">NOTICE </a>
			</div>
			<input hidden="" value="${nt.n_no }">
			<div style="width: 100%; min-height: 1px; height: 20px;"></div>

			<div class="board_summary">
				<div class="left">
					<div class="avatar">
						<img
							src="${pageContext.request.contextPath}/resources/img/default_profile.png"
							class="avatar-image" style="width: 50px;">
						<div class="avatar1">
							<div class="write">${nt.n_id }</div>
							<div style="width: 100%; min-height: 1px; height: 20px;"></div>
						</div>
					</div>
					<hr size="1" noshade style="width: 400px;">
				</div>
			</div>

			<div class="margin-top-xxl">
				<div style="width: 100%; min-height: 1px; height: 20px;"></div>
				<span style="font-size: 18px;">${nt.n_content } </span> <br>
				<div style="width: 100%; min-height: 1px; height: 50px;"></div>

				<img
					src="${pageContext.request.contextPath}/resources/img/${nt.n_photo }"
					style="width: 200px; height: 200px;">
			</div>


			<div class="file_area"></div>
		</div>
		<div class="comment_section">
			<div class="list_tap"></div>


			<c:if test="${member_session.m_id eq 'admin'}">

				<div id="boardcss_list_add_button_table">
					<button class="btn" onclick="goUpdateNotice(${nt.n_no })">수정</button>
					<button class="btn" onclick="goDelNotice(${nt.n_no })">삭제</button>
				</div>


			</c:if>
		</div>








</body>
</html>