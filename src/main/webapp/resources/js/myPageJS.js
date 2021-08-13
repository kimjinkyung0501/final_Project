const content_name = document.querySelector('.content_name');
const content_id = document.querySelector('.content_id');
const content_pw = document.querySelector('.content_pw');
const content_phone = document.querySelector('.content_phone');
const content_email = document.querySelector('.content_email');

let nameCount = 0;
let idCount = 0;
let emailCount = 0;

const pwDiv = document.getElementById("pwDiv");
const spanTag = document.getElementById("spanTag");



function commitName() {
   var div = document.createElement('div');
   var input = document.createElement('input');
   var button = document.createElement('button');
   //각각의 Element 생성
   div.classList.add('contentName');   //해당 이름의 클래스 생성
   input.type = "text";            //input태그의 타입과
   input.id = "InputName"            //id 설정
   button.innerText = "수정";         //button태그 안에 글 넣기
   button.id = "changeName"
   div.appendChild(input);            //div안에 input태그와
   div.appendChild(button);         //button태그를 포함시키기
   content_name.appendChild(div);
   nameCount++;                  //content_name이라는 div안에
}                              //새로 생성한 div 넣기

function commitId() {
   var div = document.createElement('div');
   var input = document.createElement('input');
   var button = document.createElement('button');
   div.classList.add('contentId');
   input.type = "text";
   input.id = "InputId"
   button.innerText = "수정";
   button.id = "changeId"
   div.appendChild(input);
   div.appendChild(button);
   content_id.appendChild(div);
   idCount++;
}

function commitEmail(){
   var div = document.createElement("div");
   var input = document.createElement("input");
   var button = document.createElement("button");
   div.classList.add("contentEmail");
   input.type = "text";
   input.id = "inputEmail";
   button.innerText = "인증하기";
   button.id = "changeEmail";
   div.appendChild(input);
   div.appendChild(button);
   content_email.appendChild(div);
   emailCount++;
}




$(document).ready(function() {
   $('.nameChangeBtn').click(function() {
      var ok = confirm("이름을 변경하시겠습니까?");
      if (ok) {
         if(nameCount==0){
            commitName();
         $('#changeName').on("click", function() {
            var changeInputValue = document.getElementById("InputName").value;
            var session_value = document.getElementById("memberName").innerText;
            var memberId = document.getElementById("memberId").innerText;
            $.ajax({
               url: "changeName.do",
               method: "get",
               data: {
                  newData: changeInputValue,
                  preData: session_value,
                  memberId: memberId
               }
            })
               .done(function() {
                  location.reload();
               })
               .fail(function() {
                  alert("통신 실패");
               })
         })
         }
         else{
            alert("수정할 값을 입력해주세요");
         }
         
      }

   })

   $('.idChangeBtn').click(function() {
      var ok = confirm("아이디를 변경하시겠습니까?");
      if (ok) {
         if(idCount==0){
            commitId();
         $('#changeId').on("click", function() {
            var changeInputValue = document.getElementById("InputId").value;
            var session_value = document.getElementById("memberId").innerText;
            $.ajax({
               url: "changeId.do",
               method: "get",
               data: {
                  newData: changeInputValue,
                  preData: session_value,
               }
            })
               .done(function() {
                  location.reload();
               })
               .fail(function() {
                  alert("통신 실패");
               })
         })            
         }
         else{
            alert("수정할 값을 입력해주세요");
         }
         
      }
   })
   
   $('.emailChangeBtn').on("click", function(){
      var ok = confirm("이메일을 변경하시겠습니까?");
      if(ok){
         if(emailCount==0){
            commitEmail();
            $('#changeEmail').on("click", function(){
            var newEmail = document.getElementById("inputEmail").value;
            var userId = document.getElementById("memberId").innerText;
               $.ajax({
                  url : "sendEmail.do",
                  method : "get",
                  data : {
                     t_m_id : userId,
                     t_m_email : newEmail   
                  }
               })
               .done(function(data){
                  if(data){
                     alert("인증을 완료해주세요");
                  }
                  else{
                     alert("이미 존재하는 계정입니다.");
                  }
               })
               .fail(function(){
                  alert("통신 실패")
               })
         })
         }
         else{
            alert("수정할 값을 입력해주세요");
         }
      }
      
   })   
   
$('.currentPw').keyup(function (){
   const pwValue = $('.currentPw').val();
      $.ajax({
      url : "comparePw.do",
      method : "post",
      data :{
         m_pw : pwValue
      }
   })
   .done(function(data){
      if(data){
         spanTag.innerText = "비밀번호가 일치합니다."
         pwDiv.appendChild(spanTag);

      }
      else{
         spanTag.innerText = "비밀번호가 일치하지 않습니다.";
         pwDiv.appendChild(spanTag);
      }
   })
   .fail(function(){
      alert("통신 실패");
   })
})

})


function changePw(){
   let newPw = document.querySelector('.newPw');
   let confirmPw = document.querySelector('.confirmPw');
   
   if(isEmpty(newPw)){
      alert("비밀번호를 입력해주세요");
      return false;
   }
   else if(isEmpty(confirmPw)){
      alert("비밀번호 확인 창에 값이 없습니다.");
      return false;
   }
   else if(newPw.value != confirmPw.value){
      alert("비밀번호가 일치하지 않습니다.");
      return false;
   }
   return true;
}









function changePwGo() {
   let ok = confirm("비밀번호를 변경하시겠습니까?");
   if (ok) {
      location.href = "changePw.go"
      return true;
   }
   else {
      return false;
   }
}

