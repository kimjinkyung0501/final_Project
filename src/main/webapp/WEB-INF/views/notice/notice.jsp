<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{
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
   width: 150%;
}

/* 화면에 보여지는 caption */
.list_table caption {
   display: none;
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
    left: 35%;
}
</style>

</head>
<body>


<!-- 등록버튼 시작 -->
      <c:if test="${member_session.m_id eq 'admin'}">
<div id="boardcss_list_add_button_table">
   <div class="boardcss_list_add_button">
         <a href="${pageContext.request.contextPath}/notice/notice.reg.go" class="add_button">등록</a>
         
   </div>
</div>

         </c:if>
<!-- 등록버튼 종료 -->

            <div style="width: 0; min-height: 10px; height: 50px;"></div>
<!-- 테이블 시작 -->
<div class="boardcss_list_table">
   <table class="list_table">
      <caption>게시판</caption>
      <colgroup>
         <col width="40px" />
         <col width="200px" />
         <col width="40px" />
         <col width="40px" />
      </colgroup>
      <thead>
         <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성일</th>
         </tr>
      </thead>
      <tbody>
            <c:forEach var="list" items="${notices }" varStatus="status">
         <tr>
            <td>${status.count }</td>
            <td><a href="${pageContext.request.contextPath}/notice/notice.detail?n_no=${list.n_no}">${list.n_title }</a></td>
            <td>${list.n_count }</td>
            <td><fmt:formatDate value="${list.n_date }" type="date"
                  dateStyle="short" /></td>
         </tr>
      </c:forEach>
      </tbody>
   </table>
   <table>
      <tr>
         <td><a href="${pageContext.request.contextPath}/NoticePageController?p=1">first </a>
            <c:forEach var="p" begin="1" end="${pageCount }">
               <a href="${pageContext.request.contextPath}/NoticePageController?p=${p }">${p }</a>
            </c:forEach> <a href="${pageContext.request.contextPath}/NoticePageController?p=${pageCount }">last</a>
         </td>
      </tr>
   </table>
</div>
<!-- 테이블 종료 -->




</body>
</html>