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
			<li><a class="searchmenu" onclick="searchAll('${keyword}');">ALL</a></li>
			<li><a class="searchmenu" onclick="searchClass('${keyword}');">CLASS</a></li>
			<li><a class="searchmenu" onclick="searchProduct('${keyword}');">PRODUCT</a></li>
			<li><a class="searchmenu" onclick="searchStore('${keyword}');">STORE</a></li>
		</ul>
		<div style="width: 100%; min-height: 10px; height: 50px;"></div>
		<hr style="border-top: 1px double lightgray; width: 700px;">
		<div style="width: 100%; min-height: 10px; height: 20px;"></div>

		<!-- ??로 검색된 결과가 ?? 개 있습니다.  -->
		<c:choose>
			<c:when test="${!empty keyword }">
				<p>
					<span class="categorize_quantity" style="font-size: 10pt;"><strong>${keyword }
					</strong>키워드로 검색되었습니다.</span>
				</p>
			</c:when>
			<c:when test="${empty keyword }">
				<span class="categorize_quantity" style="font-size: 10pt;">검색어를
					입력 해 주세요.</span>

			</c:when>
		</c:choose> 


	<div style="width: 100%; min-height: 10px; height: 10px;"></div>
	<div id="s_form">
	
	
		<c:forEach var="fr" items="${list}">
			<div class="repeat_area" >
				<input hidden="1" class="no" value="${fr.s_no}">
				<input hidden="1" class="no" value="${fr.p_no}">
				<input hidden="1" class="no" value="${fr.l_no}">
				<div style="width: 100%; min-height: 10px; height: 20px;"></div>
				<div class="box_thumb">
					<a href=""> <img title=""
						src="${pageContext.request.contextPath}/resources/img/${fr.c_photo }"
						style="width: 130px; height: 95px;"></a>
				</div>
				<div class="search_content">
					<c:choose>
						<c:when test="${!empty fr.c_label }">
							<div class="search_category">
								<a href=""> <span class="_type"
									style="font-size: 10pt; color: gray;">${fr.c_label }</span></a>
							</div>
						</c:when>
						<c:otherwise>
							<a href=""> <span class="_type"
								style="font-size: 10pt; color: gray;">STORE</span></a>
						</c:otherwise>
					</c:choose>
					<div class="search_title">
						<span><a href="" style="font-size: 15pt;">${fr.c_name }</a></span>
					</div>
					<c:choose>
						<c:when test="${fr.c_price != '0'}">
							<div class="search_sub">
								<span id="p_price"><a href="" style="font-size: 10pt;">
										<fmt:formatNumber value="${fr.c_price }" pattern="#,###" />원
								</a></span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="search_sub">
								<span id="p_price"><a href="" style="font-size: 10pt;">
								</a></span>
							</div>

						</c:otherwise>
					</c:choose>



					<%-- 	<div class="search_sub">
						<span><a href="">${fr.p_content}</a></span>
					</div> --%>
				</div>
			</div>

		</c:forEach>

	</div>
	</div>


</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/site_search.js"></script>
</html>