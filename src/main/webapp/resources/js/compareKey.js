   function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var m_phone = getParameterByName('m_phone');




$(document).ready(function(){
   
   $('.submitKey').click(function(){
   const inputKey = $('#inputKey').val();
   $.ajax({
      url : "/jk/common/compareKey",
      method : "post",
      data : {
         m_p_number : m_phone,
         m_p_id : inputKey
      },
      success : function(data){
         let data_result = data;
         if(data_result){
            alert("인증에 성공하였습니다.");
            $.ajax({
               url : "memberPage/reginPage.jsp",
               type : "get",
               datatype : "json",
               success : function(){
	
               }
            })
            window.close();
         }
         else{
            alert("인증 실패! 인증 번호를 다시 확인해주세요!");
         }
         
      }
   })
   .fail(function(){
      alert("ajax 실패");
   })
   
});
   
});
   
   
   
