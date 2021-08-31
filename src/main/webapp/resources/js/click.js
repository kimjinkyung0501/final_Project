	$(function() {
		

			
		$("#cart").click(function () {
		       $("form").attr("action", "cart.go");
		});
		 
		$("#buy").click(function () {
			

		       $("form").attr("action", "order.go");
	});
			
		$("#cart2").click(function () {
		       $("form").attr("action", "cart.go");
		});
		 
		$("#buy2").click(function () {
			

		       $("form").attr("action", "l_order.go");
	

		});
		

	});