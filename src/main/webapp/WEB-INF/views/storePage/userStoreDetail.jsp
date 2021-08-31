<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-box {
	top: 20%;
}

#content {
	min-height: 0px;
}

.container {
	height: 1000px;
}

.project-card {
	width: 200px;
	height: 150px;
	border-radius: 25px;
	border: 1px solid rgb(0, 0, 0);
	position: relative;
	transition: all 0.5s;
	transition-delay: 0.4s;
	margin: auto;
}

.project-explain {
	width: 96%;
	height: 20%;
	margin: auto;
	display: absolute;
	z-index: 2;
}

a {
	cursor: pointer;
	transition: all 200ms linear;
}

a:hover {
	text-decoration: none;
}

.link {
	color: #c4c3ca;
}

.link:hover {
	color: #ffeba7;
}

.over-hide {
	overflow: hidden;
}

.size-22 {
	font-size: 20px;
}

.section {
	position: relative;
	width: 100%;
	z-index: 1;
	display: block;
	height: 350px;
}

[type="checkbox"]:checked, [type="checkbox"]:not(:checked) {
	position: absolute;
	left: -9999px;
}

.pricing:checked+label, .pricing:not(:checked)+label {
	left: 200px;
	position: relative;
	display: block;
	text-align: center;
	width: 260px;
	height: 44px;
	border-radius: 4px;
	padding: 0;
	cursor: pointer;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 14px;
	letter-spacing: 1px;
	line-height: 44px;
	padding: 0 25px;
	padding-right: 27px;
	overflow: hidden;
	color: #fff;
	text-align: left;
}

.pricing:checked+label:before, .pricing:not(:checked)+label:before {
	position: absolute;
	content: '';
	z-index: -2;
	background-color: #102770;
	width: 100%;
	height: 100%;
	display: block;
	top: 0;
	left: 0;
}

.pricing:checked+label:after, .pricing:not(:checked)+label:after {
	position: absolute;
	content: '';
	z-index: -1;
	background-color: white;
	width: 128px;
	height: 40px;
	display: block;
	top: 2px;
	left: 2px;
	border-radius: 2px;
	transition: left 300ms linear;
}

.pricing:checked+label:after {
	left: 130px;
}

.block-diff {
	display: block;
}

.card-3d-wrap {
	position: relative;
	width: 1000px;
	max-width: calc(100% - 20px);
	height: 510px;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	perspective: 1000px;
	margin-top: 20px;
}

.card-3d-wrapper {
	width: 100%;
	height: 60%;
	position: absolute;
	top: 0;
	-webkit-transform-style: preserve-3d;
}

.card-front, .card-back {
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 1);
	position: absolute;
	border-radius: 6px;
	left: 0;
	top: 0;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
}

.card-back {
	transform: rotateY(180deg);
}

.pricing:checked ~ .card-3d-wrap .card-3d-wrapper {
	transform: rotateY(180deg);
}

.pricing-wrap {
	position: relative;
	padding-top: 50px;
	width: 100%;
	display: block;
	z-index: 1;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
}

.pricing-wrap h4 {
	position: relative;
	width: 100%;
	display: block;
	text-align: center;
	font-family: 'Poppins', sans-serif;
	font-weight: 700;
	letter-spacing: 3px;
	font-size: 22px;
	line-height: 1.7;
	color: #102770;
	transform: translate3d(0, 0, 35px) perspective(100px);
}

