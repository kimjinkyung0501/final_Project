<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text_box {
	left: 25%;
}

.hidden{
	display : none;
}

.contact {
	position: relative;
	max-width: 420px;
	padding: 40px 20px;
	overflow: hidden;
	margin: 0 auto;
}

.contact-area {
	width: 100%;
	position: relative;
}

.contact main section .content {
	float: left;
	width: 100%;
	padding: 20px 30px 50px 30px;
	position: relative;
	text-align: center;
}

.contact main section .content img {
	display: inline-block;
	width: 100px;
	height : 100px;
	border-radius: 50%;
}

.contact main .title {
	float: left;
	width: 100%;
	background-color: #c63535;
	max-height: 0px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	overflow: hidden;
	-webkit-transition: all 0.55s;
	-moz-transition: all 0.55s;
	-o-transition: all 0.55s;
	transition: all 0.55s;
}

.morebtn {
	position : absolute;
	bottom: 0;
	right: 50%;
	background-color: ivory;
	color: #252525;
	border: 0;
	width: 200px;
	height: 48px;
	text-align: center;
	border-radius: 30px;
	font-size: 16px;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	margin-bottom: -24px;
	margin-right: -100px;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	transition-delay: 0.1s;
	outline: none;
	overflow: hidden;
	z-index: 10;
	font-family: inherit;
	position: absolute;
}

.contact main section .content aside h1 {
	font-weight: 100;
	font-size: 22px;
	margin-bottom: 10px;
}

.contact main section .content aside p {
	font-size: 14px;
	letter-spacing: 0.5px;
	line-height: 160%;
}

