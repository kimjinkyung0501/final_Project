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
	top: 30%;
}

.site_nav {
	margin: 0;
	padding: 0;
}

.categorize ul li {
	list-style: none;
	float: left;
	line-height: 30px;
	display: inline;
	padding: 0px 10px 0px 10px;
	margin: 0px 0px 0px 0px;
	font-family: 'PT Serif', serif;
	border-left: 1px solid gray;
}

.categorize .searchmenu {
	text-decoration: none;
	width: 150px;
	font-size: 17px;
	font-family: 'PT Serif', serif;
}

.categorize .searchmenu:hover {
	font-weight: bold;
}

.search_content {
	float: left;
}

a {
	text-decoration: none;
	:
	none;
}

li a:hover:not(.active) {
	
}

</style>

</head>
<body>

	<div class="categorize">
		<ul class="site_nav">
			<li><a class="searchmenu" href="#home">ALL</a></li>
			<li><a class="searchmenu" href="#news">CLASS</a></li>
			<li><a class="searchmenu" href="#contact">PRODUCT</a></li>
			<li><a class="searchmenu" href="#about">ETC</a></li>
		</ul>
		<div style="width: 100%; min-height: 10px; height: 60px;"></div>
		<span class="categorize_quantity" style="font-size: 10pt;">79개의
			검색 결과</span>
	</div>

	<div style="width: 100%; min-height: 10px; height: 40px;"></div>

	<div class="repeat_area">
		<div class="box_thumb">
			<a href=""> <img title=""
				src="https://cdn.imweb.me/thumbnail/20210429/ee96b6d2d0ef2.jpeg"
				style="width: 130px"></a>
		</div>
		<div class="search_content">
			<div class="search_category">
				<a href=""> <span class="">카테고리명</span></a>
			</div>
			<div class="search_title">
				<span><a href="">상품명</a></span>
			</div>
			<div class="search_sub">
				<span><a href="">간략 상품설명이나 가격?</a></span>
			</div>

		</div>
	</div>

	




</body>
</html>