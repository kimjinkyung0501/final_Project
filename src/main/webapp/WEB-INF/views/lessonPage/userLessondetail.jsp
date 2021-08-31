<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	top: 20%;
}

.goods_payment .opt_block {
	padding: 15px;
	position: relative;
	overflow: hidden;
	margin-bottom: 10px;
}

.goods_payment .opt_block, .order_quantity_area {
	background-color: rgba(79, 79, 79, 0.03);
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 15px;
	display: flex;
	margin: 0 auto;
}

/* Columns */
.left-column {
	width: 300px;
	position: relative;
	margin-right: 50px;
}

.right-column {
	width: 300px;
	margin-top: 10px;
}

/* Left Column */
.left-column img {
	width: 300px;
	position: absolute;
	left: 0;
	top: 0;
	transition: all 0.3s ease;
	position: absolute;
}

.left-column img.active {
	opacity: 1;
}

.product-description {
	border-bottom: 1px solid #E1E8EE;
	margin-bottom: 20px;
}

.product-description span {
	font-size: 12px;
	color: #358ED7;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration: none;
}

.product-description h1 {
	font-weight: 300;
	font-size: 30px;
	color: gray;
	letter-spacing: -2px;
}

.product-description p {
	font-size: 16px;
	font-weight: 300;
	color: #86939E;
	line-height: 24px;
}

/* Product Price */
.product-price {
	display: flex;
	align-items: center;
}

.l_price {
	border: none;
	text-align: right;
}

.product-price span {
	font-size: 26px;
	font-weight: 300;
	color: #43474D;
	margin-right: 20px;
}

/* Product Color */
.product-color {
	margin-bottom: 30px;
}

.color-choose div {
	display: inline-block;
}

.cart-btn {
	display: inline-block;
	font-size: 20px;
	text-decoration: none;
	border: none;
	padding: 12px 30px;
	transition: all .5s;
	background-color: white;
	margin-left: 20px;
}

.cart-btn:hover {
	border: 1px solid black;
}
/*별 css  */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.4rem;
	line-height: 1.0rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.7px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}
/*별 결과css */
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}
</style>



