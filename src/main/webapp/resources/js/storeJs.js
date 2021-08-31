


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

function deleteComment(n,i){
	let ok = confirm('삭제하시겠습니까?');
	
	if(ok){
		location.href = 'p_comment.delete?p_c_pk=' +n+'&p_no='+i;
	}
	
}
function deleteComment2(n,i){
	let ok = confirm('삭제하시겠습니까?');
	
	if(ok){
		location.href = 'l_comment.delete?l_c_pk=' +n+'&l_no='+i;
	}
	
}

function updatePC(pk,no,id){
let ok = confirm('후기를 수정하시겠습니까?');

if(ok){
	url="updatePC?p_c_pk="+pk+'&p_no='+no+'&m_id='+id;
	window.open(url,"pop","width =400, height=250");
}	
	
}
function updateLC(pk,no,id){
let ok = confirm('후기를 수정하시겠습니까?');

if(ok){
	url="updateLC?l_c_pk="+pk+'&l_no='+no+'&m_id='+id;
	window.open(url,"pop","width =400, height=250");
}	
	
}




let p_price;
let p2_p_quantidey;


function init() {
	p_price = document.productForm.p_price.value;
	p2_p_quantidey = document.productForm.p2_p_quantidey.value;
	document.productForm.p2_sumPrice.value = p_price ;
	change();
}
function add () {
	
	hm = document.productForm.p2_p_quantidey;
	oprice = document.productForm.p2_sumPrice;
	
if(hm.value){
	hm.value ++ ;
		}
else{
	hm.value=0;
}		


	oprice.value = parseInt(hm.value) * p_price;
}

function del () {
	hm = document.productForm.p2_p_quantidey;
	oprice = document.productForm.p2_sumPrice;
		if (hm.value > 1) {
			hm.value -- ;
			oprice.value = parseInt(hm.value) * p_price;
		}
}





function change () {
	hm = document.productForm.p2_p_quantidey;
	oprice  = document.productForm.p2_sumPrice;
		if (hm.value < 0) {
			hm.value = 0;
		}
	oprice.value = parseInt(hm.value) * p_price;
}  


function logIn(id) {
	if (id == null) {
		alert('먼저 로그인을 해주세요');
		return false;
	} 
		return true;

}
function stockCheck(stock,amount) {
	if (stock < amount) {
		alert('재고가 부족합니다');
		return false;
	} 
		return true;

}

	
