<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

.detail {
	margin-left: 100px;
	/*align-items: center;*/
	/*flex-direction: column;*/
	/*justify-content: center;*/
}

.detail .top {
	display: flex;
	align-items: center;
}

.detail .top .user_name {
	font-size: 35px;
	font-weight: 200;
	display: inline-block;
	padding-right: 25px;
	margin-top: 10px;
}

.detail .top>a {
	height: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 120px;
	border: 1px solid #dbdbdb;
	border-radius: 3px;
	color: #262626;
	padding: 3px 20px;
	font-weight: 600;
	vertical-align: text-bottom;
	text-decoration: none;
	box-sizing: border-box;
}

.detail .middle {
	display: flex;
	height: 50px;
	padding: 18px 0;
	margin-left: 20px;
	font-size: 15px;
	font-weight: 600;
}

.detail .middle>li {
	margin-right: 35px;
}

.detail .about>span {
	display: inline-block;
	cursor: pointer;
	position: relative;
}

.detail .about>span:nth-child(1) {
	margin-right: 50px;
}

h5 {
	margin: 3px;
}

#paging {
	margin: 2px;
}

.detail .about>span:after {
	content: '';
	width: 0;
	height: 1px;
	position: absolute;
	left: 0;
	bottom: -5px;
	transition: all 0.5s;
	background: #dd2d76;
}

.detail .about>span.on:after {
	width: 100%;
}

.contents_container {
	/*display: flex;*/
	flex-wrap: wrap;
	justify-content: space-between;
	display: none;
}

.contents_container.active {
	display: flex;
}

.contents_container .pic {
	max-width: 300px;
	max-height: 300px;
	overflow: hidden;
	margin-bottom: 18px;
}

.contents_container .pic img {
	width: 100%;
	height: 100%;
}

@media screen and (max-width:1000px) {
	.contents_container {
		justify-content: center;
	}
	.contents_container .pic {
		margin: 10px;
	}
}
</style>
</head>
<body>




	<div id="main_container">

		<section class="b_inner">

			<div class="hori_cont">
				<div class="profile_wrap">
					<div class="profile_img">
						<img src="resources/img/${s.s_img }">
					</div>
				</div>

				<div class="detail">
					<div class="top">
						<div class="user_name">${s.s_name }</div>

						<a class="profile_edit"
							onclick="location.href='store.update.go?s_id=${s.s_id}'">정보수정</a>
						<a class="logout"
							onclick="deleteStore('${s.s_no}','${member_session.m_id}')">폐점</a>
					</div>

					<ul class="middle">
						<li><span>상점 설명 : ${s.s_exp }</span></li>
					</ul>
				<%-- 	<ul class="middle">
						<li><span class="nick_name"><a class="profile_edit"
								onclick="location.href='${pageContext.request.contextPath}/product.reg.go?p_rn=${s.s_no}'"><img
									src="https://img.icons8.com/material-outlined/24/4a90e2/plus--v1.png" />제품</a></span>
						</li>
						<li><span class="book_mark"><a class="profile_edit"
								onclick="location.href='${pageContext.request.contextPath}/lesson.reg.go?l_rn=${s.s_no}'"><img
									src="https://img.icons8.com/material-outlined/24/4a90e2/plus--v1.png" />클래스</a></span>
						</li>
					</ul>
 --%>

				</div>
			</div>



			<div style="width: 0; min-height: 10px; height: 50px;"></div>



			<div>
				<p>
				<h2 style="margin-left: 280px;">
					제품 관리 <a class="profile_edit"
						onclick="location.href='${pageContext.request.contextPath}/product.reg.go?p_rn=${s.s_no}'"><img
						style="margin-top: 5px;"
						src="https://img.icons8.com/material-outlined/24/4a90e2/plus--v1.png" /></a>
				</h2>
				<p>

					<c:forEach var="p" items="${products}">
						
							<div
								style="float: left; margin-left: 50px; margin-top: 15px; border: 0.3px solid gray; height: 150px;"
								onclick="location.href='seller.product.detail?p_no=${p.p_no}'">
								<img alt="" src="resources/img/${p.p_photo1 }"
									style="width: 150px; height: 120px;">
								<h5>${p.p_name }</h5>
							</div>
						
					</c:forEach>
				<table id="paging" style="margin-top: 200px; margin-left: 260px;">
					<tr>
						<td align="center"><a
							href="${pageContext.request.contextPath}/storeproduct.paging?p=1&s_id=${sessionScope.member_session.m_id}">first
						</a> <c:forEach var="p" begin="1" end="${pageCount}">
								<a
									href="${pageContext.request.contextPath}/storeproduct.paging?p=${p}&s_id=${sessionScope.member_session.m_id}">${p}</a>
							</c:forEach> <a
							href="${pageContext.request.contextPath}/storeproduct.paging?p=${pageCount }&s_id=${sessionScope.member_session.m_id}">
								last</a></td>
					</tr>
				</table>



			</div>
			<p>
			<div style="margin-top: 50px;">
				<h2 style="margin-left: 270px;">
					클래스 관리 <a class="profile_edit"
						onclick="location.href='${pageContext.request.contextPath}/lesson.reg.go?l_rn=${s.s_no}'"><img
						src="https://img.icons8.com/material-outlined/24/4a90e2/plus--v1.png" /></a>
				</h2>
				<p>
					<c:forEach var="l" items="${lessons }">
						
							<div
								style="float: left; margin-left: 50px; border: 0.3px solid gray; height: 150px;"
								onclick="location.href='seller.lesson.detail?l_no=${l.l_no}'">
								<img alt="" src="resources/img/${l.l_photo}"
									style="width: 150px; height: 120px;">
								<h5>${l.l_name }</h5>
							</div>
					
					</c:forEach>
				<table id="paging" style="margin-top: 200px; margin-left: 260px;">
					<tr>
						<td align="center"><a
							href="${pageContext.request.contextPath}/storelesson.paging?p2=1&s_id=${sessionScope.member_session.m_id}">first
						</a> <c:forEach var="p2" begin="1" end="${pageCount2}">
								<a
									href="${pageContext.request.contextPath}/storelesson.paging?p2=${p2}&s_id=${sessionScope.member_session.m_id}">${p2 }</a>
							</c:forEach> <a
							href="${pageContext.request.contextPath}/storelesson.paging?p2=${pageCount2}&s_id=${sessionScope.member_session.m_id}">
								last</a></td>
					</tr>
				</table>

			</div>













		</section>
	</div>



	<script type="text/javascript" src="resources/js/storeJs.js"></script>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/locationFile.js"></script>
	<script type="text/javascript" src="resources/js/Valid.js"></script>
</body>
</html>