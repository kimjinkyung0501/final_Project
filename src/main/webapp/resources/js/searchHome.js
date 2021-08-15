$(document).on('click', '#btnSearch', function(){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/search.all";


		url = url + "?keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});	