<script type="text/javascript">
function deleteComment2(n,i){
	let ok = confirm('삭제하시겠습니까?');
	
	if(오케이){
		location.href = 'l_comment.delete?l_c_pk=' +n+'&l_no='+i;
	}
	

</script>

</head>
<body onload="init();">

	<h4 align="center">Class Detail</h4>
	<div style="margin-top: 50px;"></div>

	<main class="container">

		<!-- Left Column / Headphones Image -->
		<div class="left-column">
			<img data-image="black"
				src="${pageContext.request.contextPath}/resources/img/${l.l_photo}"
				alt="">

		</div>


		<!-- Right Column -->
		<form class="right-column" name="productForm" action="l_order.go"
			method="post"
			onsubmit="return logIn(${sessionScope.member_session.m_id })">

			<!-- Product Description -->
			<div class="product-description">
				<span>${l.l_label }</span>
				<h1>${l.l_name }</h1>
				<input type="hidden" name="l_no" value="${l.l_no }"> <input
					type="hidden" name="l_price" value="${l.l_price }">
				<p>${l.l_price }</p>
			</div>

			<!-- Product Configuration -->
			<div class="product-configuration">


				<!-- 수량 옵션 둘 곳 -->
				<div class="cable-config">

					<div class="goods_payment" id="prod_selected_options">
						<div class="opt_block no-border order_quantity_area"
							style="height: auto; border: none; font-size: 9.5pt;">
							생활수집을 이용 해 주셔서 감사합니다. <br> 구매 해 주신 클래스는 마이페이지에서 시청 가능하십니다 :)
							<div class="area_tit holder">

								<div style="width: 100%; min-height: 10px; height: 10px;"></div>


							</div>

						</div>
					</div>

					<div style="width: 100%; min-height: 10px; height: 30px;"></div>
				</div>
			</div>



			<!-- 여백 -->
			<div style="width: 100%; min-height: 10px; height: 50px;"></div>

			<!-- Product Pricing -->
			<div class="opt_block total bottom">
				<p class="no-margin text-right" style="height: 50px;">
					<span class="body_font_color_70 text-left">수강료</span> <span
						class="total_price"><input class="l_price" name="l_price"
						readonly="readonly" value="${l.l_price}"></span>원 <input
						type="hidden" name="l_photo" value="${l.l_photo}">
				</p>
			</div>

			<button id="buy2" class="cart-btn">Buy now</button>

		</form>
	</main>




	<div style="width: 100%; min-height: 10px; height: 30px;"></div>




	<div>
		<h4  style="margin: 20px; padding-right : 80px; margin-top : 70pt; ">${l.l_content}</h4>

	</div>





	<div style="margin-top: 50px;">
		<h3>수업 후기</h3><hr style="width: 90%;"> <br> 
		<table style="width: 90%;">
			<c:forEach var="c" items="${l_comments }">
				<tr>
					<td>
					<c:choose>
					<c:when test="${c.l_c_photo ne null}">
					<img alt="aa" src="${pageContext.request.contextPath}/resources/img/${c.l_c_photo}" style="width: 25px;height: 25px;border-radius: 100%;">
					</c:when>
					<c:when test="${c.l_c_photo eq null}">
					<img alt="aa" src="https://blog.kakaocdn.net/dn/bj4oa7/btqLJWFLMgd/wu4GV8PKbXdICuyW0me0zk/img.jpg" style="width: 25px;height: 25px;border-radius: 100%;">
					</c:when>
					</c:choose>
					<b>${c.l_c_id }</b>|<f:formatDate value="${c.l_date }"
							pattern="YYYY.MM.dd" /> <c:if
							test="${sessionScope.member_session.m_id == c.l_c_id }">|<a
								onclick="updateLC('${c.l_c_pk}','${l.l_no }','${sessionScope.member_session.m_id }')">수정</a>|<a
								onclick="deleteComment2('${c.l_c_pk}','${l.l_no }' )">삭제</a>
						</c:if>
					
					<c:choose>
							<c:when test="${c.l_mark==1 }">

								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										:style="{ width: ratingToPercent + '%' }">
										<span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>



							</c:when>
							<c:when test="${c.l_mark==2 }">

								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										:style="{ width: ratingToPercent + '%' }">
										<span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>


							</c:when>
							<c:when test="${c.l_mark==3 }">


								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										:style="{ width: ratingToPercent + '%' }">
										<span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>





							</c:when>
							<c:when test="${c.l_mark==4 }">
								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										:style="{ width: ratingToPercent + '%' }">
										<span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>





							</c:when>
							<c:when test="${c.l_mark==5 }">



								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										:style="{ width: ratingToPercent + '%' }">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>



							</c:when>


						</c:choose> 
						</td><tr>
						<tr>
						<td>${c.l_c_content }</td>
				</tr>
				<tr><td style="height: 5px;border-bottom: 1px solid black;"></td></tr>
				<tr><td style="height: 5px;"></td></tr>
				
			</c:forEach>
		</table>
	</div>
	<c:if test="${l_comments[0] !=null }">
		<table id="paging"style="margin-top: 100px; margin-left: auto; margin-right: auto;">
			<tr>
				<td align="center"><a
					href="l_comment.paging?p=1&l_no=${l.l_no }">first</a> <c:forEach
						var="p2" begin="1" end="${pageCount }">
						<a href="l_comment.paging?p=${p2}&l_no=${l.l_no }">${p2 }</a>
					</c:forEach> <a href="l_comment.paging?p=${pageCount }&l_no=${l.l_no }">last</a></td>
			</tr>
		</table>
	</c:if>


	<div style="margin-top: 30px;">
		<form action="l_comment.reg" method="get"
			onsubmit="return logIn(${sessionScope.member_session.m_id })">
			<input type="hidden" name="l_no" value="${l.l_no }"> <input
				type="hidden" name="l_c_no" value="${l.l_no }"> <input
				type="hidden" name="l_c_id"
				value="${sessionScope.member_session.m_id }">
			<div class="star-rating space-x-4 mx-auto">
				<input type="radio" id="5-stars" name="l_mark" value="5"
					v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
				<input type="radio" id="4-stars" name="l_mark" value="4"
					v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
					type="radio" id="3-stars" name="l_mark" value="3" v-model="ratings" />
				<label for="3-stars" class="star">★</label> <input type="radio"
					id="2-stars" name="l_mark" value="2" v-model="ratings" /> <label
					for="2-stars" class="star">★</label> <input type="radio"
					id="1-star" checked="checked" name="l_mark" value="1"
					v-model="ratings" /> <label for="1-star" class="star">★</label>
			</div>
	<div style="margin-top: 10px;">
				<input style="width: 87%; height: 100px;" placeholder="후기를 남겨주세요(300자 이내)"
					name="l_c_content">
				<input type="hidden" name="l_c_photo" value="${sessionScope.member_session.m_photo }">

				<button style="width: 12%; height: 100px;">등록</button>
			</div>

		</form>
	</div>

<script type="text/javascript">
function updateLC(pk,no,id){
	let ok = confirm('후기를 수정하시겠습니까?');

	if(오케이){
		url="updateLC?l_c_pk="+pk+'&l_no='+no+'&m_id='+id;
		window.open(url,"pop","width =400, height=250");
	}	
		
	}




</script>
	<script type="text/javascript" src="resources/js/click.js"></script>
	<script type="text/javascript" src="resources/js/storeJs.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$('.color-choose input').on(
							'click',
							function() {
								var headphonesColor = $(this)
										.attr('data-image');

								$('.active').removeClass('active');
								$(
										'.left-column img[data-image = '
												+ headphonesColor + ']')
										.addClass('active');
								$(this).addClass('active');
							});

				});
	</script>

</body>
</html>