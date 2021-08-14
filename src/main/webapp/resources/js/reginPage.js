let check_info = document.getElementById("check_info").value;
var emailCheckValue = document.getElementById("emailCheckValue").value;
let checkIdValue = document.getElementById("checkIdValue").value;
   
   
function reginValid() {
   const m_name = document.getElementById("m_name");
   const m_id = document.getElementById("m_id");
   const m_pw = document.getElementById("m_pw");
   const m_pw_compare = document.getElementById("m_pw_compare");
   const m_phone = document.getElementById("m_phone");
   const m_email = document.getElementById("m_email");


   if (isEmpty(m_name)) {
      //값이 들어있으면 false를 반환해서 실행이 안됨
      //값이 없으면 true를 반환이 되어서 안에 함수가 실행이 됨
      alert("이름을 입력하여 주세요");
      return false;
   }

   else if (isEmpty(m_id)) {
      alert("ID를 입력하여 주세요");
      return false;
   }
   else if (isEmpty(m_pw)) {
      alert("PassWord를 입력하여 주세요");
      return false;
   }
   else if(isEmpty(m_phone)){
      alert("번호를 입력해주세요");
      return false;
   }

   else if (m_pw.value != m_pw_compare.value) {
      alert("PassWord를 확인하여 주세요");
      return false;
   }
     else if(isEmpty(m_email)){
      alert("이메일을 입력하여 주세요");
      return false;
   }

     else if (checkIdValue == "false") {
      alert("값이 비어있거나 중복체크를 해주세요");
      return false;
   }

   else if(emailCheckValue == "false"){
      alert("이메일 인증을 완료해주세요");
      return false;
   }
/*   else if (check_info == "false") {
      alert("휴대폰 인증을 실시해주세요");
      return false;
   }*/


   else if (notCorrectPhoneNumber(m_phone)) {
      alert("핸드폰 번호에 '-' 와 공백을 제거해 주세요");
      return false;
   }
   //이메일 인증 안할 시 안 넘어가게
   //일단은 막아둘께
   return true;
}

//조잡하다 구현한 후 리팩토링 시급
$(document).ready(function() {
   //회원 가입 버튼을 클릭했을 때 입력한 핸드폰 번호가 인증되어진
   //상태일 경우 회원가입 가능하게
   $('.reginBtn').on("click", function(e){
      e.preventDefault();
      if(reginValid()){
      var m_id = $('#m_id').val();
      var m_phone = $('#m_phone').val();
      alert(m_id);
      alert(m_phone);
      $.ajax({
         url : "checkSuccessInfo.do",
         type : "post",
         data :{
            m_id : m_id,
            m_phone : m_phone
         },       
           success: function (data) { 
         if(data){
            $('#reginForm').submit();
         }
         else{
            alert("이메일 인증을 완료해주세요");            
         }
        },          
           error: function (e) {  
           console.log("ERROR : ", e);     
         }     
   });         
      }
      else{
         alert("인증되지 않는 항목이 있습니다.");
         return false;
      }
      

      })
      
      
      
      
      
      
   



   $('.checkEmail').click(function (){
      let userId = $('#m_id').val();
      let userEmail = $('#m_email').val();
      let ok = confirm("이메일 인증 완료시 정상적인 이용이 가능합니다.");
      if (ok) {
      $.ajax({
         url: "sendEmail.do",
         method: "get",
         data: {
         t_m_id: userId,
         t_m_email: userEmail
         },
         success: function(data) {
         //data가 boolean타입으로 리턴됨
         if(data){
            //메일이 정상적으로 보내졌을 경우 뜨는 알람
         alert(emailCheckValue);
         emailCheckValue = "true";
            alert("이메일을 확인해 주세요");
         }
         else{
            //false로 리턴되었을 때 뜨는 알람
         emailCheckValue = "false";
            alert("이미 사용중인 이메일 입니다.");
         
         }
      }
         })
         .fail(function() {
         alert("이메일 전송 실패");
         })
      }
   else{
      return false;
      }      
      
   })
   

   //ID중복 검사 부분
   $('#checkId').click(function() {
      const m_id = $('#m_id').val();
      if (m_id == "") {
         alert("ID를 입력하여주세요");
         //ID값이 비어있을 경우 ID입력하게
      }
      else {
         //ID값이 비어있지 않을 경우 중복 검사할 수 있게
         $.ajax({
            url: "checkId.do",
            method: "post",
            data: {
               m_id: m_id
            },
            success: function(data) {
               let input_id = data;
               if (input_id) {
                  checkIdValue = "true";
                  alert("사용할 수 있는 아이디입니다.")
               }
               else {
                  checkIdValue = "false";
                  alert("사용할 수 없는 아이디입니다.");
               }

            }
         })
            .fail(function() {
               alert("ajax 실패");
            })
      }
   })


});



   

/*도로명 주소 검색 부분*/
function goPopup(){
   var pop = window.open("/jk/common/jusoPopup.open","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
};

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                  , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
   // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
   
   document.form.roadFullAddr.value = roadFullAddr;
   document.form.addrDetail.value = addrDetail;
   document.form.zipNo.value = zipNo;
}

/*주소지 등록 form태그 작동시키는 기능*/
function regAddr(){
   var ok = confirm("주소지를 등록하시겠습니까?");
   if(ok){
      $(document).ready(function(){
         $('#form').submit();
      })
   }
}