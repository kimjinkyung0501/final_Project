
let checkIdValue = document.getElementsByClassName("checkId").value;
let emailCheckValue = document.getElementById("emailCheckValue").value;


   


function loginCheck() {
   const m_id = document.getElementById("id_input").value;
   const m_pw = document.getElementById("pw_input").value;
   if (m_id == "" || m_pw == "") {
      alert("아이디 혹은 비밀번호를 입력해주세요");
      return false;
   }
   else {
      $.ajax({
         url : "login.do",
         method : "post",
         async : false,
         data : {m_id : m_id, m_pw : m_pw}
         })
         .done(function(data){
            if(data){
               location.href="/jk/"
            }
            else{
               alert("아이디 혹은 비밀번호가 옳지 않습니다.");
               return false;
            }
         })
         .fail(function(){
            alert("아이디 혹은 비밀번호가 옳지 않습니다.");
         })
         }
}

function logout(){
   let ok = confirm("로그아웃 하시겠습니까?");
   if(ok){
      location.href="/jk/common/logout.do";
      //풀 패키징 경로
   }
}



