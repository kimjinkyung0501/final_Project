/*특별한 기능 없이 페이지 이동하는 것들 모아둔 파일*/
let myPage = document.getElementById("myPage");

let sideMenu1 = document.getElementById("sideMenu1");
let sideMenu2 = document.getElementById("sideMenu2");
let sideMenu3 = document.getElementById("sideMenu3");

function toOrderPage(){
	location.href="/common/toOrderPage.go"
}

function toCart(){
	location.href="/common/toCart.go"
}

function changeInfo(){
	location.href="/common/changeInfo.go"
}

function goSimplePage(){
	location.href="/common/myPage.go"
}

function goMyPage(session_id){
	if(session_id == "" || session_id == undefined){
		alert("로그인을 먼저 해주세요");
		return false;
	}
	else{
		location.href="/common/myPage.go"
		return true;
	}
}

	
myPage.addEventListener("click", goSimplePage)
sideMenu1.addEventListener("click", toOrderPage);
sideMenu2.addEventListener("click", toCart);
sideMenu3.addEventListener("click", changeInfo);