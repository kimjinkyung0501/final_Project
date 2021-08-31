function searchAll(keyword){
   location.href = "/jk/search.all?search=" + keyword;
}

function searchClass(keyword){
   location.href="/jk/searchClass.do?keyword=" + keyword;
   
}



function searchProduct(keyword){
   location.href="/jk/searchProduct.do?keyword=" + keyword;
   
}

function searchStore(keyword){
   location.href="/jk/searchStore.do?keyword=" + keyword;
   
}

	/*$(document).ready(function(){
		$('.repeat_area').on("click", function(){
			var no = $(this).children('.no');
			console.log(no)
			
		})	
		
	})*/
	
	
	
	
