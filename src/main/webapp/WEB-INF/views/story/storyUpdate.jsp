<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body{
    margin: 15px;
}
.text-box {
   position: absolute;
   left: 200px;
   top: 150px;
width: 80%;
}


#imageCanvas{
    position: absolute;
    left: 0;
    top: 0;
    pointer-events:none;
}

#img_id{
    position: absolute;
    left: 0;
    top: 0;
}

.post_form_container{
    max-width: 550px;
    margin: 0 auto;
}


.post_form{
    padding: 40px;
    background-color: #fff;
    border: 1px solid #e6e6e6;
    margin: 0 0 10px;
}

.post_form .title{
    margin: 0 10px 40px;
    font-weight: 400;
    font-size: 30px;
    text-align: center;
}


.post_form .preview{
    margin-bottom: 30px;
}

.post_form .preview .upload{
    max-width: 300px;
    height: 300px;
    border: 1px solid #e6e6e6;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}

.plus_icon{
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin: 0 auto 10px;
    border: 1px solid darkgray;
    display: flex;
    justify-content: center;
    align-items: center;
}


.plus_icon span{
    position: absolute;
    display: block;
    width: 2px;
    height: 30px;
    background: darkgray;

}

.plus_icon span:nth-child(2){
    transform:rotate(90deg);
}

.post_form p{
    margin-bottom: 20px;
}

.post_form input[type=file]{
    width: 100%;
    background: 0 0;
    border: 1px solid #efefef;
    border-radius: 3px;
    box-sizing: border-box;
    color: #262626;
    font-size: 14px;
    padding: 7px 8px 7px;
}


.post_form textarea{
    width: 100%;
    background: 0 0;
    border: 1px solid #efefef;
    border-radius: 3px;
    box-sizing: border-box;
    color: #262626;
    font-size: 14px;
    padding: 7px 8px 7px;
}



.submit_btn {
    background: darkgray;
    border-color: darkgray;
    color: #fff;
    border-radius: 3px;
    border-style: solid;
    border-width: 1px;
    font-size: 14px;
    font-weight: 600;
    line-height: 28px;
    outline: none;
    width: 100%;
    padding: 0;
    margin-top: 10px;
}


</style>
</head>
<body>



    <div id="main_container">

        <div class="post_form_container">
            <form action="${pageContext.request.contextPath}/story/story.update.do" method="Post"enctype="multipart/form-data" class="post_form">
                <div class="title">
                </div>
                <div class="preview">
                    <div class="upload">
                        <div class="post_btn">
                            <div class="plus_icon">
                                <span></span>
                                <span></span>
                            </div>
                            <canvas id="imageCanvas"></canvas>
                            <!--<p><img id="img_id" src="#" style="width: 300px; height: 300px; object-fit: cover" alt="thumbnail"></p>-->
                        </div>
                    </div>
                </div>
                <p>
                    <input type="file" name="s_photo" id="id_photo" required="required" value="${st.s_photo }">
                </p>
<p>
<input name="s_no" type="hidden" value="${st.s_no }">
<input name="s_title" value="${st.s_title }">
<input type="hidden" name="s_id" value="${sessionScope.member_session.m_id}"> 
<p>
                <p>
                    <textarea name="s_content" id="text_field" cols="50" rows="5">${st.s_content }</textarea>

                </p>
                 <button class="submit_btn">수정</button>
            </form>

        </div>

    </div>
    
    
    

<script src="js/insta.js"></script>

<script>
       var fileInput  = document.querySelector( "#id_photo" ),
           button     = document.querySelector( ".input-file-trigger" ),
           the_return = document.querySelector(".file-return");

       // Show image
       fileInput.addEventListener('change', handleImage, false);
       var canvas = document.getElementById('imageCanvas');
       var ctx = canvas.getContext('2d');


        function handleImage(e){
           var reader = new FileReader();
           reader.onload = function(event){
               var img = new Image();
               // var imgWidth =
               img.onload = function(){
                   canvas.width = 300;
                   canvas.height = 300;
                   ctx.drawImage(img,0,0,300,300);
               };
               img.src = event.target.result;
               // img.width = img.width*0.5
               // canvas.height = img.height;
           };
           reader.readAsDataURL(e.target.files[0]);
       }


</script>
</body>
</html>