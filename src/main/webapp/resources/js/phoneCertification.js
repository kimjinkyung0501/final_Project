

function phoneCer(){
	$(document).ready(function(){
	
	$('.phoneCheck').click(function(){
		const m_phone = $('#m_phone').val();
		alert(m_phone);
	$.ajax({
		url : "/common/sendSNS",
		method : "post",
		data : {
			userPhoneNumber : m_phone
		},
		success : function(){
			alert("성공");
			window.open("/common/checkPhoneKey.go?m_phone="+m_phone,"휴대폰 인증창", "width=400, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		}
	})
	.fail(function(){
		alert("ajax 실패");
	})
	
});
	
})
	
	
	
}
