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


/*아이디와 비밀번호 찾기의 이메일 인증 부분*/
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
   $('.emailBtnForPw').on("click", function(){
      var nameInput = $('#nameInput2').val();
      var emailInput = $('#emailInput').val();
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
   
   
})



