<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.text-box {
   top: 10%;
   left: 32%;
}

#container {
   width: auto;
}

#main_container {
   /*height: 6000px;*/
   
}

.contents {
   max-width: 933px;
   display: flex;
   border: 1px solid rgba(0, 0, 0, .0975);
   border: 1px solid rgba(0, 0, 0, .0975);
   border-radius: 3px;
   background: #fff;
   border-radius: 3px;
   border-radius: 3px;
   background: #fff;
}

.contents .img_section {
   overflow: hidden;
   width: 400px;
   border-right: 1px solid rgba(0, 0, 0, .0975);
   overflow: hidden;
}

.contents .img_section .trans_inner {
   /*width: 2448px;*/
   font-size: 0;
}

.contents .img_section .trans_inner>div {
   width: 100%;
   display: inline-block;
}

.contents .img_section .trans_inner img {
   width: 100%;
   height: 338px;
}

.user_container {
   display: flex;
   align-items: center;
}

.user_container .profile_img {
   width: 32px;
   height: 32px;
   border-radius: 50%;
   overflow: hidden;
   margin-right: 10px;
}

.user_container .profile_img img {
   height: 100%;
   width: 100%;
}

.user_container .user_name {
   color: #262626;
}

.user_container .nick_name {
   font-size: 14px;
   font-weight: bold;
   margin-bottom: 5px;
}

.contents .top {
   
}

.top .more_detail {
   position: absolute;
   right: -60px;
   top: 40px;
   background: white;
   border: 1px solid rgba(0, 0, 0, .0975);
   border-radius: 3px;
   z-index: 100;
   box-shadow: 2px 2px 2px rgba(128, 128, 128, 0.34);
   /*display: none;*/
   transform-origin: left top;
   transform: scale(0);
   transition: all 0.3s;
}

.sprite_more_icon.on .more_detail {
   /*display: block;*/
   transform: scale(1);
}

.top .more_detail>li {
   padding: 10px 20px;
   cursor: pointer;
}

.top .more_detail>li:hover {
   background: gray;
}

.user_container {
   padding: 4px;
}

.user_container .country {
   font-size: 12px;
}

.contents .img_section {
   overflow: hidden;
}

.contents .img_section .trans_inner {
   /*width: 2448px;*/
   font-size: 0;
}

.contents .img_section .trans_inner>div {
   width: 100%;
   display: inline-block;
}

.scroll_section .admin_container {
   margin-bottom: 10px;
}

.scroll_section .user_container-detail {
   margin-bottom: 10px;
}

.scroll_section .admin_container, .scroll_section .user_container-detail
   {
   display: flex;
}

.scroll_section .admin_container .admin, .scroll_section .user_container-detail .user
   {
   width: 32px;
   height: 32px;
   min-width: 32px;
   border-radius: 50%;
   overflow: hidden;
   margin-right: 10px;
}

.scroll_section .admin_container .admin img, .scroll_section .user_container-detail .user img
   {
   width: 100%;
   height: 100%;
}

/* 댓글 css 추가  */
.commet_container {
   padding: 5px 20px;
   display: flex;
   justify-content: space-between;
   align-items: center;
   color: #262626;
   font-size: 14px;
}

.commet_container .nick_name {
   font-weight: bold;
   margin-right: 10px;
   padding: 1px;
}

.commet_container .commet {
   display: flex;
}

.scroll_section .user_id {
   color: #262626;
   font-size: 14px;
   font-weight: bold;
   margin-right: 5px;
}

.scroll_section .comment {
   line-height: 1.4;
   position: relative;
   width: 100%;
}

.scroll_section .comment .icon_wrap {
   position: absolute;
   right: -23px;
   top: -9px;
   display: flex;
   align-items: center;
}

.scroll_section .comment .icon_wrap:hover>div:nth-child(1) {
   display: block;
}

.scroll_section .comment .icon_wrap>div {
   background: #fff;
   display: flex;
   align-items: center;
   width: 40px;
   height: 40px;
   justify-content: center;
   cursor: pointer;
   text-align: center;
}

.scroll_section .comment .icon_wrap>div:nth-child(1) {
   display: none;
   transform: translate(10px, 4px);
}

