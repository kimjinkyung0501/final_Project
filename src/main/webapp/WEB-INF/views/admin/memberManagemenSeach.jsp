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

#option_B {
	border: 0.1px solid #888;
	width: 70px;
	background-color: white;
}

.modiBtn {
	border: 0.1px solid #888;
	width: 70px;
	background-color: white;
}

.div1 {
	border: 1px solid #ececec;
	font-size: 14px;
	color: #4c4c4c;
	height: 40px;
	padding: 10px;
	width: 300px;
	display: flex;
}

.div2 img {
	width: 100px;
	height: 100px;
	float: left;
	margin-right: 20px;
}

.div2 {
	border: 1px solid #ececec;
	font-size: 14px;
	color: #4c4c4c;
	padding: 10px;
	width: 300px;
}

.h5 {
	padding: 20px;
	border: 1px solid gray;
	margin-bottom: 50px;
}

.goNomal {
	border: 0.1px solid #888;
	width: 80px;
	background-color: white;
}

.modiBtn {
	margin: 10px;
}
.asd{
	margin-top: 5px;
	border: 0.5px solid gray;
	background: white;
}
</style>

</head>
<body>
	<h1>
		<a href="admin.memberManagemen?nowPage=1&cntPerPage=5">회원 관리</a>
	</h1>
	<h3>${result}</h3>
	<h5>회원 등급 : 1 = 일반회원 | 2 = 판매자 승인 대기 | 3 = 판매자 | 4 = 판매자 등록 반려자</h5>



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


	<div id="div1">


		<c:if test="${empty AllMembers}">
			<h1 style="color: red;">검색 정보 없음</h1>
		</c:if>
		<c:forEach items="${AllMembers}" var="m">
			<div class="div2" style="border: 1px solid #eee;">

				<div>
					<img src="resources/img/${m.m_photo}" type="hidden">
				</div>

				<div>
					회원 ID : ${m.m_id} <input class="info_id" value="${m.m_id}"
						type="hidden">
				</div>

				<div>
					비밀번호 : ${m.m_pw} <input class="info_pw" value="${m.m_pw}"
						type="hidden">
				</div>

				<div>
					이름 : ${m.m_name} <input class="info_name" value="${m.m_name}"
						type="hidden">
				</div>
				<div>
					주소 : ${m.m_addr} <input class="info_addr" value="${m.m_addr}"
						type="hidden">
				</div>

				<div>
					전화번호 : ${m.m_phone} <input class="info_phone" value="${m.m_phone}"
						type="hidden">
				</div>

				<div>
					<c:choose>
						<c:when test="${m.m_grade == 1}">일반회원 </c:when>
						<c:when test="${m.m_grade == 2}">판매대기</c:when>
						<c:when test="${m.m_grade == 3}">판매 중</c:when>
						<c:when test="${m.m_grade == 4}">판매 반려</c:when>
					</c:choose>
					<input class="info_grade" value="${m.m_grade}" type="hidden">
				</div>


				<div>
					이메일 : ${m.m_email} <input class="info_email" value="${m.m_email}"
						type="hidden">
				</div>

				<div>
					<button class="modiBtn">수정버튼</button>
				</div>


				<form action="admin.memberRenew">
					<div class="div3"></div>
				</form>


			</div>





		</c:forEach>
</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/memberJs.js"></script>
</html>