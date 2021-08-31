const use_phone = document.querySelector("#use_phone_header");
const use_email = document.querySelector("#use_email_header");
const use_phone_click = document.getElementById("use_phone_click");
const use_email_click = document.getElementById("use_email_click");

//해당 버튼을 누를 때 테이블 보이게 해주고 다른 녀석은 안 보이게 해주는 녀석
function showDiv_phone(){
   use_phone_click.style.display ="block";
   use_email_click.style.display ="none";
}


function showDiv_email(){
   use_email_click.style.display = "block";
   use_phone_click.style.display = "none";
}

use_phone.addEventListener("click", showDiv_phone);
use_email.addEventListener("click", showDiv_email);


/*아이디와 비밀번호 찾기의 인증 부분*/
$(document).ready(function(){
   /*Id찾을 때 이메일 인증*/
   $('.emailBtnForId').on("click", function(){
      var nameInput = $('#nameInput2').val();
      var emailInput = $('#emailInput').val();
      $.ajax({
         url : "/jk/common/searchId.do",
         method :"post",
         data :{
            m_name : nameInput,
            m_email : emailInput
         }
      })
      .done(function(data){
         if(data){
            alert("이메일을 확인해주세요");
            location.href="/jk/common/login.main"
         }
         else{
            alert("존재하지 않는 이메일입니다.");
         }
      })
      .fail(function(){
         alert("이름과 이메일을 확인해주세요");
      })
   })
   
   /*비밀번호 찾을 때 이메일 인증*/
   /*8월 23일 여기 수정*/
   $('.emailBtnForPw').on("click", function(){
      var nameInput = $('#nameInputForPw2').val();
      var emailInput = $('#emailInputForPw').val();
      $.ajax({
         url : "/jk/common/searchPw.do",
         method :"post",
         data :{
            m_name : nameInput,
            m_email : emailInput
         }
      })
      .done(function(data){
         if(data){
            alert("이메일을 확인해주세요");
            location.href="/jk/common/login.main"
         }
         else{
            alert("존재하지 않는 이메일입니다.");
         }
      })
      .fail(function(){
         alert("이름과 이메일을 확인해주세요");
      })
   })



   
   $('.searchIdByPhone').on("click", function(){
      var o = confirm("휴대폰 인증을 실시하시겠습니까?");
      if(o){
         var m_name = $('#nameInput1').val();
         var m_phone = $('#phoneInput').val();
         $.ajax({
            url : "/jk/common/searchIdByPhone.do",
            method : "post",
            data :{
               m_name : m_name,
               m_phone : m_phone
            }
         })
         .done(function(data){
            if(data){
               alert("메세지를 확인해주세요.");
               $.ajax({
                  url : "/jk/common/sendSNS.searchId",
                  method : "post",
                  data :{
                     userPhoneNumber : m_phone
                  },
                  success : function(){
                     alert("메세지 전송 성공");
                  }
                  
               })
                  
            }
            else{
               alert("이름과 등록된 연락처가 다릅니다.");
            }
         })
         .fail(function(){
            alert("ajax실패");
         })         
      }
      
   })
   
   
   /*핸드폰을 활용한 아이디 찾기 기능*/
   /*인증하기 버튼을 클릭 했을 때 발생하는 이벤트*/
   $('.submitPhoneKeyBtn').on("click", function(){
      var phoneKey = $('#phoneKeyInput').val();
      var m_phone = $('#phoneInput').val();
      var m_name = $('#nameInput1').val();

	//입력하지 않은 값이 하나라도 있을 경우 작동하지 않게
      if(phoneKey == "" || m_phone == "" || m_name == ""){
         alert("입력하지 않은 값이 있습니다.");
         return false;
      }
      else{
         $.ajax({
            url : "/jk/common/compareKey",
            method : "post",
            data : {
               m_p_id : phoneKey,
               m_p_number : m_phone
            }
         })
         .done(function(data){
		//사용자가 입력한 키값과 DB의 값이 일치할 경우 오는 콜백함수
            if(data){
               $.ajax({
                  url : "/jk/common/sendEmail.checkId",
                  method : "get",
                  data : {
                     m_phone : m_phone
                  }
                     
               })
               .done(function(data){
                  if(data){
                     alert("등록하신 회원님의 이메일을 확인해주세요");
                  }
                  else{
                     alert("등록되어진 이메일이 없습니다.");
                  }
               })
               .fail(function(){
                  alert("ajax실패");
               })
            }
            else{
               alert("인증키가 올바르지 않습니다.");
            }
         })
         .fail(function(){
            alert("ajax오류");
         })
      }
   })

   /*비밀번호 찾기, 핸드폰 인증*/
   $('.searchPwByPhone').on("click", function(){
      var o = confirm("휴대폰 인증을 실시하시겠습니까?");
      if(o){
         var m_name = $('#nameInputForPw').val();
         var m_phone = $('#phoneInputForPw').val();
         $.ajax({
            url : "/jk/common/searchIdByPhone.do",
            method : "post",
            data :{
               m_name : m_name,
               m_phone : m_phone
            }
         })
         .done(function(data){
            if(data){
               alert("메세지를 확인해주세요.");
               $.ajax({
                  url : "/jk/common/sendSNS.searchPw",
                  method : "post",
                  data :{
                     userPhoneNumber : m_phone
                  },
                  success : function(){
                     alert("메세지 전송 성공");
                  }
                  
               })
            }
            else{
               alert("이름과 등록된 연락처가 다릅니다.");
            }
         })
         .fail(function(){
            alert("ajax실패");
         })         
      }      
   })
	

   $('.submitPhoneKeyForPwBtm').on("click", function(){
      var phoneKey = $('#phoneKeyInput').val();
      var m_phone = $('#phoneInputForPw').val();
      var m_name = $('#nameInputForPw').val();
      if(phoneKey == "" || m_phone == "" || m_name == ""){
         alert("입력하지 않은 값이 있습니다.");
         return false;
      }
      else{
         $.ajax({
            url : "/jk/common/compareKey",
            method : "post",
            data : {
               m_p_id : phoneKey,
               m_p_number : m_phone
            }
         })
         .done(function(data){
            if(data){
               $.ajax({
                  url : "/jk/common/sendEmail.checkPw",
                  method : "get",
                  data : {
                     m_phone : m_phone,
                     m_name : m_name
                  }
                     
               })
               .done(function(data){
                  if(data){
                     alert("등록하신 회원님의 이메일을 확인해주세요");
                  }
                  else{
                     alert("등록되어진 이메일이 없습니다.");
                  }
               })
               .fail(function(){
                  alert("ajax실패");
               })
            }
            else{
               alert("인증키가 올바르지 않습니다.");
            }
         })
         .fail(function(){
            alert("ajax오류");
         })
      }
   })   

   
})