.scroll_section .comment .icon_wrap>div:nth-child(2) {
   background: transparent;
}

.try_comment {
   font-size: 12px;
   margin-left: 10px;
   cursor: pointer;
}

.scroll_section .comment .time {
   font-size: 15px;
   color: #999;
   margin-top: 10px;
}

.bottom_icons {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin: 4px;
}

.bottom_icons .left_icons {
   display: flex;
}

.bottom_icons .left_icons>div {
   margin-right: 10px;
   cursor: pointer;
}

.bottom_icons .left_icons>div.on {
   
}

.sprite_heart_icon_outline.on {
   background: url('../imgs/background01.png') no-repeat -26px -261px;
   animation: heart_bounce 1s linear;
}

.sprite_bookmark_outline.on {
   
}

.animation-target {
   animation: animation 1000ms linear both;
}

.count_likes {
   font-weight: bold;
   font-size: 14px;
   color: #262626;
   padding: 2px 3px;
}

.count_bookmark {
   font-weight: bold;
   font-size: 14px;
   color: #262626;
   padding: 5px 20px;
}

.timer {
   font-size: 10px;
   letter-spacing: .2px;
   color: #999;
   /* border-bottom: 1px solid rgba(0,0,0,.0975); */
   padding: 10px 20px;
}

.commit_field {
   min-height: 56px;
   padding: 0 20px;
   position: relative;
}

.content {
   font-size: 35px;
   font-weight: 200;
   display: inline-block;
   padding-right: 25px;
   margin-top: 10px;
   padding: 10px 20px;
}

.commit_field input {
   width: 83%;
   height: 56px;
   border: none;
   outline: none;
   background: transparent;
}

.commit_field input::placeholder {
   color: gray;
}

.commit_field .upload_btn {
   font-weight: bold;
   font-size: 14px;
   color: #3897f0;
   position: absolute;
   right: 20px;
   top: 50%;
   transform: translateY(-50%);
   cursor: pointer;
   opacity: 0.6;
   pointer-events: none;
}

.commit_field input:focus ~ .upload_btn {
   pointer-events: initial;
   opacity: 1;
}

#header .search_field input {
   margin-left: 50px;
   width: 185px;
   height: 28px;
   background: #fafafa;
   border: solid 1px #dbdbdb;
   border-radius: 3px;
   color: #999;
   font-weight: 400;
   font-size: 14px;
   outline: none;
}

#header .search_field input:focus ~ .fake_field span:nth-child(1) {
   transform: translateX(-55px);
}

#header .search_field input:focus ~ .fake_field span:nth-child(2) {
   display: none;
}

#header .search_field input::placeholder {
   font-size: 0;
   color: gray;
   text-indent: 10px;
}

#header .search_field input:focus::placeholder {
   font-size: 15px;
}

.replyIcon1 {
   margin-left: 15px;
   border: none;
   background-color: white;
}

.replyIcon3 {
   border: none;
   padding: 2px;
   background-color: white;
}

.replyIcon2 {
   margin-left: 5px;
   border: none;
   background-color: white;
}

.replyIconTop1 {
   margin-left: 690px;
   border: none;
   background-color: white;
}

.replyIconTop2 {
   margin-left: 5px;
   border: none;
   background-color: white;
}

.replyIconTop img {
   margin-bottom: 2px;
}

.del_pop {
   width: 100%;
   height: 100%;
   position: fixed;
   left: 0;
   top: 0;
   right: 0;
   bottom: 0;
   background: rgba(0, 0, 0, 0.48);
   z-index: -1;
   opacity: 0;
   transition: all 0.3s;
}

.del_pop.on {
   opacity: 1;
   z-index: 99999999999;
}

.del_pop.on .btn_box {
   transform: translate(-50%, -50%) scale(1);
}

.del_pop .btn_box {
   border-radius: 10px;
   width: 400px;
   background: #fff;
   position: absolute;
   left: 50%;
   top: 50%;
   transform: translate(-50%, -50%) scale(1.1);
   transition: all 0.2s;
}

.del_pop .btn_box>div {
   padding: 20px 0;
   text-align: center;
   cursor: pointer;
}

