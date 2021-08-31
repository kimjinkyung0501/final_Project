<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-box {
	top: 25%;
	left: 33%;
}

.blog-card {
	width: 500px;
	display: flex;
	flex-direction: column;
	margin: 1rem auto;
	box-shadow: 0 3px 7px -1px rgba(0, 0, 0, 0.1);
	margin-bottom: 1.6%;
	background: #fff;
	line-height: 1.4;
	font-family: sans-serif;
	border-radius: 5px;
	overflow: hidden;
	z-index: 0;
}

.blog-card a {
	color: inherit;
}

.blog-card a:hover {
	color: #5ad67d;
}

.blog-card:hover .photo {
	transform: scale(1.3) rotate(3deg);
}

.blog-card .meta {
	position: relative;
	z-index: 0;
	height: 200px;
}

.blog-card .photo {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: center;
	transition: transform 0.2s;
}

.blog-card .details, .blog-card .details ul {
	margin: auto;
	padding: 0;
	list-style: none;
}

.blog-card .details {
	position: absolute;
	top: 0;
	bottom: 0;
	left: -100%;
	margin: auto;
	transition: left 0.2s;
	background: rgba(0, 0, 0, 0.6);
	color: #fff;
	padding: 10px;
	width: 100%;
	font-size: 0.9rem;
}

.blog-card .details a {
	-webkit-text-decoration: dotted underline;
	text-decoration: dotted underline;
}

.blog-card .details ul li {
	display: inline-block;
}

.blog-card .details .author:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "";
}

.blog-card .details .date:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "";
}

.blog-card .details .tags ul:before {
	font-family: FontAwesome;
	content: "";
	margin-right: 10px;
}

.blog-card .details .tags li {
	margin-right: 2px;
}

.blog-card .details .tags li:first-child {
	margin-left: -4px;
}

.blog-card .description {
	padding: 1rem;
	background: #fff;
	position: relative;
	z-index: 1;
}

.blog-card .description h1, .blog-card .description h2 {
	font-family: Poppins, sans-serif;
}

.blog-card .description h1 {
	line-height: 1;
	margin: 0;
	font-size: 1.7rem;
}

.blog-card .description h2 {
	font-size: 1rem;
	font-weight: 300;
	text-transform: uppercase;
	color: #a2a2a2;
	margin-top: 5px;
}

.blog-card .description .read-more {
	text-align: right;
}

.blog-card .description .read-more a {
	color: navy;
	display: inline-block;
	position: relative;
}

.blog-card .description .read-more a:after {
	content: ">";
	font-family: FontAwesome;
	margin-left: -10px;
	opacity: 0;
	vertical-align: middle;
	transition: margin 0.3s, opacity 0.3s;
}

.blog-card .description .read-more a:hover:after {
	margin-left: 5px;
	opacity: 1;
}

.blog-card p {
	position: relative;
	margin: 1rem 0 0;
}

.blog-card p:first-of-type {
	margin-top: 1.25rem;
}

.blog-card p:first-of-type:before {
	content: "";
	position: absolute;
	height: 5px;
	background: darkblue;
	width: 35px;
	top: -0.75rem;
	border-radius: 3px;
}

.blog-card:hover .details {
	left: 0%;
}
</style>
</head>
<body>

	<div class="container">
		<br>



		<c:forEach var="list" items="${lesson_list}">
			<div class="blog-card">
				<div class="meta">
					<div class="photo">
						<img style="height: 200px; width: 300px;"
							src="${pageContext.request.contextPath}/resources/img/${list.l_photo}">
					</div>
					<ul class="details">
						<li class="author"><a href="#">${list.l_name}</a></li>
						<li class="date">${list.l_label}</li>
						<li class="date"><fmt:formatNumber value="${list.l_price}"
								pattern="#,###" />원</li>
					</ul>
				</div>
				<div class="description">
					<h1>${list.l_name}</h1>
					<h2>${list.l_content}</h2>

					<p class="read-more">
						<a onclick="movieGo('${list.l_no}');"> watch</a>
					</p>
				</div>
			</div>
			<td class="text-right"><a title="" href=""
				class="btn btn-outline-success" data-toggle="tooltip"
				data-original-title="Save to Wishlist"></td>
		</c:forEach>

	</div>
	<!--container end.//-->
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/locationFile.js"></script>
</html>