$(document).ready(function(){
	var jsonObject = new Object();
	jsonObject.data = {};
	var checkList = [];
	var priceArray = [];
	var checkValue;
	
	
	$('input[name="payRadio"]').change(function() {
	    $('input[name="payRadio"]').each(function() {
	        var value = $(this).val();
			var checked = $(this).prop('checked');
			if(checked){
				checkValue = value;
			}
	    });
});
	
	//수량이 변했을 때 해당 제품의 총 금액이 바뀜
	$('.quantidey').on("propertychange change keyup paste", function(){
		var quantidey = $(this);
		var price = quantidey.next();
		var sumPrice = price.next();
		var priceValue = quantidey.val()*price.val();
		sumPrice.val(priceValue);
		sumPrice.attr('value', priceValue);
		
		var listCheckbox = quantidey.parent().prev().children().children().next().children('.listCheckbox');
		$(listCheckbox).attr('value2', priceValue);
		$(listCheckbox).attr('value3', quantidey.val());
	})
	
	//체크 박스 선택 시 해당 제품의 정보들이 checkList 배열에 담김
	$('.listCheckbox').change(function(){
		var checkbox = $(this);
		var storeName = $(this).parent().prev().text();
		var productName = $(this).parent().parent().next().text();
		var productPhoto = $(this).attr('value4');
		var o_o_nop = $(this).attr('value5');
		var sumPrice = $(this).parent().parent().parent().next().children('.sumPrice').val();
		var quantideyBox = checkbox.parent().parent().parent().next().children('.quantidey');
		var defaultprice = Number(checkbox.attr('defaultValue'));
		var o_no = checkbox.attr('value1');
		var o_quantidey = Number(checkbox.attr('value3'));
		var sum = (defaultprice*o_quantidey);
		if(checkbox.is(":checked")){
			data = {
				s_name : storeName,
				p_price : sum,
				p_name : productName,
				p_photo : productPhoto,
				o_no : o_no,
				o_quantidey : o_quantidey,
				o_o_nop : o_o_nop
			}
			checkList.push(data);
			jsonObject.data = checkList;
			priceArray.push(Number(sumPrice));
			quantideyBox.attr('readonly', true);
		}
		else{
			checkList.pop();
			priceArray.pop();
			quantideyBox.attr('readonly', false);
		}
		var sum = 0;
		for(i=0;i<priceArray.length;i++){
			sum +=  priceArray[i];
		}
		/*console.log(jsonObject);*/
		$('#resultPrice').children().text(sum);
	})
	
	$('.allCheckBox').click(function(){
		var checked = $('.allCheckBox').is(":checked");
		//체크되면 true 체크 안되어 있으면 false가 담김
		if(checked){
			var inputValue = $('input:checkbox');
			inputValue.prop("checked",true);
			//모든 체크 박스들을 선택해서 담음
			var sumPrice = $('.sumPrice');
			
			$.each(inputValue, function(index, item){
				var value1 = $(item).attr('value1');
				var value2 = $(item).attr('defaultValue');
				var value3 = Number($(item).attr('value3'));
				var o_o_nop = $(item).attr('value5');
				var storeName = $(item).parent().prev().text();
				var productName = $(item).parent().parent().next().text();
				var productPhoto = $(item).attr('value4');
				var sum = Number(value2)*Number(value3);
				
				$(value2).attr('value2', sum);
				console.log(value2)
				
					temp = {
						s_name : storeName,
						p_price : sum,
						p_name : productName,
						p_photo : productPhoto,
						o_quantidey : value3,
						o_no : value1,
						o_o_nop : o_o_nop
												
					}
					checkList.push(temp);
					priceArray.push(sum)
				})
				checkList.shift();
				console.log(checkList);
				priceArray.shift();
				jsonObject.data = checkList;
				
				$('.quantidey').attr('readonly', true);
				var sum = 0;
				for(i=0; i<priceArray.length;i++){
					sum += priceArray[i];
				}
				$('#resultPrice').children().text(sum);

			}
		else {
			var inputValue = $('input:checkbox');
			inputValue.prop('checked',false);
			checkList = [];
			priceArray = [];
			jsonObject.data = {};
			$('#resultPrice').children().empty();
			$('.quantidey').attr('readonly', false);
			console.log(jsonObject);
		}
		
		
		console.log(jsonObject);
	})
	
	
	$('.btn').on("click",function(){
		if(checkValue=="kakao"){
			var o = confirm("카카오 페이 결제를 하시겠습니까?");
			if(o){
				var submitData = JSON.stringify(jsonObject);
				var m_name = $('#m_name').val();
				var roadFullAddr = $('#roadFullAddr').val();
				var addrDetail = $('#addrDetail').val();
				var zipNo = $('#zipNo').val();
				var ss = $('#ss').text();
				
				$.ajax({
						url : "submitOrder.do",
						method : "POST",
						data : {
							checkList : submitData,
							m_name : m_name,
							roadFullAddr : roadFullAddr,
							addrDetail : addrDetail,
							zipNo : zipNo
						},
						traditional : true
					})
						.done(function(data){
						if(data){
							location.href="/jk/order.do2?name="+m_name+"&price="+ss;
						}
						else{
							alert("Model에서 문제가 생겼어");
						}
					})
				
						}
		}
		else{
			let o = confirm("주문을 확정하시겠습니까??");
			if(o){
			if(checkList.length==0){
				alert("제품을 선택해주세요");
			}
			else{
				var submitData = JSON.stringify(jsonObject);
				var m_name = $('#m_name').val();
				var roadFullAddr = $('#roadFullAddr').val();
				var addrDetail = $('#addrDetail').val();
				var zipNo = $('#zipNo').val();
					console.log(checkValue);
				if((m_name=="")||(roadFullAddr=="")||(addrDetail=="")||(checkValue==undefined)){
					alert("입력되지 않은 값이 있습니다.");
					return false;
				}
				else{
					$.ajax({
						url : "submitOrder.do",
						method : "POST",
						data : {
							checkList : submitData,
							m_name : m_name,
							roadFullAddr : roadFullAddr,
							addrDetail : addrDetail,
							zipNo : zipNo
						},
						traditional : true
					})
					.done(function(data){
						if(data){
							alert("구매가 완료되었습니다.");
							location.href="/jk/common/toOrderPage.go"
						}
						else{
							alert("Model에서 문제가 생겼어");
						}
					})
					.fail(function(){
						alert("로그인을 해주세요");
						location.href="/jk/common/login.main"
					})					
				}
			}			
		}
		else{
			return false;
		}			
		}
		
	})
	




			
})




