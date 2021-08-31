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

.img-showcase img {
	width: 90%;
	display: block;
}

.img-item img {
	width: 100%;
	display: block;
	width: 80px;
	height: 80px;
}

.info {
	margin-top: 10px;
	padding-top: 10px
}

.img-display {
	overflow: hidden;
}

.img-showcase {
	display: flex;
	width: 100%;
	transition: all 0.5s ease;
}

.img-showcase img {
	min-width: 100%;
}

.img-select {
	display: flex;
}

.img-item {
	margin: 0.1rem;
}

.img-item:nth-child(1), .img-item:nth-child(2), .img-item:nth-child(3) {
	margin-right: 0;
}

.img-item:hover {
	opacity: 0.8;
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
	margin-left: 20px;
	width: 300px;
	margin-top: 10px;
	width: 300px;
}

/* Left Column */
.left-column img {
	width: 300px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
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

.o_price {
	border: none;
	width: auto;
	text-align: right;
	margin: 3px;
}

/* Product Price */
.product-price {
	display: flex;
	align-items: center;
}

.product-price span {
	font-size: 26px;
	font-weight: 300;
	color: #43474D;
	margin-right: 20px;
}

.cart-btn {
	display: inline-block;
	font-size: 20px;
	text-decoration: none;
	padding: 12px 30px;
	transition: all .5s;
	background-color: white;
	border: none;
}

.cart-btn:hover {
	border: 1px solid black;
}

/* Product Color */
.product-color {
	margin-bottom: 30px;
}

.color-choose div {
	display: inline-block;
}

/*별 css  */
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
let p_price;
let p2_p_quantidey;


function init() {
	p_price = document.productForm.p_price.value;
	p2_p_quantidey = document.productForm.p2_p_quantidey.value;
	document.productForm.p2_sumPrice.value = p_price ;
	change();
}
function add () {
	
	hm = document.productForm.p2_p_quantidey;
	oprice = document.productForm.p2_sumPrice;
	
if(hm.value){
	hm.value ++ ;
		}
else{
	hm.value=0;
}		


	oprice.value = parseInt(hm.value) * p_price;
}

function del () {
	hm = document.productForm.p2_p_quantidey;
	oprice = document.productForm.p2_sumPrice;
		if (hm.value > 1) {
			hm.value -- ;
			oprice.value = parseInt(hm.value) * p_price;
		}
}



function change () {
	hm = document.productForm.p2_p_quantidey;
	oprice  = document.productForm.p2_sumPrice;
		if (hm.value < 0) {
			hm.value = 0;
		}
	oprice.value = parseInt(hm.value) * p_price;
}  

function deleteComment(n,i){
	let ok = confirm('삭제하시겠습니까?');
	
	if(오케이){
		location.href = 'p_comment.delete?p_c_pk=' +n+'&p_no='+i;
	}
	


</script>


</head>
<body onload="init();">

	<h4 align="center">Product Detail</h4>
	<div style="margin-top: 50px;"></div>

	<main class="container">

		<!-- Left Column / Headphones Image -->
		<div class="card-wrapper">
			<div class="card">
				<!-- card left -->

				<c:choose>

					<c:when
						test="${!empty p.p_photo1 && p.p_photo2 eq '없다' && p.p_photo3 eq '없다' }">

						<div class="product-imgs">
							<div class="img-display">
								<div class="img-showcase" style="width: 500px; height: 400px;">
									<img id="img1"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image">
								</div>
							</div>

							<div class="img-select">
								<div class="img-item">
									<a href="#img1" data-id="1" > <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image">
									</a>
								</div>
							</div>

						</div>
					</c:when>


					<c:when
						test="${!empty p.p_photo1 && !empty p.p_photo2 && p.p_photo3 eq '없다'}">
						<div class="product-imgs">
							<div class="img-display">
								<div class="img-showcase" style="width: 500px; height: 400px;">
									<img id="img1"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image"> <img id="img2"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo2}"
										alt="shoe image">
								</div>
							</div>
							<div class="img-select">
								<div class="img-item">
									<a href="#img1" data-id="1" > <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image">
									</a>
								</div>
								<div class="img-item">
									<a href="#img2" data-id="2" > <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo2}"
										alt="shoe image">
									</a>
								</div>
							</div>
						</div>
					</c:when>





					<c:when
						test="${!empty p.p_photo1 && !empty p.p_photo2 && !empty p.p_photo3}">

						<div class="product-imgs">
							<div class="img-display">
								<div class="img-showcase" style="width: 500px; height: 400px;">
									<img id="img1"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image"> <img id="img2"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo2}"
										alt="shoe image"> <img id="img3"
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo3}"
										alt="shoe image">

								</div>
							</div>
							<div class="img-select">
								<div class="img-item">
									<a href="#img1" data-id="1"> <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo1}"
										alt="shoe image">
									</a>
								</div>
								<div class="img-item">
									<a href="#img2" data-id="2" > <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo2}"
										alt="shoe image">
									</a>
								</div>
								<div class="img-item">
									<a href="#img3" data-id="3" > <img
										src="${pageContext.request.contextPath}/resources/img/${p.p_photo3}"
										alt="shoe image">
									</a>
								</div>

							</div>
						</div>
					</c:when>






				</c:choose>

			</div>


		</div>


		<!-- Right Column -->
		<form class="right-column" name="productForm" action="order.go"
			method="post"
			onsubmit="return logIn(${sessionScope.member_session.m_id })">

			<!-- Product Description -->
			<div class="product-description">
				<span>${p.p_label }</span>
				<h1>${p.p_name }</h1>
				<input type="hidden" name="p_no" value="${p.p_no }"> <input
					type="hidden" name="p_price" value="${p.p_price }"> <input
					type="hidden" name="p_stock" value="${p.p_stock}">
				<p>${p.p_price }</p>
			</div>

			<!-- Product Configuration -->
			<div class="product-configuration">


				<!-- 수량 옵션 둘 곳 -->
				<div class="cable-config">

					<div class="goods_payment" id="prod_selected_options">
						<div class="opt_block no-border order_quantity_area"
							style="height: auto;">
							<div class="area_tit holder">
								<span class="option_title inline-blocked"
									style="margin-bottom: 7px">수량</span>
								<div style="width: 100%; min-height: 10px; height: 10px;"></div>
								<span>
									<hr
										style="border-top: 1px dashed lightgray; border-bottom: none;">
									<input type="button" value=" - " onclick="del();"> <input
									type="number" id="unitPrice1" value="1" style="width: 50px;"
									name="p2_p_quantidey" class="form-control" onchange="change();">
									<input type="button" value=" + " onclick="add();"><br>
								</span>

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
					<span class="body_font_color_70 text-left">총 상품금액</span> <span
						class="total_price"><input name="p2_sumPrice"
						class="o_price" readonly="readonly">원</span> <input type="hidden"
						name="s_name" value="${s.s_name }"> <input type="hidden"
						name="o_id" value="${sessionScope.member_session.m_id }">
					<input type="hidden" name="o_no" value="${p.p_no }"> <input
						type="hidden" name="o_m_addr"
						value="${sessionScope.member_session.m_addr }"> <input
						type="hidden" name="o_quantidey" value="1"> <input
						type="hidden" name="o_phone"
						value="${sessionScope.member_session.m_phone }">
				</p>
			</div>

			<button class="cart-btn" id="cart">Cart</button>
			<button class="cart-btn" id="buy">Buy now</button>

		</form>
	</main>





	<div>
		<h4  style="margin: 20px; margin-top : 70pt; padding: 20px; ">${p.p_content}</h4>

	</div>


