<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="resources/css/index.css">
<link rel="icon" type="image/png" href="…">

<style type="text/css">


</style>

</head>


<body>
	<header>

		<!--   Menu icon -->
		<div class="icon-close">
			<!-- 	<img src="resources/img/menuIcon.png" style="width: 25px;"> -->
		</div>
		<div class="black" style="width: 150px;"></div>
		<a href="home.go" style="font-size: 20pt; font-weight: bold;">생활수집</a>


		<nav id="menu1">
			<ul style="list-style-type: none">
				<li style="display: inline"><span><a href="home.go">Home
					</a></span></li>
				<li style="display: inline"><span><a href="">Class </a></span>
				</li>
				<li style="display: inline"><span><a href="">Product
					</a></span></li>
				<li style="display: inline"><span><a href="">Story </a></span>
				</li>
				<li style="display: inline"><span><a href="">Chat </a></span></li>
				<li style="display: inline"><span><a href="">MyPage
					</a></span></li>
				<li style="display: inline"><span><a href="">Login </a></span></li>
			</ul>
		</nav>
	</header>

	<form action="search.all">
		<div>
			<input class="search_input" name="search" style="display:"
				placeholder="Search" value="">
			<button type="button" class="search_btn">
				<img src="resources/img/search_magnifier_icon_145939.png"
					class="search_icon">
			</button>
		</div>
	</form>
	<div style="width: 100%; min-height: 10px; height: 40px;"></div>
	<div id="menu2">
		<li>Class</li>
		<li>Product</li>
		<li>Story</li>
		<li>Chat</li>
		<li>MyPage</li>
		<li>Login</li>
	</div>


	<div align="left" id="content">
		<div class="text-box">
			<jsp:include page="${contentPage }"></jsp:include>
		</div>
	</div>






	<div class="text-table">
		</p>
		<p>
			<a href="readme"><span style="letter-spacing: 1px;">READ
					ME</span></a>
		</p>
		<span style="letter-spacing: 1px;"><br></span>
		<p>
			<a href="about"><span style="letter-spacing: 1px;">ABOUT</span></a>
		</p>
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
									2021-서울종로-0826</span></a>
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
</html>
</body>
</html>