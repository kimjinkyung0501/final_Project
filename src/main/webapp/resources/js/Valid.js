
let checkIdValue = document.getElementsByClassName("checkId").value;


	


function loginCheck() {
	const m_id = document.getElementById("id_input").value;
	const m_pw = document.getElementById("pw_input").value;
	if (m_id == "" || m_pw == "") {
		alert("아이디 혹은 비밀번호를 입력해주세요");
		return false;
	}
	else {
		$.ajax({
			url : "login.do",
			method : "post",
			async : false,
			data : {m_id : m_id, m_pw : m_pw}
			})
			.done(function(data){
				if(data){
					location.href="/common/"
				}
				else{
					alert("아이디 혹은 비밀번호가 옳지 않습니다.");
					return false;
				}
			})
			.fail(function(){
				alert("아이디 혹은 비밀번호가 옳지 않습니다.");
			})
			}
}

function logout(){
	let ok = confirm("로그아웃 하시겠습니까?");
	if(ok){
		location.href="/common/logout.do";
	}
}



function reginValid() {
	const m_name = document.getElementById("m_name");
	const m_id = document.getElementById("m_id");
	const m_pw = document.getElementById("m_pw");
	const m_pw_compare = document.getElementById("m_pw_compare");
	const m_addr = document.getElementById("m_addr");
	const m_addr2 = document.getElementById("m_addr2");
	const m_phone = document.getElementById("m_phone");
	const email = document.getElementById("m_email");


	if (isEmpty(m_name)) {
		//값이 들어있으면 false를 반환해서 실행이 안됨
		//값이 없으면 true를 반환이 되어서 안에 함수가 실행이 됨
		alert("이름을 입력하여 주세요");
		return false;
	}
	else if (isEmpty(m_id)) {
		alert("ID를 입력하여 주세요");
		return false;
	}
	else if (isEmpty(m_pw)) {
		alert("PassWord를 입력하여 주세요");
		return false;
	}
	else if (m_pw.value != m_pw_compare.value) {
		alert("PassWord를 확인하여 주세요");
		return false;
	}
	else if(isEmpty(m_addr)||isEmpty(m_addr2)){
		alert("주소를 입력해주세요");
		return false;
	}
	else if(isEmpty(m_phone)){
		alert("번호를 입력해주세요");
		return false;
	}
	
	else if (notCorrectAddr(m_addr)) {
		alert("주소값에 허용되지 않은 문자열이 들어가 있습니다.");
		return false;
	}
	else if (notCorrectAddr(m_addr2)) {
		alert("주소값에 허용되지 않은 문자열이 들어가 있습니다.");
		return false;
	}
	else if (notCorrectPhoneNumber(m_phone)) {
		alert("핸드폰 번호에 '-' 와 공백을 제거해 주세요");
		return false;
	}

	else if (checkIdValue == "false" || checkIdValue == undefined) {
		alert("값이 비어있거나 중복체크를 해주세요");
		return false;
	}
/*	else if (check_info == "false" || check_info == undefined) {
		alert("휴대폰 인증을 실시해주세요");
		return false;
	}*/
	else if(isEmpty(email)){
		alert("이메일을 입력하여 주세요");
		return false;
	}
	return true;
}

//조잡하다 구현한 후 리팩토링 시급
$(document).ready(function() {
	//회원 가입 버튼을 클릭했을 때 입력한 핸드폰 번호가 인증되어진
	//상태일 경우 회원가입 가능하게
	$('.reginBtn').click(function() {
		var m_phone = $('#m_phone').val();
		if (reginValid()) {
			$.ajax({
				url: "/common/checkSuccessInfo.do",
				method: "get",
				data: {
					m_p_number: m_phone
				},
				success: function(data) {
					let successInfo = data;
					if (successInfo) {
						check_info = "true";
						alert("");
					}

				}
			})
				.fail(function() {
					alert("통신 실패");
				})
				
				
				
				
		}
		else{
			return false;
		}

	})
/*	$('.checkEmail').click(function (){
		let userId = $('#m_id').val();
		let userEmail = $('#m_email').val();
		alert(userId);
		alert(userEmail);
		
		let ok = confirm("이메일 인증 완료시 정상적인 이용이 가능합니다.");
		if (ok) {
		$.ajax({
			url: "/common/sendEmail.do",
			method: "get",
			data: {
			t_m_id: userId,
			t_m_email: userEmail
		},
			success: function() {
			alert("이메일 인증 완료");
}
	})
	.fail(function() {

			
			alert("이메일 전송 실패");
		})
	}		
		
	})*/
	

	//ID중복 검사 부분
	$('.checkId').click(function() {

		const m_id = $('#m_id').val();
		alert(m_id);
		if (m_id == "") {
			alert("ID를 입력하여주세요");
			//ID값이 비어있을 경우 ID입력하게
		}
		else {
			//ID값이 비어있지 않을 경우 중복 검사할 수 있게
			$.ajax({
				url: "/common/checkId.do",
				method: "post",
				data: {
					m_id: m_id
				},
				success: function(data) {
					let input_id = data;
					alert(input_id);
					if (input_id) {
						checkIdValue = "true";
						alert(checkIdValue);
						alert("사용할 수 있는 아이디입니다.")
					}
					else {
						checkIdValue = "false";
						alert(checkIdValue);
						alert("사용할 수 없는 아이디입니다.");
					}

				}
			})
				.fail(function() {
					alert("ajax 실패");
				})
		}
	});
})