.card-back .pricing-wrap h4:before {
	background: linear-gradient(217deg, #648946, #a3c984);
}

@
keyframes border-transform { 0%,100% {
	border-radius: 63% 37% 54% 46%/55% 48% 52% 45%;
}

14




















%
{
border-radius




















:




















40


















%
60


















%
54


















%
46


















%
/
49


















%
60


















%
40


















%
51


















%;
}
28




















%
{
border-radius




















:




















54


















%
46


















%
38


















%
62


















%
/
49


















%
70


















%
30


















%
51


















%;
}
42




















%
{
border-radius




















:




















61


















%
39


















%
55


















%
45


















%
/
61


















%
38


















%
62


















%
39


















%;
}
56




















%
{
border-radius




















:




















61


















%
39


















%
67


















%
33


















%
/
70


















%
50


















%
50


















%
30


















%;
}
70




















%
{
border-radius




















:




















50


















%
50


















%
34


















%
66


















%
/
56


















%
68


















%
32


















%
44


















%;
}
84




















%
{
border-radius




















:




















46


















%
54


















%
50


















%
50


















%
/
35


















%
61


















%
39


















%
65


















%;
}
}
.pricing-wrap h2 {
	position: relative;
	width: 100%;
	display: block;
	text-align: center;
	font-weight: 400;
	letter-spacing: 1px;
	font-size: 36px;
	line-height: 1.1;
	color: black;
	transform: translate3d(0, 0, 30px) perspective(100px);
}

.pricing-wrap h2 sup {
	font-size: 20px;
}

.pricing-wrap p {
	position: relative;
	width: 100%;
	display: block;
	text-align: center;
	font-family: 'Poppins', sans-serif;
	font-weight: 500;
	font-size: 14px;
	line-height: 1.2;
	letter-spacing: 1px;
	color: black;
	transform: translate3d(0, 0, 30px) perspective(100px);
}

.card-back h2, .card-back p, .card-back h4 {
	color: #0c1c00;
}

.link {
	position: relative;
	padding: 10px 20px;
	border-radius: 4px;
	display: inline-block;
	text-align: center;
	color: black;
	background-color: bl;
	transition: all 200ms linear;
	font-family: 'Poppins', sans-serif;
	font-weight: 500;
	font-size: 14px;
	line-height: 1.2;
	transform: translate3d(0, 0, 30px) perspective(100px);
}

.link:hover {
	color: white;
	background-color: #ffeba7;
}

.card-back .link {
	background-color: #0c1c00;
}

.card-back .link:hover {
	color: #0c1c00;
	background-color: #ffeba7;
}

.img-wrap img {
	width: 100%;
	height: auto;
	display: block;
}

#p_price {
	font-size: 11pt;
	color: #606060;
	margin-top: 1px;
	margin-bottom: 0px;
	text-align: center;
}

.contents_container .pic img {
	
}

.cartBtn {
	border: none;
	align-content: center;
	background-color: white;
	font-size: 11pt;
	color: #606060;
}

.cartIcon {
	margin-top: 20px;
	margin-left: 114px;
	width: 18px;
	height: 18px;
	align-content: center;
	background-color: white;
}

.img-1 {
	position: absolute;
	display: block;
	left: -160px;
	top: -50px;
	z-index: 5;
	width: calc(80% + 160px);
	transform: translate3d(0, 0, 45px) perspective(100px);
	opacity: 1;
	pointer-events: auto;
	transition: transform 400ms 1200ms ease, opacity 400ms 1200ms ease;
}

.pricing:checked ~ .card-3d-wrap .card-3d-wrapper .img-1 {
	opacity: 0;
	transform: translate3d(-50px, 25px, 45px) perspective(100px);
	pointer-events: none;
	transition: transform 400ms ease, opacity 200ms 150ms ease;
}

.img-2 {
	position: absolute;
	display: block;
	left: 0;
	top: 0;
	z-index: 1;
	overflow: hidden;
	width: 338px;
	height: 303px;
}

.img-3 {
	position: absolute;
	display: block;
	right: -20px;
	top: -40px;
	z-index: 5;
	width: calc(60% + 20px);
	transform: translate3d(0, 0, 55px) perspective(100px) scale(1);
	opacity: 1;
	pointer-events: auto;
	transition: transform 300ms 1300ms ease, opacity 200ms 1300ms ease;
}

.pricing:checked ~ .card-3d-wrap .card-3d-wrapper .img-3 {
	opacity: 0;
	transform: translate3d(-50px, 5px, 55px) perspective(100px) scale(0.4);
	pointer-events: none;
	transition: transform 400ms ease, opacity 200ms 150ms ease;
}

.pricing:checked ~ .card-3d-wrap .card-3d-wrapper .img-7 {
	opacity: 1;
	pointer-events: auto;
	transform: translate3d(0, 0, 35px) perspective(100px) scale(1);
	transition: transform 400ms 1300ms ease, opacity 300ms 1300ms ease;
}

