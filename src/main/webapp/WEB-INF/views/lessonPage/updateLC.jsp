<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*별 css  */
/*별 css  */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.4rem;
	line-height: 1.0rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.7px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}
/*별 결과css */
.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

</style>

</head>
<body>
후기 수정
<form action="l_comment.update" method="get">
<div class="star-rating space-x-4 mx-auto">

				<input type="radio" id="5-stars" name="l_mark" value="5"
					v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>

				<input type="radio" id="4-stars" name="l_mark" value="4"
					v-model="ratings" /> <label for="4-stars" class="star">★</label> <input
					type="radio" id="3-stars" name="l_mark" value="3" v-model="ratings" />
				<label for="3-stars" class="star">★</label> <input type="radio"
					id="2-stars" name="l_mark" value="2" v-model="ratings" /> <label
					for="2-stars" class="star">★</label> <input type="radio"
					id="1-star" checked="checked" name="l_mark" value="1"
					v-model="ratings" /> <label for="1-star" class="star">★</label>

			</div>
<input type="hidden" name="l_c_pk" value="${param.l_c_pk }">
<input type="hidden" name="l_no" value="${param.l_no }">
<input type="hidden" name="m_id" value="${param.m_id }">
<input type="text" name="l_c_content"><button onclick="moveClose();">수정</button>

</form>


</body>
</html>