<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	margin: 15px;
}

.text-box {
	position: absolute;
	left: 500px;
	top: 170px;
}

.container1 {
	display: flex;
	justify-content: center;
}

.thumbnails {
	display: flex;
	flex-direction: column;
	line-height: 0;
	li
	{
	flex
	:
	auto;
}

a {
	display: block;
}

img {
	object-fit: cover;
	object-position: top;
}

}
.slides {
	overflow: hidden;
	height: 400px;
	width: 500px; li { width : 0;
	height: 100vmin;
	position: absolute;
	z-index: 1;
}

img {
	height: 100vmin;
	object-fit: cover;
	object-position: top;
}

}
.slides li:target {
	z-index: 3;
	-webkit-animation: slide 1s 1;
}

.slides li:not(:target) {
	-webkit-animation: hidden 1s 1;
}

@
keyframes slide { 0% {
	transform: translateY(-100%);
}

100


%
{
transform


:


translateY
(


0
%


)
;


}
}
@
keyframes hidden { 0% {
	z-index: 2;
}
100


%
{
z-index


:


2
;


}
}
</style>
</head>
<body>

	<h4 align="center">Product Best</h4>
	<div style="margin-top: 50px;"></div>
	<div class="container1">
		<ul class="slides">
			<li id="slide1"><img style="height: 440px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/100.jpg"
				alt="" /></li>
			<li id="slide2"><img style="height: 440px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/101.jpg"
				alt="" /></li>
			<li id="slide3"><img style="height: 440px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/102.jpg"
				alt="" /></li>
			<li id="slide4"><img style="height: 440px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/103.jpg"
				alt="" /></li>
		</ul>

		<ul class="thumbnails">
			<li><a href="#slide1"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/100.jpg" /></a>
			</li>
			<li><a href="#slide2"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/101.jpg" /></a>
			</li>
			<li><a href="#slide3"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/102.jpg" /></a>
			</li>
			<li><a href="#slide4"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/103.jpg" /></a>
			</li>
		</ul>
	</div>
	<a> 상품명 상품가격</a>





	<div style="margin-top: 150px;"></div>





	<h4 align="center">Class Best</h4>
	<div style="margin-top: 50px;"></div>
	<div class="container1">
		<ul class="slides">
			<li id="slide6"><img style="height: 400px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/101.jpg"
				alt="" /></li>
			<li id="slide7"><img style="height: 400px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/lp.jpg" alt="" /></li>
			<li id="slide8"><img style="height: 400px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/index.jpg"
				alt="" /></li>
			<li id="slide9"><img style="height: 400px; width: 500px;"
				src="${pageContext.request.contextPath}/resources/img/etcAll.png"
				alt="" /></li>
		</ul>

		<ul class="thumbnails">
			<li><a href="#slide6"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/101.jpg" /></a></li>
			<li><a href="#slide7"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/lp.jpg" /></a></li>
			<li><a href="#slide8"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/index.jpg" /></a>
			</li>
			<li><a href="#slide9"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/etcAll.png" /></a>
			</li>
		</ul>
	</div>
	<a> 클래스명 가격</a>


</body>
</html>