
function kakaoLogin(){
	let apiKey = "97e12e516bb866800a64e5676c4184c1";
	//let redirectUrl = "/jk/common/kakao.login";
	let redirectUrl = "http://localhost:80/jk/common/kakao.login";
	
	location.href="https://kauth.kakao.com/oauth/authorize?client_id=" + apiKey + "&redirect_uri=" + redirectUrl +"&response_type=code"
	
	
}

function kakaoLogout(){
	let apikey = "97e12e516bb866800a64e5676c4184c1";
	let redirectUrl = "http://localhost:80/jk/common/kakao.logout"	
	
	location.href="https://kauth.kakao.com/oauth/logout?client_id="+ apikey + "&logout_redirect_uri=" + redirectUrl;
	
}


