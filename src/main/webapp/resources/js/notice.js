function goDelNotice(n){
   let ok = confirm('삭제하시겠습니까?')
   if(ok){
      location.href="/jk/notice/notice.del?n_no=" + n;
   }
}

function goUpdateNotice(n){
   let ok = confirm('수정하시겠습니까?')
   if(ok){
      location.href="/jk/notice/goUpdateNotice?n_no=" + n;
   }
}

function goDelStory(n){
   let ok = confirm('삭제하시겠습니까?')
   if(ok){
      location.href="/jk/story/story.del?s_no=" + n;
   }
}

function goUpdateStory(n){
   let ok = confirm('수정하시겠습니까?')
   if(ok){
      location.href="/jk/story/goUpdateStory?s_no=" + n;
   }
}

function goSearch(){
   let a = document.getElementById("search").value;
   if(a != null){
      location.href = "/jk/story/story.search?search=" + a;
   } else{
      alert("검색어를 입력해주세요.")
   }
   
}

function storyPageChange(page){
   location.href= "/jk/story/story.page.change?p=" + page;
}

function goDelStoryReply(sr_pk, s_no){
   let ok = confirm('삭제하시겠습니까?')
   if(ok){
      location.href="/jk/story/storyReply.del?sr_pk=" + sr_pk + "&s_no="+s_no;
   }
}

function goUpdateStoryReplyGo(sr_pk, s_no){
   let ok = confirm('수정하시겠습니까?')
   if(ok){
      location.href="/jk/story/storyReply.update.go?sr_pk=" + sr_pk + "&s_no="+s_no;
   }
}
