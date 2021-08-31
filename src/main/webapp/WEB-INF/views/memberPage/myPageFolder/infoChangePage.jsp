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
.red_txt {
	color: #ee7272;
}

.blind {
	display: block;
	overflow: hidden;
	position: absolute;
	left: 0;
	top: -5000px
}

.wrap {
	max-width: 960px;
	margin: 0 auto;
}

.wrap.wd668 {
	max-width: 628px;
}

.wrap.wd668.line {
	border: 1px solid #ececec;
	padding: 30px 20px;
}

.container {
	width: 100%;
}

.sub_tit_txt {
	margin: 80px 0 20px 20px;
	color: #2f2f2f;
	font-size: 25px;
}

.wrap.wd668.line .sub_tit_txt {
	margin: 0px 0 20px 20px;
}

.con_term .term_txt {
	border: 1px solid #ececec;
	padding: 30px;
	height: 210px;
	overflow-y: auto;
	margin: 0 0 15px;
}

.con_term .term_txt ul li, .con_term .term_txt p, .con_term .term_txt div
	{
	color: #818181;
	font-size: 12px;
	line-height: 17px;
	margin: 0 0 15px;
}

.left_margin {
	margin: 0 0 0 20px;
}

.con_term .term_txt div.txt_bold {
	font-weight: bold;
	margin: 0 0 25px;
}

.btn_wrap {
	text-align: center;
	margin: 40px 0 30px;
}

.btn_wrap a {
	color: #fff;
	background-color: #4380ce;
	font-weight: bold;
	padding: 10px;
	height: 30px;
	line-height: 30px;
	width: 168px;
	display: block;
	text-align: center;
	margin: 0 auto;
}

.btn_wrap a.wide {
	width: 587px;
	margin: 0 0 0 20px;
}

.find_txt ul li {
	color: #9a9a9a;
	font-size: 13px;
	text-align: center;
	line-height: 17px;
	margin: 0 0 20px;
}

.form_txtInput .checkbox_wrap {
	position: relative;
	padding: 5px;
	text-align: right;
}

.form_txtInput .checkbox_wrap input[type="checkbox"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.form_txtInput .checkbox_wrap input[type="checkbox"]+label {
	display: inline-block;
	line-height: 14px;
	position: relative;
	padding-left: 20px;
	font-size: 13px;
	color: #818181;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.form_txtInput .checkbox_wrap input[type="checkbox"]+label:before {
	content: '';
	position: absolute;
	top: 0px;
	left: 0;
	width: 12px;
	height: 12px;
	text-align: center;
	background: #fff;
	border: 1px solid #c2c2c2;
}

.form_txtInput .checkbox_wrap input[type="checkbox"]+label:active:before,
	.checkbox_wrap input[type="checkbox"]:checked+label:active:before {
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.form_txtInput .checkbox_wrap input[type="checkbox"]:checked+label:before
	{
	background: #fff;
	border-color: #ddd;
}

.form_txtInput .checkbox_wrap input[type="checkbox"]:checked+label:after
	{
	content: '✓';
	color: #0094ff;
	position: absolute;
	top: 0px;
	left: 2px;
	width: 7px;
	height: 7px;
	font-size: 13px;
	font-weight: bold;
}

.exTxt {
	font-size: 14px;
	color: #9a9a9a;
	display: block;
	margin: 0 0 45px 20px;
}

.join_form {
	width: 600px;
}

.join_form table {
	border-spacing: 0;
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
}

.join_form table input {
	border: 1px solid #ececec;
	font-size: 14px;
	color: #4c4c4c;
	height: 40px;
	padding: 10px;
	width: 300px;
	float: left;
}

.join_form table input.email {
	display: inline-block;
}

.join_form.idpwFind table input {
	width: 519px;
}

.join_form.idpwFind table input.email {
	width: 223px;
}

.join_form.idpwFind table input.phone {
	width: 182px;
	margin: 0 12px 0 11px;
}

.join_form.idpwFind table input.phone2 {
	width: 182px;
}

.join_form table input.send_number {
	width: 383px;
}

.join_form table th span {
	color: #404040;
	font-size: 14px;
	display: inline-block;
	position: relative;
	padding: 0 10px 0 0;
	text-indent: 20px;
}

.join_form table th {
	text-align: left;
}

.join_form table td {
	padding: 6px 0;
	position: relative;
}

.join_form table th span:after {
	content: '*';
	font-size: 13px;
	color: #f95427;
	position: absolute;
	top: 0;
	right: 0px;
}

.join_form.idpwFind table th span:after {
	content: none;
}



#changeName{
	display: inline-block;
	float: left;
	margin-left: 5px;
	margin-bottom: 5px;
	width: 100px;
	height: 38px;
	border: 1px solid #cfcfcf;
	background: #dedede;
	color: #626262;
	text-align: center;
	vertical-align: top;
}

.btn_confirm {
	display: inline-block;
	float: left;
	margin-left: 5px;
	margin-bottom: 5px;
	width: 100px;
	height: 38px;
	border: 1px solid #cfcfcf;
	background: #dedede;
	color: #626262;
	text-align: center;
	vertical-align: top;
}

#btn_confirm {
	display: inline-block;
	float: left;
	margin-left: 5px;
	margin-bottom: 5px;
	width: 100px;
	height: 38px;
	border: 1px solid #cfcfcf;
	background: #dedede;
	color: #626262;
	text-align: center;
	vertical-align: top;
}

