$(function() {
   
   let lm_id = $('.likeBtn').attr('value2');
    console.log(lm_id)
    
     $.ajax({
       url : "/jk/story/like.check",
       method : "GET",
       data : {
          lm_id : lm_id
       }
    })
    .done(function(data){
       let temp;
       
     
       
       
       $(".likeBtn").each(function(i,b){
       var likeBtn = $(this);
        temp = b;
        let val = $(temp).attr('value1');   // 모든 게시글 넘버
        console.log(val);
          
        $.each(data, function(j, b) {
        let getData = data[j].ls_no;
        console.log(data[j].ls_no);
        
        if(getData == val) {
           $(likeBtn).attr('src', 'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678087-heart-512.png');
        } else{
        }
        
       });
          
          });   
        
    })  
    
    .fail(function(){
       likeBtn.attr('src', 'https://static.thenounproject.com/png/25848-200.png');
       alert('실패');
    });
   
    $('.likeBtn').on("click", function(){
       var likeBtn = $(this);
         
         var ls_no = likeBtn.attr('value1');
         var lm_id = likeBtn.attr('value2');
         //console.log(ls_no);
        // console.log(lm_id);
         
         
         $.ajax({
            url : "/jk/story/like.reg",
            method : "GET",
            data : {
               ls_no : ls_no,
               lm_id : lm_id
            }
         })
         .done(function(data){
            if(data){
               var $likeCount = likeBtn.parent().parent().next().children('.count');
               var likeN = Number($likeCount.text());
               var likeW = likeN + 1;
               $likeCount.text(likeW);
               likeBtn.attr('src', 'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678087-heart-512.png');
            }
            else{
               let ok = confirm('좋아요를 취소하시겠습니까?')
               if(ok){
                  $.ajax({
                     url : "/jk/story/like.del",
                     method : "GET",
                     data : {
                        ls_no : ls_no,
                        lm_id : lm_id
                     }
                  })
               
               var $likeCount = likeBtn.parent().parent().next().children('.count');
               var likeN = Number($likeCount.text());
               var likeW = likeN - 1;
               $likeCount.text(likeW);
               likeBtn.attr('src', 'https://static.thenounproject.com/png/25848-200.png');
            }
            }
         })  

         .fail(function(){
            location.href="/jk/common/login.main";
         })   
   
        
   });
   
});