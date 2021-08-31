<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		//상점 판매를 승인하는 기능

		$('.approve').click(function() {
			let who = $(this).children('#approve_I').val();
			alert("승인");
			alert(who);
			const p = "?m_grade=3&m_id=" + who;

			$.ajax({
				url : "admin.storeApprove" + p,
				method : "GET",
				error : function(error) {
					alert("Error!");
				},
				success : function(data) {
					alert("success!");
				},
				complete : function() {
					location.reload();
				}
			});
		});

		// 입점 거부 기능-- m_grade가 4 가 되서 입점 반려 됨
		$('.reject').click(function() {
			let who = $(this).children('#reject_I').val();
			alert("거부");
			alert(who);
			const p = "?m_grade=4&m_id=" + who;

			$.ajax({

				url : "admin.storeApprove" + p,
				method : "GET",
				error : function(error) {
					alert("Error!");
				},
				success : function(data) {
					alert("success!");
				},
				complete : function() {
					location.reload();
				}
			});
		});

		// 판매중지-- m_grade가 4 가 되서 입점 반려 됨
		$('.sellingStop').click(function() {

			let who = $(this).val();
			alert("거부");
			alert(who);

			const p = "?m_grade=4&m_id=" + who;

			$.ajax({

				url : "admin.storeApprove" + p,
				method : "GET",
				error : function(error) {
					alert("Error!");
				},
				success : function(data) {
					alert("success!");
				},
				complete : function() {
					location.reload();
				}
			});
		});

		// 판매 재개
		$('.sellerAgain').click(function() {

			let who = $(this).val();
			alert("거부");
			alert(who);

			const p = "?m_grade=3&m_id=" + who;

			$.ajax({

				url : "admin.storeApprove" + p,
				method : "GET",
				error : function(error) {
					alert("Error!");
				},
				success : function(data) {
					alert("success!");
				},
				complete : function() {
					location.reload();
				}
			});
		});
		// 일반 회원
		$('.goNomal').click(function() {

			let who = $(this).val();
			alert("거부");
			alert(who);

			const p = "?m_grade=1&m_id=" + who;

			$.ajax({

				url : "admin.storeApprove" + p,
				method : "GET",
				error : function(error) {
					alert("Error!");
				},
				success : function(data) {
					alert("success!");
				},
				complete : function() {
					location.reload();
				}
			});
		});

	});
</script>

<style type="text/css">
.brd-head {
	float: both;
	margin: 10px;
	padding: 5px;
	color: white;
	background-color: #333;
	text-align: center;
	border: none;
}

.brd-head td {
	padding: 3px;
}

.brd-list {
	margin: 10px;
	padding: 5px;
	border-bottom: 0.1px solid #333;
	height: 25px;
	text-align: center;
	border-bottom: 0.2px solid #888;
	text-decoration: none;
	color: darkgray;
}

table.board {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 900px;
	border-left: none;
	border-right: none;
	border-bottom: 0.1px solid #333;
}

table.board img{
width: 100px;
height: 100px;
}

table button {
	border: 0.1px solid #888;
	width: 70px;
	background-color: white;
}

#option_B {
	border: 0.1px solid #888;
	width: 70px;
	background-color: white;
}

.borad {
	
}
.goNomal{
border: 0.1px solid #888;
	width: 90px;
	background-color: white;

}

</style>
</head>
<body>
	<h1>상점관리</h1>

	<br>
	<br>
	<h3>입점 대기 회원</h3>

	<table class="board">
		<tr class="brd-head">
			<td style="width: 100px;">상점사진</td>
			<td>상점명</td>
			<td> ID</td>
			<td>상점설명</td>
			<td colspan="2">구분</td>
		</tr>
		<c:forEach items="${Stores}" var="s">
			<tr class="brd-list">
				<td><img src="resources/img/${s.s_img}"></td>
				<td>${s.s_name}</td>
				<td>${s.s_id}</td>
				<td>${s.s_exp}</td>

				<td class="approve">
					<button class="approve_B">승인</button> <input id="approve_I"
					value="${s.s_id}" type="hidden">
				</td>

				<td class="reject">
					<button class="reject_B" id="${s.s_id}">거부</button> <input
					id="reject_I" value="${s.s_id}" type="hidden">
				</td>


			</tr>
		</c:forEach>
	</table>

	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&gubun=A">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						href="/jk/admin.shopManagemen?nowPage=${p }&cntPerPage=${paging.cntPerPage}&gubun=A">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&gubun=A">&gt;</a>
		</c:if>
	</div>

	<br>
	<br>
	<h3>판매 중 회원</h3>

	<table  class="board">
		<tr class="brd-head">
			<td>상점사진</td>
			<td>상점명</td>
			<td>ID</td>
			<td>상점설명</td>
			<td colspan="2">구분</td>
		</tr>
		<c:forEach items="${Stores2}" var="s2">
			<tr class="brd-list">

				<td><img src="resources/img/${s2.s_img}"></td>
				<td>${s2.s_name}</td>
				<td>${s2.s_id}</td>
				<td>${s2.s_exp}</td>
				<td>

					<button class="sellingStop" value="${s2.s_id}">판매 중지</button>
				</td>

			</tr>
		</c:forEach>
	</table>

	<div style="display: block; text-align: center;">
		<c:if test="${paging2.startPage != 1 }">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging2.startPage - 1 }&cntPerPage=${paging2.cntPerPage}&gubun=B">&lt;</a>
		</c:if>
		<c:forEach begin="${paging2.startPage }" end="${paging2.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging2.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging2.nowPage }">
					<a
						href="/jk/admin.shopManagemen?nowPage=${p }&cntPerPage=${paging2.cntPerPage}&gubun=B">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging2.endPage != paging2.lastPage}">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging2.endPage+1 }&cntPerPage=${paging2.cntPerPage}&gubun=B">&gt;</a>
		</c:if>
	</div>
	<br>
	<br>
	<h3>판매반려된 판매자</h3>
	<table class="board">

		<tr class="brd-head">
			<td>회원이름</td>
			<td>신청자 ID</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td colspan="2">구분</td>
		</tr>



		<c:forEach items="${Stores3}" var="s3">
			<tr class="brd-list">

				<td>${s3.m_name}</td>
				<td>${s3.m_id}</td>
				<td>${s3.m_email}</td>
				<td>${s3.m_phone}</td>
				<td>

					<button class="goNomal" value="${s3.m_id}">일반회원으로</button>
				</td>

			</tr>
		</c:forEach>

	</table>
	<div style="display: block; text-align: center;">
		<c:if test="${paging3.startPage != 1 }">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging3.startPage - 1 }&cntPerPage=${paging3.cntPerPage}&gubun=C">&lt;</a>
		</c:if>
		<c:forEach begin="${paging3.startPage }" end="${paging3.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging3.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging3.nowPage }">
					<a
						href="/jk/admin.shopManagemen?nowPage=${p }&cntPerPage=${paging3.cntPerPage}&gubun=C">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging3.endPage != paging.lastPage}">
			<a
				href="/jk/admin.shopManagemen?nowPage=${paging3.endPage+1 }&cntPerPage=${paging3.cntPerPage}&gubun=C">&gt;</a>
		</c:if>
	</div>


</body>
</html>