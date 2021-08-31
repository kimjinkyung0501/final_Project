$(function () {


 $('#option_B').click(function(){
		
	
	let option = $('#option').val();
	let seach_C = $('#seach_C').val();
	
	if(option=='searchWay'){
		
		
		alert('어떤 항목을 검색하실지 선택해주세요!');
		return false;
	};
	
	if(seach_C==''){
		
		
		alert('검색어를 넣어주세요');
		return false;
	};
	
	
});



$('.complainState_Start').click(function () {
	let state = $(this).next('#complainState_Start_I').val();
	
		alert("처리 시작");
		alert(state);
	const p = "?c_state=2&c_no=" +state;
		
	$.ajax({
	url:"admin.complainHandle" + p,
	method:"GET",
	error : function(error) {
        alert("Error!");
    },
    success : function(data) {
        alert("success!");
    },
    complete : function() {
    	  location.reload();
    }
	});
});


$('.complainState_Complite').click(function () {
	let state = $(this).next('#complainState_Complite_I').val();
	
		alert("처리 완료");
		alert(state);
	const p = "?c_state=3&c_no=" +state;
		
	$.ajax({
	url:"admin.complainHandle" + p,
	method:"GET",
	error : function(error) {
        alert("Error!");
    },
    success : function(data) {
        alert("success!");
    },
    complete : function() {
    	  location.reload();
    }
	});
});


$('.complainState_pending').click(function () {
	let state = $(this).next('#complainState_pending_I').val();
	
		alert("처리 완료");
		alert(state);
	const p = "?c_state=4&c_no=" +state;
		
	$.ajax({
	url:"admin.complainHandle" + p,
	method:"GET",
	error : function(error) {
        alert("Error!");
    },
    success : function(data) {
        alert("success!");
    },
    complete : function() {
    	  location.reload();
    }
	});
});




});
