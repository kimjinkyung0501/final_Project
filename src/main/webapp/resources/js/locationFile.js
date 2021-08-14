/*특별한 기능 없이 페이지 이동하는 것들 모아둔 파일*/
let myPage = document.getElementById("myPage");

let sideMenu1 = document.getElementById("sideMenu1");
let sideMenu2 = document.getElementById("sideMenu2");
let sideMenu3 = document.getElementById("sideMenu3");

function toOrderPage(){
	location.href="/jk/common/toOrderPage.go"
}

function toCart(){
	location.href="/jk/common/toCart.go"
}

function changeInfo(){
	location.href="/jk/common/changeInfo.go"
}

function goSimplePage(){
	location.href="/jk/common/myPage.go"
}

function goMyPage(nomalMember, kakaoMember){
	
	if(nomalMember != "" && kakaoMember == ""){
		location.href="/jk/common/myPage.go"
		return true;
	}
	else {
		alert("카카오톡 로그인 시 일부 서비스가 제한됩니다.");
		location.href="/jk/common/myPage.go"
		return true;
	}
}


	
myPage.addEventListener("click", goSimplePage)
sideMenu1.addEventListener("click", toOrderPage);
sideMenu2.addEventListener("click", toCart);
sideMenu3.addEventListener("click", changeInfo);