<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	margin: 15px;
}

#boardcss_list_add_button_table {
	width: 100%;
	margin: 0 auto 15px;
	/*position: relative; background: #bddcff; font-weight: bold;*/
}

/* 화면에 보여지는 글 등록 버튼 */
#boardcss_list_add_button_table .add_button {
	cursor: pointer;
	border: 1px solid #bebebe;
	position: absolute;
	left: 0px;
	top: 10px;
	width: 80px;
	padding: 6px 0 6px;
	text-align: center;
	font-weight: bold;
}

#boardcss_list_add_button_table .add_button a {
	color: #ffffff;
}

/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#boardcss_list_add_button_table .boardcss_list_add_button ul {
	width: 100%;
	overflow: hidden;
	height: 10px;
}

/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table {
	width: 150%;
}

/* 화면에 보여지는 글 목록 테이블 */
.list_table {
}

/* 화면에 보여지는 caption */
.list_table caption {
	margin-bottom: 30px;
	font-weight: bold;
}

/* list_table 에서 사용되는 thead */
.list_table thead th {
	text-align: center;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	padding: 8px 0;
	background: #faf9fa;
}

/* list_table 에서 사용되는 tbody */
.list_table tbody td {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	padding: 5px 0;
}

.text-box {
	position: absolute;
	top: 30%;
	left: 33%;
}
</style>

</head>
<body>
	<!-- 테이블 시작 -->
	<div class="boardcss_list_table">
		<table class="list_table">
			<caption>주문량 확인</caption>
			<colgroup>
				<col width="130px" />
				<col width="150px" />
				<col width="100px" />
				<col width="100px" />
				<col width="250px" />
			</colgroup>
			<thead>
				<tr>
					<th>구매자아이디</th>
					<th>제품이름</th>
					<th>구매수량</th>
					<th>결제금액</th>
					<th>구매자 주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${p_order2s }">
					<tr>
						<td>${p.p2_o_id }</td>
						<td>${p.p2_p_name }</td>
						<td>${p.p2_p_quantidey }</td>
						<td><fmt:formatNumber value="${p.p2_sumPrice }"
								pattern="#,###" /> 원</td>
						<td>${p.p2_addr }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<input type="hidden" name="p_no" value="${param.p_no}">
		<table id="paging" style="margin-top: 100px; margin-left: 370px;">
			<tr>
				<td align="center"><a
					href="${pageContext.request.contextPath}/storeProductOrder.paging?p2=1&p_no=${param.p_no}">first</a>
					<c:forEach var="p2" begin="1" end="${pageCount}">
						<a
							href="${pageContext.request.contextPath}/storeProductOrder.paging?p2=${p2}&p_no=${param.p_no}">${p2 }</a>
					</c:forEach> <a
					href="${pageContext.request.contextPath}/storeProductOrder.paging?p2=${pageCount}&p_no=${param.p_no}">last</a></td>
			</tr>
		</table>
	</div>
	<!-- 테이블 종료 -->


</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/myPageJS.js"></script>

</html>