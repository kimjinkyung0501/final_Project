


   


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
function logout(nomalMember, kakaoMember){
   
   
   if(nomalMember != "" && kakaoMember == ""){
      let ok = confirm("로그아웃 하시겠습니까?");
         if(ok){
         location.href="/jk/common/logout.do";
         //풀 패키징 경로
            }
      }
      else if(nomalMember == "" && kakaoMember != ""){
         kakaoLogout();
      }
   
   
   
}

function kakaoLogout(){
   let apikey = "97e12e516bb866800a64e5676c4184c1";
   let redirectUrl = "http://localhost:80/jk/common/kakao.logout"   
   
   location.href="https://kauth.kakao.com/oauth/logout?client_id="+ apikey + "&logout_redirect_uri=" + redirectUrl;
   
}