.morebtn svg {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	opacity: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.morebtn.active {
	margin-right: 0;
	right: 20px;
	width: 65px;
	height: 65px;
	margin-bottom: -32.5px;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	border-radius: 65px;
	box-shadow: 0px 3px 15px rgb(0 0 0/ 20%);
}

.morebtn svg {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	opacity: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
}

.contact main button svg path {
	fill: #c63535;
}

.contact main .title {
	float: left;
	width: 100%;
	background-color: #c63535;
	max-height: 0px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	overflow: hidden;
	-webkit-transition: all 0.55s;
	-moz-transition: all 0.55s;
	-o-transition: all 0.55s;
	transition: all 0.55s;
}

.contact main .title p {
	padding: 15px 30px;
	color: #ffffff;
	font-size: 16px;
	display: inline-block;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	-webkit-transform: scale(0);
	-moz-transform: scale(0);
	-ms-transform: scale(0);
	-o-transform: scale(0);
	transform: scale(0);
}

.contact nav.active {
	max-height: 600px;
	-webkit-transition: all 1s;
	-moz-transition: all 1s;
	-o-transition: all 1s;
	transition: all 1s;
}

.contact nav {
	float: left;
	width: 100%;
	overflow: hidden;
	max-height: 0px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.contact nav.active a:nth-of-type(1) {
	transition-delay: 0.5s;
}

.contact nav.active a {
	opacity: 1;
	-webkit-transform: translateY(0px);
	-moz-transform: translateY(0px);
	-ms-transform: translateY(0px);
	-o-transform: translateY(0px);
	transform: translateY(0px);
	-webkit-transition: all 0.7s;
	-moz-transition: all 0.7s;
	-o-transition: all 0.7s;
	transition: all 0.7s;
}

.contact nav a {
	float: left;
	width: 100%;
	margin-top: 18px;
	background-color: #ffffff;
	padding: 18px 20px;
	border-radius: 5px;
	text-decoration: none;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	opacity: 0;
	-webkit-transform: translateY(-10px);
	-moz-transform: translateY(-10px);
	-ms-transform: translateY(-10px);
	-o-transform: translateY(-10px);
	transform: translateY(-10px);
	position: relative;
}

.contact nav a .content h1 {
	font-size: 13px;
	font-weight: 400;
	line-height: 160%;
	letter-spacing: 0.4px;
}

.contact nav a .content span {
	font-size: 10px;
	color: #b3b3b3;
	display: block;
	letter-spacing: 0.4px;
}

.contact nav a .arrow {
	position: absolute;
	right: 15px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
}

.modiBtn {
margin-left : 180px;
padding :3px;
	border: 0.5px solid gray;
	background-color: white;
}

.asd {
margin : 5px;
padding :3px;
	border: 0.5px solid gray;
	background-color: white;
}

#option_B{
margin : 5px;
padding :3px;
	border: 0.5px solid gray;
	background-color: white;
}
</style>

</head>
<body>
	<h1>
		<a href="admin.memberManagemen?nowPage=1&cntPerPage=5">회원 관리</a>
	</h1>
	<h4 style="color: red">${result}</h4>
	<div class="h5">
		<h5>회원 등급 : 1 = 일반회원 | 2 = 판매자 승인 대기 | 3 = 판매자 | 4 = 판매자 등록 반려자</h5>
	</div>
	<form action="admin.memberSearch">
		<div>

			<select name="option" id="option">

				<option id="1" value="search_J">분류검색</option>
				<option id="2" value="m_id">id</option>
				<option id="3" value="m_name">이름</option>
				<option id="4" value="m_phone">전화번호</option>
				<option id="5" value="m_addr">주소</option>
				<option id="5" value="m_email">Email</option>
				<option id="6" value="m_grade">회원 등급</option>

			</select> <input id="seach_v" name="Search_v">
			<button id=option_B>검색</button>

		</div>
	</form>
	<div style="margin-bottom: 30px;"></div>

	<div id="div1">


		<c:if test="${empty AllMembers}">
			<h1 style="color: red;">검색 정보 없음</h1>
		</c:if>




		<!-- 회원 카드  -->
		<c:forEach items="${AllMembers}" var="m">
			<div class="contact-area">
				<div class="contact" id="div2">
					<main>
						<section>
							<div class="content">
								<img src="${pageContext.request.contextPath}/resources/img/${m.m_photo}" type="hidden">

								<aside>
									<h1>${m.m_name}
										<input class="info_name" value="${m.m_name}" type="hidden">
									</h1>
									<p>${m.m_phone}
										<input class="info_phone" value="${m.m_phone}" type="hidden">
									</p>
									<p>
										${m.m_email} <input class="info_email" value="${m.m_email}"
											type="hidden">
									</p>
								</aside>

								<button class="morebtn">
									<span>More</span>

									<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
										viewBox="0 0 48 48"> <g class="nc-icon-wrapper"
											fill="#444444"> <path
											d="M14.83 30.83L24 21.66l9.17 9.17L36 28 24 16 12 28z"></path> </g> </svg>
								</button>
							</div>

							<div class="title">
								<p>Contact Me</p>
							</div>
						</section>


					</main>

					<nav>
						<a href="#" class="gmail"> <!-- 	<div class="icon">
						<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
						 </svg>
					</div> -->

							<div class="content">
								<h1>ID</h1>
								<span> ${m.m_id} <input class="info_id" value="${m.m_id}"
									type="hidden"></span>
							</div>
							<div class="content">
								<h1>PW</h1>
								<span> ${m.m_pw} <input class="info_pw" value="${m.m_pw}"
									type="hidden"></span>
							</div>

							<div class="content">
								<h1>ADDR</h1>
								<span> ${m.m_addr} <input class="info_addr"
									value="${m.m_addr}" type="hidden"></span>
							</div>

							<div class="content">
								<h1>STATUS</h1>
								<span> <c:choose>
										<c:when test="${m.m_grade == 1}">일반회원 </c:when>
										<c:when test="${m.m_grade == 2}">판매대기</c:when>
										<c:when test="${m.m_grade == 3}">판매 중</c:when>
										<c:when test="${m.m_grade == 4}">판매 반려</c:when>
									</c:choose> <input class="info_grade" value="${m.m_grade}" type="hidden"></span>
							</div> <svg class="arrow" xmlns="http://www.w3.org/2000/svg"
								width="48px" height="48px;" viewBox="0 0 48 48"> <g
									class="nc-icon-wrapper" fill="#444444"> 
							
							
							
							<path d="M17.17 32.92l9.17-9.17-9.17-9.17L20 11.75l12 12-12 12z"></path> </g> </svg>
						</a>

						<div>
							<button class="modiBtn">수정</button>
						</div>


					</nav>




					<form action="admin.memberRenew">
						<div class="div3"></div>
					</form>

				</div>
			</div>
		</c:forEach>


		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/jk/admin.memberManagemen?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/jk/admin.memberManagemen?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/jk/admin.memberManagemen?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>

	</div>



</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		// 검색
		$("#option_B").click(function() {

			let option = $("#option option:selected").val();

			alert(option);

			if (option == "search_J") {
				alert("검색 분류를 선택해 주세요");

				return false;

			}
		});

		let test;
		let ex_id;
		let ex_pw;
		let ex_name;
		let ex_addr;
		let ex_phone;
		let ex_grade;
		let ex_email;

		$(".modiBtn").click(function() {
						$("#div2").click(function() {

												$(".div3").empty();
												test = $(this).find('.info_id')
														.val();
												ex_id = $(this)
														.find('.info_id').val();
												ex_pw = $(this)
														.find('.info_pw').val();
												ex_name = $(this).find(
														'.info_name').val();
												ex_addr = $(this).find(
														'.info_addr').val();
												ex_phone = $(this).find(
														'.info_phone').val();
												ex_grade = $(this).find(
														'.info_grade').val();
												ex_email = $(this).find(
														'.info_email').val();

												console.log(ex_id);
												console.log(ex_pw);
												console.log(ex_name);
												console.log(ex_addr);
												console.log(ex_phone);
												console.log(ex_grade);
												console.log(ex_email + '=====================');

												$(this)
														.find(".div3")
														.append(
																"<table style='border: 1px solid blue;' >");
												$(this)
														.find(".div3")
														.append(
																"<tr><td><input class='new_id' name='m_id' value=" + ex_id + " type='hidden'></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 pw <input class='new_pw' name='m_pw' value=" + ex_pw + "></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 이름 <input class='new_name' name='m_name' value=" + ex_name + "></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 주소 <input class='new_addr' name='m_addr' value=" + ex_addr + "></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 전화번호 <input class='new_phone' name='m_phone' value=" + ex_phone + "></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 레벨 <input class='new_grade' name='m_grade' value=" + ex_grade + "></td></tr>");
												$(this)
														.find(".div3")
														.append(
																"<tr><td>새로운 E-Mail <input class='new_email' name='m_email' value=" + ex_email + "></td></tr>");
												$(this)
														.find(".div3")
														.append("<button class='asd'>수정완료</button></table>");

											});
						
						
						
						
						
						})

	});

	$('.morebtn').click(function() {
	
		var moreBtn = $(this);
		var nav = moreBtn.parent().parent().parent().next();
		var div3 = nav.next().children();
		moreBtn.toggleClass('active');
		nav.toggleClass('active');
		/* div3.toggleClass('hidden'); */
	});
</script>
</html>