<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.brd-head {
	float: both;
	margin: 10px;
	padding : 5px;
	color: white;
	background-color: #333;
	text-align: center;
	
	
	border: none;
}

.brd-head td{
padding : 3px;
}

.brd-list {
	margin: 10px;
	padding : 5px;
	border-bottom: 0.1px solid #333;
	height: 25px;
	text-align: center;
	border-bottom: 0.2px solid #888;
	text-decoration: none;
	color: darkgray;
	font-size: 11pt;
}

table.board{
margin-top : 20px;
margin-bottom : 20px;
width : 1000px;
border-left: none;
border-right: none;
border-bottom: 0.1px solid #333;
}
table button{
border: 0.1px solid #888;
width : 70px;
background-color: white;
}

#option_B{
border: 0.1px solid #888;
width : 70px;
background-color: white;
}


.borad{


}

</style>

</head>
<body>
	<h3>
		<a href="admin.complainManagement">사용자 요청사항 & 문의사항 </a>
	</h3>
	<br>




	<form action="admin.complain.search" >


		<select name="option" id="option">

			<option id="1" value="searchWay">분류검색</option>
			<option id="2" value="c_id">민원인 ID</option>
			<option id="3" value="c_content">내용</option>
			<option id="5" value="c_phone">전화번호</option>
			<option id="5" value="c_email">이메일</option>
			<option id="5" value="c_reason">분류</option>
			<option id="5" value="c_state">처리상태</option>

		</select> <input id="seach_C" name="seach_C">
		<button id=option_B>검색</button>

	</form>



	<table class="board">
		<tr class="brd-head">
			<td style="width: 100px;">민원인 ID</td>
			<td>내용</td>
			<td>접수 날짜</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>분류</td>
			<td colspan="4">처리 상태</td>
		</tr>
		<c:forEach items="${complains}" var="c">
			<tr class="brd-list">

				<td>${c.c_id}</td>
				<td>${c.c_content}</td>
				<td>${c.c_date}</td>
				<td>${c.c_phone}</td>
				<td>${c.c_email}</td>




				<td><c:choose>
						<c:when test="${c.c_reason eq 'otherUser'}">다른 사용자 신고 </c:when>
						<c:when test="${c.c_reason eq 'contrects'}">거래 오류</c:when>
						<c:when test="${c.c_reason eq 'accounts'}">계정 오류</c:when>
						<c:when test="${c.c_reason eq 'ETC'}">기타</c:when>


					</c:choose></td>

				<td><c:choose>
						<c:when test="${c.c_state eq '1'}">
							<h5 style="color: green">접수 됨</h5>
						</c:when>
						<c:when test="${c.c_state eq '2'}">
							<h5 style="color: red;">처리 중</h5>
						</c:when>
						<c:when test="${c.c_state eq '3'}">
							<h5 style="color: navy;">처리 완료</h5>
						</c:when>
						<c:when test="${c.c_state eq '4'}">
							<h5 style="color: olive;">보류</h5>
						</c:when>


					</c:choose></td>

				<td>
					<button class="complainState_Start">처리시작</button> <input
					id="complainState_Start_I" value='${c.c_no}' type="hidden">
				</td>

				<td>
					<button class="complainState_Complite">완료</button> <input
					id="complainState_Complite_I" value='${c.c_no}' type="hidden">
				</td>

				<td>
					<button class="complainState_pending">보류</button> <input
					id="complainState_pending_I" value='${c.c_no}' type="hidden">
				</td>




			</tr>
		</c:forEach>
	</table>





	<div>

		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/jk/admin.complainManagement?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/jk/admin.complainManagement?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/jk/admin.complainManagement?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>

	</div>

</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/complainMemnagement.js"></script>


</html>