.del_pop .btn_box>div:nth-child(1) {
   border-bottom: 1px solid rgba(0, 0, 0, 0.09);
   color: #ed4956;
}

/* #snsL {
   left: 200px;
   top: 380px;
   width: 100px;
   height: 100px;
   color: #000000;
   font-size: 50pt;
   text-align: center;
   opacity: 0.8;
   cursor: pointer;
}

#snsR {
   right: 200px;
   top: 380px;
   width: 100px;
   height: 100px;
   color: #000000;
   font-size: 50pt;
   opacity: 0.8;
   cursor: pointer;
}

.paging {
   position: inherit;
   margin-top: auto;
   margin-bottom: auto;
} */
/*---------------------------detail-page*/
</style>
</head>
<body>


   <section id="container">

      <div id="header">
         <section class="h_inner">

            <div class="search_field" style="height: 70px;">
               <input type="text" placeholder="제목 검색" tabindex="0" id="search">
               <img onclick="goSearch();"
                  style="width: 25px; margin-left: 5px; background-color: white;"
                  src="https://cdn0.iconfinder.com/data/icons/very-basic-2-android-l-lollipop-icon-pack/24/search-512.png" />

               <a style="margin-left: 100px;"
                  href="${pageContext.request.contextPath}/story/story.reg.go">
                  <img
                  src="https://img.icons8.com/material-rounded/24/000000/plus--v1.png" />
               </a>
            </div>
         </section>
      </div>

      <div id="header">
         <section class="h_inner"></section>
      </div>

      <c:forEach var="list" items="${stories }">
         <div id="main_container">

            <section class="b_inner">

               <div class="contents_box">
                  <article class="contents cont01">
                     <div class="img_section">
                        <div style="display: flex;">
                           <div class="user_container">
                              <div class="profile_img">
                                 <a
                                    href="${pageContext.request.contextPath}/story.detail?s_no=${list.s_no}"><img
                                    src="${pageContext.request.contextPath}/resources/img/${list.s_photo }"
                                    alt=""></a>
                                 <!--로그인 세션값에서 프로필 이미지 가져와야하는뎀  -->
                              </div>
                              <div class="user_name">
                                 <div class="nick_name">${list.s_id }</div>

                                 <!--로그인 세션값에서 아이디 가져와야하는뎀  -->
                              </div>
                           </div>

                        </div>
                        <div class="trans_inner">
                           <div>
                              <a
                                 href="${pageContext.request.contextPath}/story.detail?s_no=${list.s_no}"><img
                                 src="${pageContext.request.contextPath}/resources/img/${list.s_photo }"
                                 alt=""></a>
                           </div>
                        </div>

                        <div class="bottom_icons">
                           <div class="left_icons">
                              <div class="heart_btn">
                                 <div data-name="heartbeat">
                                    <img class="likeBtn" style="height: 20px;" value1="${list.s_no}" value2="${sessionScope.member_session.m_id }"
                                    src="https://img.icons8.com/ios/50/000000/hearts--v1.png" />
                                 </div>
                              </div>
                              <div class="count_likes">
                                 좋아요 <span class="count">${list.s_like_count }</span> 개
                              </div>
                           </div>

                           <div class="right_icon">
                              <div class="sprite_bookmark_outline"></div>
                           </div>
                        </div>
                     </div>

                  </article>
                  <div style="height: 50px;">
                  <input type="hidden">
                  </div>


               </div>


            </section>

         </div>
      </c:forEach>


      <c:if test="${curPage != 1 }">
         <div align="center" id="snsL"
            onclick="storyPageChange(${curPage - 1 });">
            <div class="paging">
               <img style="width:  60px;" src="${pageContext.request.contextPath}/resources/img/l.png"
                  alt="">

            </div>
         </div>
      </c:if>
      <c:if test="${curPage != allPageCount }">
         <div align="center" id="snsR"
            onclick="storyPageChange(${curPage + 1 });">

            <div class="paging">
               <img style="width:  60px;" src="${pageContext.request.contextPath}/resources/img/r.png"
                  alt="">
            </div>
         </div>
      </c:if>




   </section>

   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <!--<script src="js/detail.js"></script>-->




</body>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/storyLike.js"></script>

</html>