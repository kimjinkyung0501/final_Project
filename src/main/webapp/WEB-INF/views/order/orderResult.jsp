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

.detail{
margin-left: 100px;
}

.middle{
font-size: 11pt;
}

</style>
</head>
<body>

	<div class="hori_cont">
				<div class="profile_wrap">
					<div class="profile_img">
						<img src="${pageContext.request.contextPath}/resources/img/resulticon.png">
					</div>
				</div>

				<div class="detail">
					<div class="top">
						<div class="user_name">${r }</div>

					</div>

					<ul class="middle">
						<li><span>주문내역 조회는 <a style="color: blue;" href="${pageContext.request.contextPath}/common/toOrderPage.go" >주문조회</a> 를 통하여 확인 가능합니다.</span></li>
					</ul>
					<ul class="middle">
						<li><span>수강내역 조회는 <a style="color: blue;" href="${pageContext.request.contextPath}/common/take.class" >수강신청조회</a> 를 통하여 확인 가능합니다.</span></li>
					</ul>

				</div>
			</div>






</body>
</html>