.join_form.idpwFind table td select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background:
		url(https://secsales.interparkb2b.co.kr/data/G94/main/sele_arr.gif)
		no-repeat 95% 50%;
	text-indent: 20px;
	width: 124px;
	height: 50px;
	border: 1px solid #ececec;
	font-size: 14px;
	color: #ccc;
	float: left;
}

.join_form.idpwFind table td select::-ms-expand {
	display: none;
}

.join_form.idpwFind table td  tr.phone td select {
	text-align: center;
	text-indent: 10px;
}

.join_form.idpwFind table tr.email input:after, .mar10:after, .join_form.idpwFind table td select:after,
	.join_form table td a.btn_confirm:after {
	content: '';
	display: block;
	clear: both;
}

.agree_wrap {
	margin: 36px 0 0;
}

.agree_wrap .checkbox_wrap {
	text-align: left;
}

::placeholder {
	color: #c4c4c4;
	opacity: 1;
}

:-ms-input-placeholder {
	color: #c4c4c4 !important;
}

::-ms-input-placeholder {
	color: #c4c4c4 !important;
}

.mar27 {
	margin: 27px 0 0;
}

.mar10 {
	margin: 14px 5px 0 10px;
	display: inline-block;
	padding: 0;
	float: left;
}

.exform_txt {
	padding: 12px 0 19px 0;
	text-align: right;
	color: #9a9a9a;
	font-size: 13px;
	border-bottom: 1px solid #ececec;
}

.exform_txt span {
	display: inline-block;
	position: relative;
	padding-left: 10px
}

.exform_txt span:after {
	content: '*';
	position: absolute;
	left: 0;
	top: 0;
	color: #f95427;
	font-size: 13px;
	font-weight: bold;
}

.explan_txt {
	margin: 3px 0 0 22px;
}

.explan_txt li {
	color: #b2b2b2;
	font-size: 13px;
	line-height: 17px;
}

.popWrap {
	border: 1px solid #ececec;
	padding: 30px;
	max-width: 400px;
	width: 100%;
	margin: 30px auto 0;
	display: none;
	position: absolute;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	background: #fff;
	z-index: 5;
}

.popWrap.is-open {
	display: block;
}

.popWrap .pop_txt_con .pop_exTxt {
	font-size: 14px;
	color: #9a9a9a;
	line-height: 20px;
}

