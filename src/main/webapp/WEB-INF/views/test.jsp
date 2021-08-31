<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<style type="text/css">
.contact {
	position: relative;
	max-width: 420px;
	padding: 40px 20px;
	overflow: hidden;
	margin: 0 auto;
}

.contact-area {
	width: 100%;
	height: 100vh;
	position: relative;
}

.contact main section .content {
	float: left;
	width: 100%;
	padding: 20px 30px 50px 30px;
	position: relative;
	text-align: center;
}

.contact main section .content img {
	display: inline-block;
	width: 140px;
	border-radius: 50%;
}

.contact main .title {
	float: left;
	width: 100%;
	background-color: #c63535;
	max-height: 0px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	overflow: hidden;
	-webkit-transition: all 0.55s;
	-moz-transition: all 0.55s;
	-o-transition: all 0.55s;
	transition: all 0.55s;
}

.contact main button {
	position: absolute;
	bottom: 0;
	right: 50%;
	background-color: #ffbe44;
	color: #c63535;
	border: 0;
	width: 200px;
	height: 48px;
	text-align: center;
	border-radius: 30px;
	font-size: 16px;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	margin-bottom: -24px;
	margin-right: -100px;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	transition-delay: 0.1s;
	outline: none;
	overflow: hidden;
	z-index: 10;
	font-family: inherit;
}

.contact main section .content aside h1 {
	font-weight: 100;
	font-size: 22px;
	margin-bottom: 10px;
}

.contact main section .content aside p {
	font-size: 14px;
	letter-spacing: 0.5px;
	line-height: 160%;
}

.contact main button svg {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	opacity: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.contact main button.active {
	margin-right: 0;
	right: 20px;
	width: 65px;
	height: 65px;
	margin-bottom: -32.5px;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	border-radius: 65px;
	box-shadow: 0px 3px 15px rgb(0 0 0/ 20%);
}

.contact main button svg {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	opacity: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.contact main button svg path {
	fill: #c63535;
}

.contact main .title {
	float: left;
	width: 100%;
	background-color: #c63535;
	max-height: 0px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	overflow: hidden;
	-webkit-transition: all 0.55s;
	-moz-transition: all 0.55s;
	-o-transition: all 0.55s;
	transition: all 0.55s;
}

.contact main .title p {
	padding: 15px 30px;
	color: #ffffff;
	font-size: 16px;
	display: inline-block;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	-webkit-transform: scale(0);
	-moz-transform: scale(0);
	-ms-transform: scale(0);
	-o-transform: scale(0);
	transform: scale(0);
}

.contact nav.active {
	max-height: 600px;
	-webkit-transition: all 1s;
	-moz-transition: all 1s;
	-o-transition: all 1s;
	transition: all 1s;
}

.contact nav {
	float: left;
	width: 100%;
	overflow: hidden;
	max-height: 0px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.contact nav.active a:nth-of-type(1) {
	transition-delay: 0.5s;
}

.contact nav.active a {
	opacity: 1;
	-webkit-transform: translateY(0px);
	-moz-transform: translateY(0px);
	-ms-transform: translateY(0px);
	-o-transform: translateY(0px);
	transform: translateY(0px);
	-webkit-transition: all 0.7s;
	-moz-transition: all 0.7s;
	-o-transition: all 0.7s;
	transition: all 0.7s;
}

.contact nav a {
	float: left;
	width: 100%;
	margin-top: 18px;
	background-color: #ffffff;
	padding: 18px 20px;
	border-radius: 5px;
	text-decoration: none;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	opacity: 0;
	-webkit-transform: translateY(-10px);
	-moz-transform: translateY(-10px);
	-ms-transform: translateY(-10px);
	-o-transform: translateY(-10px);
	transform: translateY(-10px);
	position: relative;
}

.contact nav a .content h1 {
	font-size: 20px;
	font-weight: 400;
	line-height: 160%;
	letter-spacing: 0.4px;
}

.contact nav a .content span {
	font-size: 14px;
	color: #b3b3b3;
	display: block;
	letter-spacing: 0.4px;
}

.contact nav a .arrow {
	position: absolute;
	right: 15px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
}
</style>
</head>
<body>

	<c:forEach items="${AllMembers}" var="m">
	<div class="contact-area">
		<div class="contact" id="div2">
			<main>
				<section>
					<div class="content">
							<img src="resources/img/${m.m_photo}" type="hidden">

						<aside>
							<h1>${m.m_name} <input class="info_name" value="${m.m_name}"
						type="hidden"></h1>
							<p>${m.m_phone} <input class="info_phone" value="${m.m_phone}"
						type="hidden"></p>
							<p> ${m.m_email} <input class="info_email" value="${m.m_email}"
						type="hidden"></p>
						</aside>

						<button>
							<span>More</span>

							<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
								viewBox="0 0 48 48"> <g class="nc-icon-wrapper"
									fill="#444444"> <path
									d="M14.83 30.83L24 21.66l9.17 9.17L36 28 24 16 12 28z"></path> </g> </svg>
						</button>
					</div>

					<div class="title">
						<p>Contact Me</p>
					</div>
				</section>


			</main>

			<nav>
				<a href="#" class="gmail">
				<!-- 	<div class="icon">
						<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
						 </svg>
					</div> -->

					<div class="content">
						<h1>ID</h1>
						<span> ${m.m_id} <input class="info_id" value="${m.m_id}"
						type="hidden"></span>
					</div>
					<div class="content">
						<h1>PW</h1>
						<span> ${m.m_pw} <input class="info_pw" value="${m.m_pw}"
						type="hidden"></span>
					</div>
					
					<div class="content">
						<h1>ADDR</h1>
						<span>  ${m.m_addr} <input class="info_addr" value="${m.m_addr}"
						type="hidden"></span>
					</div>
					
					<div class="content">
						<h1>STATUS</h1>
						<span>  <c:choose>
						<c:when test="${m.m_grade == 1}">일반회원 </c:when>
						<c:when test="${m.m_grade == 2}">판매대기</c:when>
						<c:when test="${m.m_grade == 3}">판매 중</c:when>
						<c:when test="${m.m_grade == 4}">판매 반려</c:when>
					</c:choose>
					<input class="info_grade" value="${m.m_grade}" type="hidden"></span>
					</div>
					
					
					
					 <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="48px"
						height="48px;" viewBox="0 0 48 48"> <g class="nc-icon-wrapper"
							fill="#444444"> <path
							d="M17.17 32.92l9.17-9.17-9.17-9.17L20 11.75l12 12-12 12z"></path> </g> </svg>
				</a> 
				
			</nav>
			
			
				<div>
					<button class="modiBtn">수정</button>
				</div>


				<form action="admin.memberRenew">
					<div class="div3"></div>
				</form>
			
		</div>
	</div>
		</c:forEach>


	<script type="text/javascript">
		$('button').click(function() {
			$('button').toggleClass('active');
			$('.title').toggleClass('active');
			$('nav').toggleClass('active');
		});
	</script>
</body>

</html>