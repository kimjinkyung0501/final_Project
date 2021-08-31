<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
$
green: #86BB71 ; $blue: #94C2ED ; $orange: #E38968 ; $gray: #92959E ;
	.container {
	margin: 0 auto;
	max-width: 600px;
	background: #444753;
	border-radius: 5px;
	font-family: 'PT Serif', serif;
	font-family: 'Pretendard-Regular';
}

.people-list {
	margin: 5px;
	margin-bottom: 50px;
	padding: 2px;
	width: 150px;
	float: left;
	height: 645px;
	overflow-y: scroll;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	align-content: flex-start;
	width: 150px;
	font-family: 'Pretendard-Regular';
}

.f_name {
	padding: 20px 5px;
	display: flex;
	vertical-align: baseline;
}

.right {
	margin-left: 110px;
}

#textDiv {
	padding: 10px 10px 10px;
	border-bottom: 2px solid white;
	overflow: scroll;
	height: 520px;
	animation: fadeIn 1s ease-in;
}

#sendBarDiv {
	padding: 20px;
	margin-left: 50px;
	background-color: #EEEEEE;
}

#sendBarDiv input {
	width: 100%;
	border: none;
	padding: 10px 20px;
	font: 14px/22px "Lato", Arial, sans-serif;
	margin-bottom: 10px;
	border-radius: 5px;
	resize: none;
}

.sendinput {
	background: #94C2ED;
}

.sendinput {
	color: white;
	padding: 10px 15px;
	line-height: 20px;
	font-size: 12px;
	border-radius: 7px;
	margin-bottom: 10px;
	margin-left: 300px;
	width: 150px;
	position: relative;
}

hr {
	border: 0.1px solid #eee;;
	border-bottom: none;
}

.reciveinput {
	background: #eee;
}

.reciveinput {
	color: darkgray;
	padding: 10px 15px;
	line-height: 20px;
	font-size: 12px;
	border-radius: 7px;
	margin-bottom: 10px;
	width: 150px;
	position: relative;
	animation: fadeIn 1s ease-in;
}

.profile-image {
	width: 30px;
	height: 30px;
	border-radius: 40px;
}

.profile-image img {
	vertical-align: middle;
	border-style: none;
}

#reportMessage {
	border: none;
	background-color: white;
	font-size: 5pt;
	color: gray;
}

#newMessage {
	border: none;
	background-color: white;
	font-size: 5pt;
	color: gray;
}

.btn-img {
	width: 20px;
	height: 20px;
}

#menu {
	margin-left: 510px;
}

.sendButton {
	margin-left: 4px;
}

#newReciver {
	top: 1px; /* input 요소의 border-top 설정값 만큼 */
	left: 1px; /* input 요소의 border-left 설정값 만큼 */
	padding: .8em .5em; /* input 요소의 padding 값 만큼 */
	color: #999;
	cursor: text;
}

#newMessageInput {
	margin-top: 10px;
	top: 1px; /* input 요소의 border-top 설정값 만큼 */
	left: 1px; /* input 요소의 border-left 설정값 만큼 */
	padding: .8em .5em; /* input 요소의 padding 값 만큼 */
	color: #999;
	cursor: text;
	height: 80px;
}

.newReciverCheck {
	border: 0.5px solid gray;
	background: white;
	border-radius: 3px;
	height: 40px;
	margin-left: 5px;
}

#newMessageBtn {
	margin-top: 5px;
	border: 0.5px solid gray;
	background: white;
	border-radius: 3px;
	height: 40px;
}

#span {
	font-size: 6pt;
}

.timeInputL {
	color: $gray;
	font-size: 5px;
	padding-left: 6px;
}

.timeInputR {
	color: $gray;
	font-size: 5px;
	padding-left: 6px;
	margin-left: 385px;
}

.friendDiv {
width : 96%;
	float: left;
	background: #F2F5F8;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	color: #434651;
	padding: 20px;
	border-bottom: 2px solid white;
}
</style>


</head>
<body>
	<h6 style="margin-left: 30px;">메시지 페이지</h6>

	<input type="hidden" id="me"
		value="${sessionScope.member_session.m_id}" name="me">

	<div id="menu">
		<button id="newMessage">
			<img
				src="${pageContext.request.contextPath}/resources/img/chatIcon.png"
				class="btn-img"> <br> 새 메시지
		</button>
		<button id="reportMessage">
			<img src="${pageContext.request.contextPath}/resources/img/siren.png"
				class="btn-img"> <br> 불편사항 & 신고
		</button>

	</div>
   <div class="people-list" style="display: flex;">
      <c:forEach items="${messaegs}" var="ms">
         <!-- 그냥 진경이 넣은 기본 프로필 이미지임 -->
         

         <div class="f_name" style="">
         
          <div class="f_cnt"><span><h5 style="color: skyblue;"> ${ms.didntRead}</h5></span></div>
         
         <input type="hidden" value="${ms.didntRead}" class="f_cntInput">
         <img
            src="${pageContext.request.contextPath}/resources/img/chatProfile.jpg"
            class="profile-image">
            <!-- 내 아이디 빼도 되나요 ? -->

               
            ${ms.sender} 
            <input type="hidden" class="friend" id="friend" value="${ms.sender}"
               name="friend">
         </div>
         
      </c:forEach>
   </div>
   
	<div class="right">

		<!-- 대화 내용 -->
		<div id="textDiv"></div>


		<!--메세지 전송창  -->
		<div id="sendBarDiv"></div>
	</div>

<script type="text/javascript">

$('#textDiv').scrollTop($('#textDiv')[0].scrollHeight);

</script>
</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/message.js"></script>

</html>