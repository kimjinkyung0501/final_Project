<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		$("#WhichOne").append("<div>" + " <hr> " + "</div>");

		$('#choose')
				.click(
						function() {

							let reason = document.getElementById('s_reason').value

							if (reason == 'yet') {
								alert('신고 사유를 선택해 주세요!!!')
								return false;
							} else {
								$("#compainContent").empty();
								$("#compainContent")
										.append(
												"<input name='c_reason' value='"+reason+"' type='hidden'>");
								$("#compainContent")
										.append(
												"신고내용<input name='c_content' style='width: 500px; height: 100px;'>");
								$("#compainContent").append(
										"<button>작성완료</button>");

							}

						});
	});
</script>
<style type="text/css">
#compainContent {
	top: 1px; /* input 요소의 border-top 설정값 만큼 */
	left: 1px; /* input 요소의 border-left 설정값 만큼 */
	padding: .8em .5em; /* input 요소의 padding 값 만큼 */
	color: #999;
	cursor: text;
	top: 1px;
}

hr {
	border: 0.1px solid #eee;;
	border-bottom: none;
}

#compainContent button {
	margin-left: 290px;
	margin-top: 5px;
	border: 0.5px solid gray;
	background: white;
	border-radius: 3px;
	height: 40px;
	margin-top: 5px;
}

#choose {
	margin-top: 5px;
	border: 0.5px solid gray;
	background: white;
	border-radius: 3px;
	height: 30px;
	width: 60px;
}

body{
padding: 30px;

}
</style>
</head>
<body>
	<h2>불편 사항 신고</h2>
	<h4>*어떤 내용을 신고하고 싶으신가요 ?</h4>


	<div id="WhichOne">
		<select id='s_reason' name='s_reason'>

			<option id="1" value="yet">신고 내용 선택</option>
			<option id="1" value="otherUser">다른 사용자 신고</option>
			<option id="2" value="contrects">거래 오류</option>
			<option id="4" value="accounts">계정오류</option>
			<option id="3" value="ETC">기타</option>
		</select>
		<button id="choose">선택</button>

	</div>
	<form action="admin.reportMessageSend">
		<input name='c_id' type="hidden" value="${sessionScope.member_session.m_id}">

		<div id="compainContent"></div>

	</form>





</body>
</html>