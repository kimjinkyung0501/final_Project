$(function () {
   let friendFinal;// 
   let idChecked; 
   let me = $('#me').val();
   let now = new Date(); // 시간을 가져옴 

   /*
   1. 보낸사람들의 이름 받고 -> 그 이름을 선택 
   2. 그 이름을 누르면 입력창이 생성되게 만듬 
   
   * let idChecked;은 새로운 사람에게 메시를 보낼 때 그 사람있는 체크를 한 것의 여부를 확인 하기위한 변수 
   */  

   // 주고 받은 메시지를 받아 오는 함수
   $('.f_name').click(function (){
      
      $(this).children('.f_cnt').text('0');
               

      
      $("#aa").empty();
      $("#mainText").empty();
      $("#textDiv").empty();
      $("#sendBarDiv").empty();// 메시지를 보낸 사람을 이름  누를 때마다 새로운 입력창이 생성 되서 만듬 

      
      //let me = $('#me').val();// 바디에서 자신의 아이디 세센을 이용해 받아 옴 (sesseionid  값)
      let friend = $(this).children('.friend').val();
      friendFinal = friend;
   
      console.log(me + "================");
      console.log(friend +"!!!!!!!!!!!!!");
      
   $("#textDiv").append("<div>"+friend +"</div>");// 대화 상태 이름 넣는 메서드
   
      let params = "?msg_sender=" + me + "&msg_reciver=" + friend;
      console.log(params);
      $.ajax({
         url:  "message.text" + params,
         method:"GET",
         dataType:"json",
         success: function (data){
            
      $.each(data, function(i) {
         if (data[i].msg_sender == me) {
            console.log(data[i]);
            
            $("#textDiv").append("<div>"+" <hr> "+"</div>");
               
            
               $("#textDiv").append("<div class='sendinput'>"
               + data[i].msg_text + "</div>");
                  
               $("#textDiv").append("<div class='timeInputR'>"
               + data[i].hour + "시 " + data[i].min +'분'+ "</div>");

                  
               }else {
                  
               $("#textDiv").append("<div>"+"<hr>"+"</div>");

               $("#textDiv").append("<div class='reciveinput'>"
               +"보낸사람: " + data[i].msg_sender + "</div>");
               
               $("#textDiv").append("<div class='reciveinput'>"
               + data[i].msg_text + "</div>");
               
               $("#textDiv").append("<div class='timeInputL'>"
                + data[i].hour + "시 " + data[i].min +"분 "+ "</div>");
               
       


            
               }
         });

         }


   
      });   
      
      
               $("#sendBarDiv").append("<input id='sendBar' style='width: 80%;'>");
               $("#sendBarDiv").append("<input id='send_num' type='hidden' value='${sessionScope.num123 }'>");
               $("#sendBarDiv").append("<button class='sendButton' value='${sessionScope.num123 }'>전송</button>");

             
   
 // $("#textDiv").scrollTop($("#textDiv").height()); 
         //      $("#textDiv").scrollTop($("#textDiv")[0].scrollHeight);



                //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 





출처: https://appsnuri.tistory.com/411 [이야기앱 세상]
   
   // 메시지 보내는 함수 
   $('.sendButton').click(function() {

         let test = $("#send_num").val();
    
         let text_content = document.getElementById('sendBar').value;
      //   let me = document.getElementById('me').value; // 바디에서 자신의 아이디를 세션을 이용해 받아 옴
      
   $("#sendBar").empty();
               
         //      let friend = $('.f_name').children('.friend').val();// 클래스'.f_name'의 자식중 클래스 이름이 friend의 값을 가져옴  

         console.log("보내는 사람 : " + me);
         console.log("내용" + text_content);
         console.log("받는 사람  : " + friendFinal); // friendFinal 처음에 선택한 유저의 아이디 : 가장 위에 있음
         console.log("---------메시지보내기E----------");
         
         
         let params = "?msg_sender=" + me + "&msg_reciver=" + friendFinal + "&msg_text=" + text_content;
         $.ajax({
            url:"message.send" + params,
            method : "GET",
            dataType : "json",
            success: function(data){
               
            let i = test;
            

            if(now.getHours()>11){
               var time = "오후 "; }
            else{
               var time = "오전 ";}
            $.each(data, function(i) {

         
               $("#textDiv").append("<div>"+" <hr> "+"</div>");
               
               $("#textDiv").append("<div class=sendinput>"
               + text_content+ "</div>");
                  
               $("#textDiv").append("<div class='timeInputR'>"
               + time +  now.getHours() + "시 " +now.getMinutes()+"분 " + "</div>");
                  
            
         });
            
            }
         });
         
      });
         });   
      
         
// 새로운 사람에게 메시지 보내는 기능         
$('#newMessage').click(function(){
   
         $("#sendBarDiv").empty();// 메시지를 보낸 사람을 이름  누를 때마다 새로운 입력창이 생성 되서 만듬 
            $("#textDiv").empty();
         $("#sendBar").empty();
            
         $("#textDiv").append("<div><h5>New Message Mailing</h5></div>");
         $("#textDiv").append("<div id='newReciverDiv'>"+" <input name='newReciver' id='newReciver'><button class='newReciverCheck'>에게</button><br><span id='span'/></div>");
            newReciver.placeholder = "ID";
                span.innerText="보내시려는 id를 입력해주세요!";   

                 //새로운 사람에게 보낼 메시지의 id 입력 창의 값 
            var $newReciver = $('#textDiv').children('#newReciverDiv').children('#newReciver').val();
                // 새운 사람에게 보낼 id를 체크하는 버튼(이 사람에게 보내기) 
            var $newReciverBtn = $('#textDiv').children('#newReciverDiv').children('#newReciver').next();
            
            //확인하려는 메시지의 입
            $('#newReciverDiv').click(function(){
                 
                          $('#newReciver').keyup(function(){
   
                         let newReciver = $(this).val();
 
                         let span = document.getElementById('span');
                       let me = document.getElementById('me').value; // 바디에서 자신의 아이디를 세션을 이용해 받아 옴
         
            

                $.ajax({
            url:"message.reciverCheck?newReciver="+newReciver,
            method : "GET",
            dataType : "json",
            success: function(data){
               
               if(data== 1 ){ 
               span.innerText="일치하는 ID가 존재합니다";
                    idChecked = "yes";

               }else{span.innerText="일치하는 ID가 없습니다"   
                    idChecked = "no";
               }
               
            }
   
                  });
            });
         });
      //여기서 아이디가 존재 한다면 새로운 메시지를 보낼 수 있는 입력창이 생김
      $newReciverBtn.on('click',function(){


              if(idChecked == 'yes'){
               $("#newReciverDiv").append("<div>"+
                 " <input id='newMessageInput'style='width: 70%;'>" +
                 "<button id='newMessageBtn' >새로운 메시지 보내기</button> "+"</div>");
                     $(this).off('click');
                     }else if(idChecked == 'no'){
                      alert('존재하지 않는 id입니다!');
                     }else{alert('id를 먼저 체크해주세요')  }


               // 새로운 사람에게 메시지를 보내는 함수 
              $('#newMessageBtn').click(function(){
                // 새로운 메시지를 받는 사람의 이름 
               let newReciver = $('#newReciver').val();
                 // 새로운 메시지의 내용

               let newMessageContent = $('#newMessageInput').val();

               let me = $('#me').val();
                    let params = "?msg_sender=" + me + "&msg_reciver=" + newReciver + "&msg_text=" + newMessageContent;
                  $.ajax({
                  url:"message.send" + params,
                method : "GET",
                  dataType : "json",
                    success : function(data) {
                    alert("전송 성공!");
                     location.reload();
                    },
                 error : function(error) {
                   alert("전송 실패!");
 
                    }

                 });
 
                    });

                    });
      
      
      });
      $('#reportMessage').click(function(){
         
                  // 불편 신고 화면에서 메시지로 돌아가는 버튼         
            $("#textDiv").append("<div><button id='returnMessage'>메시지로 돌아가기</button></div>");
               
                $('#reportMessage').click(function(){
                  location.replace('message.go');
         
                  });
      
         location.replace('admin.complainReport.go');
         
      });
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      });
   