.popWrap .pop_txt_con .pop_exTxt span {
	color: #254ee9
}

.popWrap .pop_btnWrap {
	margin: 30px 0 0;
}

.popWrap .pop_btnWrap a {
	color: #fff;
	background-color: #4380ce;
	font-weight: bold;
	padding: 10px;
	height: 22px;
	line-height: 22px;
	width: 103px;
	display: block;
	text-align: center;
}

.join_form table input.send_number::placeholder {
	text-align: right;
}

.join_form table input.send_number:-ms-input-placeholder {
	text-align: right;
}

.join_form table input.send_number::-ms-input-placeholder {
	text-align: right;
}

.overlayer {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 2;
	cursor: pointer;
}

.overlayer.is-open {
	display: block;
}

#changeEmail{
		display: inline-block;
	float: left;
	margin-left: 5px;
	margin-bottom: 5px;
	width: 100px;
	height: 38px;
	border: 1px solid #cfcfcf;
	background: #dedede;
	color: #626262;
	text-align: center;
	vertical-align: top;
	
	}
/* 
#changeName {
	border: none;
	background-color: white;
	background-image:
		url("${pageContext.request.contextPath}/resources/img/checkIcon.png");
} */
</style>
</head>
<body>

   <!-- 8월 22일 추가, 세션 값 끝나면 로그인 페이지로 이동하는 기능 -->
   <c:set var="session" value="${sessionScope.member_session}"/>
   <c:if test="${session eq null}">
      <script type="text/javascript">
         function goLogin(){
            location.href = "/jk/common/login.main";
         }
         
         goLogin();
      </script>
   </c:if>
   
   
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h4 class="sub_tit_txt">회원정보수정</h4>
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>



						<tbody>


							<tr class="content_img">
								<th><span>이미지</span></th>
								<td>
								<form action="changeProfile.do" id="photoSubmit" method="post" enctype="multipart/form-data">
								<input hidden="1" name="m_id" id="memberId"
									value="${sessionScope.member_session.m_id}"> <input
									id="m_photo" name="m_photo" type="file">
									<button id="btn_confirm" class="changePhotoBtn">확인</button>
								</form>
								</td>
							</tr>


							<tr>
								<th><span>이름 </span></th>
								<td class="content_name"><input type="text" id="memberName" readonly
									placeholder="${sessionScope.member_session.m_name}">
									<button id="btn_confirm" class="nameChangeBtn">수정하기</button></td>
							</tr>


							<tr>
								<th><span>비밀번호 </span></th>
								<td class="content_pw"><input type="password"
									value="${sessionScope.member_session.m_pw }" readonly>
									<button class="btn_confirm" onclick="return changePwGo();">수정하기</button>
								</td>
							</tr>


							<tr class="email">
								<th><span>이메일 </span></th>
								<td class="content_email"><input type="text" class="email" readonly
									placeholder="${sessionScope.member_session.m_email}"><span>
										<button id="btn_confirm" class="emailChangeBtn">수정하기</button>
								</span></td>
							</tr>

							<tr>
								<th><span>휴대폰 번호</span></th>
								<td class="content_phone"><span hidden="1">${sessionScope.member_session.m_phone}</span>
									<input style="width: 93px; margin-right: 10px;" readonly
									value="${fn:substring(sessionScope.member_session.m_phone,0,3)}">
									<input style="width: 93px; margin-right: 10px;" readonly
									value="${fn:substring(sessionScope.member_session.m_phone,3,7)}">
									<input style="width: 93px;" readonly value="****">
									<button class="btn_confirm">수정하기</button></td>
							</tr>


						</tbody>


						<!-- .btn_confirm -->
					</table>


				</div>
				<!-- join_form E  -->
			</div>
			<!-- form_txtInput E -->
		</div>
		<!-- content E-->
	</div>
	<!-- container E -->




</body>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/myPageJS.js"></script>

</html>