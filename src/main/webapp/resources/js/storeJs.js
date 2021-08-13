function prodcutDel(n){
	let ok = confirm('삭제하시겠습니까?');
	
	if(ok){
		location.href = 'product.delete?p_no=' +n;
	}
	
}
function deleteStore(n,i){
	let ok = confirm('폐점하시겠습니까?');
	
	if(ok){
		location.href = 'store.delete?s_no=' +n+'&m_id='+i;
	}
	
}
function lessonDel(n){
	let ok = confirm('삭제하시겠습니까?');
	
	if(ok){
		location.href = 'lesson.delete?l_no=' +n;
	}
	
}
function updatelesson(n){
	let ok = confirm('수정하시겠습니까?');
	
	if(ok){
		return true;
		}
	
}
function updateComent(num, n){
	let ok = confirm('수정하시겠습니까?');
	
	if(ok){
		location.href = "CommentUpdateController?num="+num + "&no="+n;
	}
	
}