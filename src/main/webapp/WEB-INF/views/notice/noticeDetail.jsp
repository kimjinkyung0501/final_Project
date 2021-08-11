<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.holder {
	position: relative;
}

#board-title {
	font-size: 20px;
	margin-bottom: 15px;
}

#board_view header .view_tit {
	display: inline-block;
	margin-bottom: 0;
}

#board-title holder {
	font-family: 'Noto Sans', 'sans-serif';
	color: #4f4f4f;
	font-size: 12px;
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

/* 수정 삭제 버튼 예쁘게  */
#test_btn1 {
	margin-right: 0px;
}

#test_btn2 {
	margin-left: 2px;
}

#btn_group button {
	border: 1px solid gray;
	background-color: rgba(0, 0, 0, 0);
	color: gray;
	padding: 5px;
}

#btn_group button:hover {
	color: white;
	background-color: gray;
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
					<img src="resources/img/default_profile.png" class="avatar-image"
						style="width: 50px;">
					<div class="avatar1">
						<div class="write">${nt.n_id }</div>

					</div>
				</div>
				<hr size="1" noshade style="width: 200%;">
			</div>
		</div>

		<div class="margin-top-xxl">
			<p>
				<span style="font-size: 14px;">${nt.n_content } </span> <br> <img
					alt="X" src="resources/img/${nt.n_photo }" style="width: 250px">
			</p>
		</div>
		<div class="file_area"></div>
	</div>
	<div class="comment_section">
		<div class="list_tap"></div>


		<div id="btn_group">
			<c:if test="${member_session.m_id eq 'admin'}">
				<button id="test_btn1" onclick="goUpdateNotice(${nt.n_no })">수정</button>
				<button id="test_btn2" onclick="goDelNotice(${nt.n_no })">삭제</button>
			</c:if>
		</div>
	</div>










</body>
</html>