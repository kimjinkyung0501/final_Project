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