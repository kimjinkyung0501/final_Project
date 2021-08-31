<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		$('#thumbnails1').click(function() {

			$("#textDiv").append("<div>${Rank[0].p2_p_name}</button></div>");

			});
		$('#thumbnails12').click(function() {
			$("#textDiv").append("<div>${Rank[1].p2_p_name}</button></div>");


		});
		
		
		
		
		
		
	});
</script>

<style type="text/css">
body {
	margin: 15px;
}

.text-box {
	position: absolute;
	left: 500px;
	top: 220px;
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
.allbtn {
	left: 500px;
	display: inline-block;
	border: 1px solid #efefef;
	font-size: 17px;
	cursor: pointer;
	list-style: none;
	margin: 5px;
	padding: 5px;
	width: 120px;
	height: 45px;
	text-align: center;
}

ul.mylist, ol.mylist {
	list-style: none;
	margin: 3px;
	padding: 3px;
	max-width: 900px;
	width: 700px;
}

ul.mylist li, ol.mylist li {
	display: inline-block;
	padding: 18px;
	margin-bottom: 5px;
	border: 1px solid #efefef;
	font-size: 18px;
	cursor: pointer;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	display: inline-block;
}

ul.mylist li, ol.mylist li {
	-webkit-transition: background-color 0.3s linear;
	-moz-transition: background-color 0.3s linear;
	-ms-transition: background-color 0.3s linear;
	-o-transition: background-color 0.3s linear;
	transition: background-color 0.3s linear;
}

ul.mylist li:hover, ol.mylist li:hover {
	background-color: #f6f6f6;
}
</style>
</head>
<body>


	<!--  배열로 처리하기..... -->
	<h3 align="center">Product Best</h3>
	<h5 align="center" style="font-weight: lighter; color: #363636;">가치있는
		소비 생활을 제안합니다.</h5>
	<div style="margin-top: 50px;"></div>

	<div class="container1">
		<ul class="slides">
			<li id="slide1"><a
				href="${pageContext.request.contextPath}/product.detail2?p_no=${Rank[0].p2_o_no}">
					<img style="height: 440px; width: 500px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[0].p2_p_photo}"
					alt="" />
			</a></li>
			<li id="slide2"><a
				href="${pageContext.request.contextPath}/product.detail2?p_no=${Rank[01].p2_o_no}">
					<img style="height: 440px; width: 500px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[1].p2_p_photo}"
					alt="" />
			</a></li>
			<li id="slide3"><a
				href="${pageContext.request.contextPath}/product.detail2?p_no=${Rank[2].p2_o_no}">
					<img style="height: 440px; width: 500px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[2].p2_p_photo}"
					alt="" />
			</a></li>
			<li id="slide4"><a
				href="${pageContext.request.contextPath}/product.detail2?p_no=${Rank[3].p2_o_no}">
					<img style="height: 440px; width: 500px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[3].p2_p_photo}"
					alt="" />
			</a></li>
		</ul>

		<ul class="thumbnails">
			<li><a id="thumbnails1" href="#slide1"><img id="thumbnails1"
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[0].p2_p_photo}" /></a>
			</li>
			<li><a id="thumbnails2" href="#slide2"><img id="thumbnails2"
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[1].p2_p_photo}" /></a>
			</li>
			<li><a href="#slide3"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[2].p2_p_photo}" /></a>
			</li>
			<li><a href="#slide4"><img
					style="height: 100px; width: 150px;"
					src="${pageContext.request.contextPath}/resources/img/${Rank[3].p2_p_photo}" /></a>
			</li>
		</ul>
	</div>




	<div id="textDiv">
	</div>




	<div style="margin-top: 50px;"></div>

	<div style="margin-left: 265px;">
		<ul class="allbtn">
			<li style=""><a
				href="${pageContext.request.contextPath}/product.go"
				style="font-weight: bold;"> Product All</a><br>
		</ul>
	</div>


	<div style="margin-top: 50px;"></div>




	<script type="text/javascript">
		/* $(".thumbnails").click(function(e) {

		 // 스크롤 방지 코드 
		 e.preventDefault();
		 });
		 */
	</script>


</body>
</html>