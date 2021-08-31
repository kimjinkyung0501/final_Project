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

		$('#comeBackToHome').click(function() {
			location.replace('message.go');

		});

	});
</script>

<style type="text/css">
.text-box {
	position: absolute;
	left: 500px;
	top: 200px;
}

.hori_cont {
	padding: 30px;
	border: 1px solid lightgray;
	display: flex;
	margin-bottom: 30px;
}

.profile_wrap {
	width: 20%;
}

.profile_img {
	width: 152px;
	height: 152px;
	overflow: hidden;
	border-radius: 50%;
	margin: 0 auto;
}

.profile_img img {
	width: 100%;
	height: 100%;
}

.detail {
	margin-left: 100px;
}

.middle {
	font-size: 11pt;
}
#comeBackToHome{
margin-top : 30px;
border: 1px solid gray;
background-color: white;
}

</style>

</head>

<body>




	<form name="message" action="message.go">
		<div class="hori_cont">
			<div class="profile_wrap">
				<div class="profile_img">
					<img
						src="${pageContext.request.contextPath}/resources/img/resulticon.png">
				</div>
			</div>

			<div class="detail">
				<div class="top">
					<div class="user_name">${result_C}</div>

				</div>
				<input type="hidden" id="id"
					value="${sessionScope.member_session.m_id}" name="msg_reciver">
				<input type="hidden" id="id2"
					value="${sessionScope.member_session.m_id}" name="msg_sender">
				<button id='comeBackToHome'>메시지 홈으로 돌아가기</button>


			</div>
		</div>
	</form>








</body>
</html>