<%-- 

 --%>
	<div style="margin-top: 50px;">
		<h3>제품 후기</h3><hr> <br>
		<table style="width: 100%;">
			<c:forEach var="c" items="${p_comments }">
				<tr>
					<td>
					<c:choose>
					<c:when test="${c.p_c_photo ne null}">
					<img alt="aa" src="${pageContext.request.contextPath}/resources/img/${c.p_c_photo}" style="width: 25px;height: 25px;border-radius: 100%;">
					</c:when>
					<c:when test="${c.p_c_photo eq null}">
					
					<img alt="aa" src="${pageContext.request.contextPath }/resources/img/default_profile.png" style="width: 25px;height: 25px;border-radius: 100%;">
					
					</c:when>
					</c:choose>
					<b> ${c.p_c_id }</b>|<f:formatDate value="${c.p_date }"
							pattern="YYYY.MM.dd" /> <c:if
							test="${sessionScope.member_session.m_id == c.p_c_id }">|<a
								onclick="updatePC('${c.p_c_pk}','${p.p_no }','${sessionScope.member_session.m_id }')" >수정</a>|<a
								onclick="deleteComment('${c.p_c_pk}','${p.p_no }' )">삭제</a>
						</c:if>
				<c:choose>
							<c:when test="${c.p_mark==1 }">

								<div class="star-ratings">
									<div class="star-ratings-fill space-x-2 text-lg"
										style="{ width: ratingToPercent + '%' }">
										<span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>



							</c:when>
							<c:when test="${c.p_mark==2 }">

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
							<c:when test="${c.p_mark==3 }">


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
							<c:when test="${c.p_mark==4 }">
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
							<c:when test="${c.p_mark==5 }">



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
						<td >${c.p_c_content }</td>
					
				</tr>
				<tr><td style="height: 5px;border-bottom: 1px solid black;"></td></tr>
				<tr><td style="height: 5px;"></td></tr>
				
				
			</c:forEach>
		</table>
	</div>

	<c:if test="${p_comments[0] !=null }">
		<table id="paging"
			style="margin-top: 100px; margin-left: auto; margin-right: auto;">
			<tr>
				<td align="center"><a
					href="p_comment.paging?p=1&p_no=${p.p_no }">fistFirst</a> <c:forEach
						var="p2" begin="1" end="${pageCount }">
						<a href="p_comment.paging?p=${p2}&p_no=${p.p_no }">${p2 }</a>
					</c:forEach> <a href="p_comment.paging?p=${pageCount }&p_no=${p.p_no }">lastLast</a></td>
			</tr>
		</table>
	</c:if>


	<div style="margin-top: 30px;">
		<form action="p_comment.reg" method="get"
			onsubmit="return logIn(${sessionScope.member_session.m_id })">
			<input type="hidden" name="p_no" value="${p.p_no }"> <input
				type="hidden" name="p_c_no" value="${p.p_no }"> <input
				type="hidden" name="p_c_id"
				value="${sessionScope.member_session.m_id }">

			<div class="star-rating space-x-4 mx-auto">

				<input type="radio" id="5-stars" name="p_mark" value="5"
					v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>

				<input type="radio" id="4-stars" name="p_mark" value="4"
					v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
					type="radio" id="3-stars" name="p_mark" value="3" v-model="ratings" />
				<label for="3-stars" class="star">★</label> <input type="radio"
					id="2-stars" name="p_mark" value="2" v-model="ratings" /> <label
					for="2-stars" class="star">★</label> <input type="radio"
					id="1-star" checked="checked" name="p_mark" value="1"
					v-model="ratings" /> <label for="1-star" class="star">★</label>

			</div>
			<div style="margin-top: 10px;">
				<input style="width: 87%; height: 100px;" placeholder="후기를 남겨주세요(300자 이내)"
					name="p_c_content">
				<input type="hidden" name="p_c_photo" value="${sessionScope.member_session.m_photo }">

				<button style="width: 12%; height: 100px;">등록</button>
			</div>

		</form>
	</div>
	
	
	<script type="text/javascript">
	function updatePC(pk,no,id){
		let ok = confirm('후기를 수정하시겠습니까?');

		if(오케이){
			url="updatePC?p_c_pk="+pk+'&p_no='+no+'&m_id='+id;
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