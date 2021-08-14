<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=PT+Serif&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchMemberInfo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage.css">
<link rel="icon" type="image/png" href="…">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//menu v1 
		$(".menu-v1").mouseover(function() {
			$(this).children(".submenu").stop().slideDown();
		});
		$(".menu-v1").mouseleave(function() {
			$(this).children(".submenu").stop().slideUp();
		});

	});
</script>
</head>


<body>
	<header>

		<!--   Menu icon -->
		<div class="icon-close">
			<!-- 	<img src="resources/img/menuIcon.png" style="width: 25px;"> -->
		</div>
		<div class="black" style="width: 360px;"></div>
		<a href="/jk/" style="font-size: 20pt; font-weight: bold;">생활수집</a>


		<nav id="menu1">
			<ul style="list-style-type: none">
				<li style="display: inline"><span><a href="/jk/">Home
					</a></span></li>
				<li style="display: inline"><span><a href="">Class </a></span>
				</li>
				<li style="display: inline"><span><a
						href="${pageContext.request.contextPath}/product.go">Product </a></span></li>
				<li style="display: inline"><span><a href="">Story </a></span>
				</li>
				<li style="display: inline"><span><a href="">Chat </a></span></li>
			


				<!-- 로그인별 메뉴바 처리  -->
				<c:choose>
					<c:when test="${empty sessionScope}">
	<li style="display: inline"><span><a
						href="${pageContext.request.contextPath}/common/login.main">MyPage
					</a></span></li>
						<li style="display: inline"><span><a
								href="${pageContext.request.contextPath}/common/login.main">Log
									in </a></span></li>
					</c:when>


					<c:when test="${member_session.m_id eq 'admin'}">
						<li style="display: inline"><span><a href="">Manager
							</a></span></li>
						<li style="display: inline"><span><a
								href="${pageContext.request.contextPath}/common/myPage.go">MyPage
							</a></span></li>
						<li style="display: inline"><span><a
								onclick="return logout('${sessionScope.member_session}','${sessionScope.kakao_member_session }')">Log
									out </a></span></li>
					</c:when>
					<c:when test="${!empty sessionScope}">
						<li style="display: inline"><span><a
								href="${pageContext.request.contextPath}/store.go?m_id=${sessionScope.member_session.m_id}">Store
							</a></span></li>
						<li style="display: inline"><span><a
								onclick="return goMyPage('${sessionScope.member_session}','${sessionScope.kakao_member_session }'); "
								href="${pageContext.request.contextPath}/common/myPage.go">MyPage</a></span></li>
						<li style="display: inline"><span><a
								onclick="logout('${sessionScope.member_session}','${sessionScope.kakao_member_session }')">Log
									out </a></span></li>
					</c:when>


				</c:choose>

			</ul>
		</nav>
	</header>



	<form action="search.all">
		<div>
			<input class="search_input" name="search" style="display:"
				placeholder="Search" value="">
			<button type="button" class="search_btn">
				<img
					src="${pageContext.request.contextPath}/resources/img/search_magnifier_icon_145939.png"
					class="search_icon">
			</button>
		</div>
	</form>
	<%-- 	<div style="width: 100%; min-height: 10px; height: 40px;"></div>
	<div class="menu2">
		<ul id="menu2">
			<li>Class</li>
			<li>Product</li>
			<li>Story</li>
			<li>Chat</li>
			<li class="menu-v1"><a
				href="${pageContext.request.contextPath}/common/myPage.go">MyPage</a>
				</li>
 --%>

	<div style="width: 100%; min-height: 10px; height: 40px;"></div>



	<div id="container">
		<ul id="nav-v1">
			<li class="menu-v1"><a href="#">Class</a>
				<ul class="submenu">
					<li><a href="#">드로잉</a></li>
					<li><a href="#">공예</a></li>
					<li><a href="#">요리</a></li>
					<li><a href="#">사진</a></li>
					<li><a href="#">음악</a></li>
					<li><a href="#">게임</a></li>
					<li><a href="#">디자인</a></li>
					<li><a href="#">개발</a></li>
					<li><a href="#">글쓰기</a></li>
					<li><a href="#">기타</a></li>
				</ul></li>
			<li class="menu-v1"><a href="#">Product</a>
				<ul class="submenu">
					<li><a href="#">식품</a></li>
					<li><a href="#">악세사리</a></li>
					<li><a href="#">의류</a></li>
					<li><a href="#">전자기기</a></li>
					<li><a href="#">주방</a></li>
					<li><a href="#">잡화</a></li>
					<li><a href="#">인테리아</a></li>
					<li><a href="#">육아</a></li>
					<li><a href="#">기타</a></li>
				</ul></li>
			<li class="menu-v1"><a href="#">Story</a></li>

			<li class="menu-v1"><a href="#">Chat</a></li>
			<c:choose>
				<c:when test="${empty sessionScope}">
					<li class="menu-v1"><a
						href="${pageContext.request.contextPath}/common/login.main">MyPage</a>
					</li>

				</c:when>


				<c:when test="${!empty sessionScope}">
					<li class="menu-v1"><a
						href="${pageContext.request.contextPath}/common/myPage.go">MyPage</a>
						<ul class="submenu">
							<li><a href="#">주문조회</a></li>
							<li><a href="#">장바구니</a></li>
							<li><a
								href="${pageContext.request.contextPath}/common/changeInfo.go">정보수정</a></li>
						</ul></li>
				</c:when>
			</c:choose>


			<li class="menu-v1"><a
				href="${pageContext.request.contextPath}/store.go?m_id=${sessionScope.member_session.m_id}">Store</a>
			</li>
		</ul>
		<div class="clear"></div>
	</div>

	<div class="text-table" style="padding-left: 10px; margin-left: 10px;">
		<div style="width: 100%; height: 5px;"></div>
		<p>
			<a href="${pageContext.request.contextPath}/notice/notice.go"><span
				style="letter-spacing: 1px;">READ ME FIRST</span></a>
		</p>
		<span style="letter-spacing: 1px;"><br></span>
		<p>
			<a href="${pageContext.request.contextPath}/about.go"><span
				style="letter-spacing: 1px;">ABOUT</span></a>
		</p>
		<span style="letter-spacing: 1px;"><br></span>
		<p>
			<a href="${pageContext.request.contextPath}/dropdown.test"><span
				style="letter-spacing: 1px;">FAQ</span></a>
		</p>
		<span style="letter-spacing: 1px;"><br></span>
		<p>
			<a href="${pageContext.request.contextPath}/policy.go"><span
				style="letter-spacing: 1px;">POLICY</span></a>
		</p>
	</div>









	<div align="left" id="content">
		<div class="text-box">
			<jsp:include page="${contentPage}"></jsp:include>
		</div>
	</div>







	<div class="text-table2">
		<p>
			<span style="letter-spacing: 1px;">LIVING COLLECT</span>
		</p>
		<p>
			<span style="letter-spacing: 1px;">02.802-0802</span>
		</p>
		<p>
			<span style="letter-spacing: 1px;">MON - FRI. AM 09 - PM 06</span>
		</p>
	</div>

	<div class="text-table2">
		<div>
			<div dir="ltr">
				<div dir="ltr">
					<div dir="ltr">
						<div dir="ltr">
							<span style="letter-spacing: 1px;"> </span>
							<p class="p1">
								<span style="letter-spacing: 1px;">SEOUL, KOREA</span>
							</p>
							<span style="letter-spacing: 1px;"> </span>
							<p>
								<span style="letter-spacing: 1px;"><br></span>
							</p>
							<p>
								<span style="letter-spacing: 1px;">BUSSINESS LICENE </span>
							</p>
							<p>
								<span style="letter-spacing: 1px;">802-11-12345&nbsp;/
									2021-서울종로-0826</span>
							</p>
							<p>
								<span style="letter-spacing: 1px;">OWNER&nbsp;</span><span
									style="color: inherit; font-family: inherit; font-size: inherit; line-height: inherit; letter-spacing: 1px; background-color: transparent;">TWO
									TEAM</span><span style="letter-spacing: 1px;"><br></span>
							</p>
							<p>
								<span style="letter-spacing: 1px;">@생활수집&nbsp;</span><span
									style="color: inherit; font-family: inherit; font-size: inherit; line-height: inherit; letter-spacing: 0px; background-color: transparent;">ALL
									RIGHTS RESERVED.</span>
							</p>







						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<footer>
		<p>생활수집</p>
	</footer>
</body>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/notice.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/locationFile.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/Valid.js"></script>



</html>
