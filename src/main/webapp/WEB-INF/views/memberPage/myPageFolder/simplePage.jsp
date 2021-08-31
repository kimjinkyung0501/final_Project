<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}resources/css/myPage.css">
<style type="text/css">
body {
	margin-top: 15px;
	margin-left: 15px;
}

.box {
	width: 130px;
	height: 130px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.jb-table .jb-table-row .jb-table-cell {
	
}

.jb-table {
	display: table;
}

.jb-table-row {
	display: table-row;
}

.jb-table-cell {
	display: table-cell;
	padding: 0px 30px;
	height: 120px;
}

.jb-top {
	vertical-align: top;
}

ul.mylist, ol.mylist {
align-content : center;
	list-style: none;
	margin: 3px;
	padding: 3px;
	max-width: 600px;
	width: 600px;
	margin-left: 100px;
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

/*  지금 하는거야 */
.xans-myshop-orderstate {
	margin: 20px 0 0;
	width: 650px;
}

.xans-myshop-orderstate .title {
	padding: 11px 21px;
	margin: 0;
	border-bottom: 1px solid #e9e9e9;
	background: #f6f6f6;
}

.xans-myshop-orderstate .state {
	overflow: hidden;
	padding: 19px 0;
}

.xans-myshop-orderstate .order li {
	float: left;
	width: 24%;
	padding: 0 0 4px;
	margin: 0 -1px 0 0;
	border-right: 1px dotted #c9c7ca;
	text-align: center;
}

.xans-myshop-orderstate .cs {
	float: left;
	width: 20%;
	padding: 0;
}

.xans-myshop-orderstate .cs li {
	padding: 0;
	display: list-item;
	text-align: -webkit-match-parent;
}

#BT {
	border: 0.1px solid;
	background-color: white;
	font: 14pt;
	font-weight: bold;
	width: 150px;
	height: 40px;
}
</style>
</head>
<body>



	<div style="width: 100%; min-height: 1px; height: 250px;"></div>



	<c:set var="login_number" value="${sessionScope.login_number}" />
	<c:choose>
		<c:when test="${login_number == 1}">
			<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell" style="float: left;">
						<div class="box" style="background: #BDBDBD; margin-right: 10px;">
							<img class="profile" style="vertical-align: middle;"
								src="${pageContext.request.contextPath}/resources/img/${sessionScope.member_session.m_photo}" />
						</div>
						<p style="margin-top: 20px; font-size: 18px;" class="info_div">${sessionScope.member_session.m_name}님
							안녕하세요.</p>
					</div>
					<div class="xans-element- xans-myshop xans-myshop-orderstate"
						style="float: left;">
						<div class="title">
							<h3>나의 주문처리 현황</h3>
						</div>
						<div class="state">
							<ul class="order">
								<li><strong>결제완료</strong> <a href="" class="count"><span
										id="xans_myshop_orderstate_shppied_before_count">${orderCount}</span></a></li>
								<li><strong>수강하기</strong> <a href="" class="count"><span
										id="xans_myshop_orderstate_shppied_standby_count">${lessonCount }</span></a></li>
							</ul>

							<div style="width: 100%; min-height: 1px; height: 50px;"></div>

							<!--       
<ul class="cs">
<li>
           <span class="icoDot"></span>
                <strong>취소 : </strong>
                <a href="/myshop/order/list.html?order_status=order_cancel" class="count"><span id="xans_myshop_orderstate_order_cancel_count">0</span></a>
            </li>
            <li>
                <span class="icoDot"></span>
                <strong>반품 : </strong>
                <a href="/myshop/order/list.html?order_status=order_return" class="count"><span id="xans_myshop_orderstate_order_return_count">0</span></a>
            </li>
        </ul>  -->
						</div>
					</div>
				</div>
				<div style="width: 100%; min-height: 1px; height: 40px;"></div>
				<div style="margin-left: 30px;">
					<input id="BT" type="button" value="주소 확인" onclick="view()">
				</div>
				<div id="hiddenTB" style="display: none">
					<div>
						<div style="width: 70%; margin-left: 30px;">
							${sessionScope.member_session.m_addr}</div>
						<div style="width: 30%;">
							<a style="margin-left: 30px;"
								href="${pageContext.request.contextPath}/common/regAddr.go">[수정]</a>
						</div>
					</div>
				</div>
			</div>
		</c:when>



		<c:when test="${login_number == 2}">
			<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell" style="float: left;">
						<div class="box" style="background: #BDBDBD; margin-right: 10px;">
							<img class="profile" style="vertical-align: middle;"
								src="${sessionScope.kakao_member_session.kakao_profile_img}" />
						</div>
						<p style="margin-top: 20px; font-size: 18px;" class="info_div">${sessionScope.kakao_member_session.kakao_nickname}님
							안녕하세요.</p>
					</div>
					<div class="xans-element- xans-myshop xans-myshop-orderstate"
						style="float: left;">
						<div class="title">
							<h3>나의 주문처리 현황</h3>
						</div>
						<div class="state">
							<!-- <ul class="order">
								<li><strong>결제완료</strong> <a href="" class="count"><span
										id="xans_myshop_orderstate_shppied_before_count">0</span></a></li>
								<li><strong>배송완료</strong> <a href="" class="count"><span
										id="xans_myshop_orderstate_shppied_standby_count">0</span></a></li>
								<li><strong>주문취소</strong> <a href="" class="count"><span
										id="xans_myshop_orderstate_shppied_begin_count">0</span></a></li>
								<li><strong>환불완료</strong> <a href=""><span
										id="xans_myshop_orderstate_shppied_begin_count">0</span></a></li>

							</ul> -->



							<ul>
								<li>
									<div>
										<div style="width: 70%;">
											${sessionScope.member_session.m_addr }</div>
										<div style="width: 30%;">
											<!-- <button>등록 및 수정</button> -->
										</div>
									</div>
								</li>
							</ul>

							<!--       
<ul class="cs">
<li>
           <span class="icoDot"></span>
                <strong>취소 : </strong>
                <a href="/myshop/order/list.html?order_status=order_cancel" class="count"><span id="xans_myshop_orderstate_order_cancel_count">0</span></a>
            </li>
            <li>
                <span class="icoDot"></span>
                <strong>반품 : </strong>
                <a href="/myshop/order/list.html?order_status=order_return" class="count"><span id="xans_myshop_orderstate_order_return_count">0</span></a>
            </li>
        </ul>  -->
						</div>
					</div>
				</div>
			</div>
		</c:when>

	</c:choose>

	<div style="width: 80%; min-height: 1px; height: 80px;"></div>
	<ul class="mylist">
		<li style="width: 158px;"><a
			href="${pageContext.request.contextPath}/common/take.class"
			style="font-weight: bold;">CLASS</a><br> <a
			href="${pageContext.request.contextPath}/common/take.class">수강하기</a>
		</li>
		<li style="width: 150px;"><a
			href="${pageContext.request.contextPath}/common/toOrderPage.go"
			style="font-weight: bold;">ORDER</a><br> <a>주문조회</a></li>
		<li style="width: 150px;"><a
			href="${pageContext.request.contextPath}/common/toCart.go"
			style="font-weight: bold;"> CART</a><br> <a
			href="${pageContext.request.contextPath}/common/toCart.go">장바구니</a></li>
		<li style="width: 145px; margin-left: 60px;"><a
			href="${pageContext.request.contextPath}/common/changeInfo.go"
			style="font-weight: bold;"> INFO</a><br> <a
			href="${pageContext.request.contextPath}/common/changeInfo.go">정보수정</a></li>
		<li style="width: 158px;"><a
			href="${pageContext.request.contextPath}/common/regAddr.go"
			style="font-weight: bold;"> ADDRESS</a><br> <a
			href="${pageContext.request.contextPath}/common/regAddr.go">주소등록</a></li>

	</ul>






	<script type="text/javascript">
		function view() {

			if (hiddenTB.style.display == "none") {

				hiddenTB.style.display = "block";

				BT.value = "접어두기";

			}

			else {

				hiddenTB.style.display = "none";

				BT.value = "주소 확인";

			}

		}
	</script>




</body>
</html>