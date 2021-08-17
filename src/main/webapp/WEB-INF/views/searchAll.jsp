<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.box_thumb {
	float: left;
	margin-right: 10px;
}

.search_content {
	width: 500px;
	padding: 10px;
}

a {
	text-decoration: none; : none;
	margin: 5px;
	width: 500px;
}

li a:hover:not(.active) {
	
}
</style>

</head>
<body>

	<div class="categorize">
		<ul class="site_nav">
			<li><a class="searchmenu" href="#ALL">ALL</a></li>
			<li><a class="searchmenu" href="#CLASS">CLASS</a></li>
			<li><a class="searchmenu" href="#PRODUCT">PRODUCT</a></li>
			<li><a class="searchmenu" href="#STORE">STORE</a></li>
			<li><a class="searchmenu" href="#ETC">ETC</a></li>
		</ul>
		<div style="width: 100%; min-height: 10px; height: 50px;"></div>
		<hr style="border-top: 1px double lightgray; width: 700px;">
		<div style="width: 100%; min-height: 10px; height: 20px;"></div>


		<!-- ??로 검색된 결과가 ?? 개 있습니다.  -->
		<c:choose>
			<c:when test="${not empty keyword }">
				<p>
					<span class="categorize_quantity" style="font-size: 10pt;"><strong>${keyword }
					</strong>키워드로 검색된 
					
					<strong>${totalRow  } </strong>개의
						리스트가 있습니다.</span>
				</p>
			</c:when>
			<c:when test="${empty keyword }">
				<span class="categorize_quantity" style="font-size: 10pt;">검색어를
					입력 해 주세요.</span>

			</c:when>
		</c:choose>
	</div>


	<div style="width: 100%; min-height: 10px; height: 10px;"></div>

<div id="s_form">
	<c:forEach var="p" items="${products }">
		<div class="repeat_area">
			<div style="width: 100%; min-height: 10px; height: 20px;"></div>
			<div class="box_thumb">
				<a href=""> <img title=""
					src="${pageContext.request.contextPath}/resources/img/${p.p_photo1 }"
					style="width: 130px"></a>
			</div>
			<div class="search_content">
				<div class="search_category">
					<a href=""> <span class="_type" style="font-size: 10pt;">PRODUCT</span></a>
				</div>
				<div class="search_title">
					<span><a href="" style="font-size: 15pt;">${p.p_name }</a></span>
				</div>
				<div class="search_sub">
					<span><a href="">${p.p_price }</a></span>
				</div>
				<div class="search_sub">
					<span><a href="">${p.p_content}</a></span>
				</div>
			</div>
		</div>

	</c:forEach>


	<c:forEach var="l" items="${lessons }">
		<div class="repeat_area">
			<div style="width: 100%; min-height: 10px; height: 20px;"></div>
			<div class="box_thumb">
				<a href=""> <img title=""
					src="${pageContext.request.contextPath}/resources/img/${l.l_photo }"
					style="width: 130px"></a>
			</div>
			<div class="search_content">
				<div class="search_category">
					<a href=""> <span class="_type" style="font-size: 10pt;">CLASS</span></a>
				</div>
				<div class="search_title">
					<span><a href="" style="font-size: 15pt;">${l.l_name }</a></span>
				</div>
				<div class="search_sub">
					<span><a href="">${l.l_price }</a></span>
				</div>
				<div class="search_sub">
					<span><a href="">${l.l_content}</a></span>
				</div>
			</div>
		</div>

	</c:forEach>
	<c:forEach var="s" items="${stores }">
		<div class="repeat_area">
			<div style="width: 100%; min-height: 10px; height: 20px;"></div>
			<div class="box_thumb">
				<a href=""> <img title=""
					src="${pageContext.request.contextPath}/resources/img/${s.s_img }"
					style="width: 130px"></a>
			</div>
			<div class="search_content">
				<div class="search_category">
					<a href=""> <span class="_type" style="font-size: 10pt;">STORE</span></a>
				</div>
				<div class="search_title">
					<span><a href="" style="font-size: 15pt;">${s.s_name }</a></span>
				</div>
				<div class="search_sub">
					<span><a href="">${s.s_exp}</a></span>
				</div>
			</div>
		</div>

	</c:forEach>
</div>



</body>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/site_search.js"></script>
</html>