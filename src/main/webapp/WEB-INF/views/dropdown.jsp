<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	//menu v1 
	$(".menu-v1").mouseover(function(){
		$(this).children(".submenu").stop().slideDown();
	});
	$(".menu-v1").mouseleave(function(){
		$(this).children(".submenu").stop().slideUp();
	});
	
});


</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style: none;
	box-sizing: border-box;
	font-family: 'PT Serif', serif;
}
/* 
a {
	text-decoration: none;
	color: inherit;
}
 */
.clear {
	clear: both;
}

#container {
	width: 1000px;
	
} /*v1*/
#nav-v1 {
	width: 150px;
	text-align: center;
}

.menu-v1 {
	line-height: 2;
}

.menu-v1:hover {
}

.menu-v1:hover>a {
	color: black;
	font-weight: bold;
}

.menu-v1 .submenu {
	margin-top: 7px;
	background-color: #fff;
	display: none;
	font-size: 7px;
}

.menu-v1 .submenu li:hover {
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>

	<h1>Dropdown menu test</h1>
	<div id="container">
		<br>
		<ul id="nav-v1">
			<li class="menu-v1"><a href="#">menu-1</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul></li>
			<li class="menu-v1"><a href="#">menu-2</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul></li>
			<li class="menu-v1"><a href="#">menu-3</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul></li>
			<li class="menu-v1"><a href="#">menu-4</a>
				<ul class="submenu">
					<li><a href="#">SubMenu 1</a></li>
					<li><a href="#">SubMenu 2</a></li>
					<li><a href="#">SubMenu 3</a></li>
					<li><a href="#">SubMenu 4</a></li>
				</ul></li>
		</ul>
		<div class="clear"></div>
		</div>
</body>
</html>