h5 {
	margin: 2px;
	text-align: center;
}

.hori_cont {
	width: 500px;
	padding: 30px;
	border: 1px solid lightgray;
	display: flex;
	margin: 30px;
	margin-left: 100px;
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
	margin-left: 120px;
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
</style>
</head>
<body>

	<!--  상점이름 -->
	<!--  js / 클릭에 따라 클래스만 or 프로덕트만 보이게 할지 ..-->



	<div class="hori_cont">
		<div class="profile_wrap">
			<div class="profile_img">
				<img src="resources/img/${s.s_img }">
			</div>
		</div>

		<div class="detail">
			<div class="top">
				<div class="user_name">${s.s_name }</div>

			</div>

			<ul class="middle">
				<li><span>상점 설명 : ${s.s_exp }</span></li>
			</ul>


		</div>
	</div>



	<div class="section over-hide">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section text-center py-5 py-md-0">
						<input class="pricing" type="checkbox" id="pricing" name="pricing" />
						<label for="pricing"><span class="block-diff">&emsp;
								CLASS &emsp;&emsp; &emsp; <span class="float-right"
								style="text-align: right;">PRODUCT <!--좌측 클릭하는곳  --></span>
						</span></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">




								<div class="card-front">
									<div class="pricing-wrap">
										<c:forEach var="p" items="${products}">
											<c:if test="${s.s_no==p.p_rn }">
												<div
													style="float: left; margin-left: 50px; margin-top: 15px; height: 150px;">
													<a
														href="${pageContext.request.contextPath}/product.detail?p_no=${p.p_no}">
														<img alt="" src="resources/img/${p.p_photo1 }"
														style="width: 150px; height: 120px;">
														<h5>${p.p_name }</h5>
														<h5>
															<fmt:formatNumber value="${p.p_price }" pattern="#,###" />
															원
														</h5>
													</a>
												</div>
											</c:if>
										</c:forEach>

										<div style="height: 10px;"></div>
										<table id="paging"
											style="margin-top: 200px; margin-left: 260px;">
											<tr>
												<td align="center"><a
													href="${pageContext.request.contextPath}/userStoreproduct.paging?p=1&s_no=${products[0].p_rn }">first</a>
													<c:forEach var="p" begin="1" end="${pageCount}">
														<a
															href="${pageContext.request.contextPath}/userStoreproduct.paging?p=${p}&s_no=${products[0].p_rn }">${p}</a>
													</c:forEach> <a
													href="${pageContext.request.contextPath}/userStoreproduct.paging?p=${pageCount }&s_no=${products[0].p_rn }">last</a></td>
											</tr>
										</table>

									</div>
								</div>




								<div class="card-back">
									<div class="pricing-wrap">
										<c:forEach var="l" items="${lessons }">
											<div style="float: left; margin-left: 50px;">
												<a
													href="${pageContext.request.contextPath}/lesson.detail?l_no=${l.l_no}">
													<img alt="" src="resources/img/${l.l_photo}"
													style="width: 150px; height: 120px;">
													<h5>${l.l_name }</h5>
													<h5>
														<fmt:formatNumber value="${l.l_price }" pattern="#,###" />
														원
													</h5>
												</a>
											</div>
										</c:forEach>



										<table id="paging"
											style="margin-top: 200px; margin-left: 260px;">
											<tr>
												<td align="center"><a
													href="${pageContext.request.contextPath}/userStorelesson.paging?p2=1&s_no=${lessons[0].l_rn }">first</a>
													<c:forEach var="p2" begin="1" end="${pageCount2}">
														<a
															href="${pageContext.request.contextPath}/userStorelesson.paging?p2=${p2}&s_no=${lessons[0].l_rn }">${p2 }</a>
													</c:forEach> <a
													href="${pageContext.request.contextPath}/userStorelesson.paging?p2=${pageCount2}&s_no=${lessons[0].l_rn }">last</a></td>
											</tr>
										</table>
									</div>
								</div>
							</div>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>



	<div style="margin-top: 100px;">






		<div style="margin-top: 100px;">
</body>
</html>