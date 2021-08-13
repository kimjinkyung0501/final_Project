<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="product.update.do" method="Post" enctype="multipart/form-data">
<table>
<tr>
<td>이름:</td><td><input name="p_name" value="${p.p_name}"><input type="hidden" name="p_no" value="${p.p_no }"></td>
</tr>
<tr>
<td>재고량:</td><td><input type="number" name="p_stock" value="${p.p_stock }"></td>
</tr>
<tr>
<td>제품 가격:</td><td><input name="p_price"type="number" value="${p.p_price }"></td>
</tr>
<tr>
<td>제품 설명:</td><td><textarea rows="10" cols="30" name="p_content" placeholder="1000자이내로 적어주세요">${p.p_content }</textarea><input type="hidden" name="p_rn" value="${param.p_rn }"> </td>
</tr>
<tr>
<td>제품 분류:</td>
<td>
<select name="p_label">
<option value="식품">식품</option>
<option value="악세사리">악세사리</option>
<option value="의류">의류</option>
<option value="전자기기">전자기기</option>
<option value="주방">주방</option>
<option value="잡화">잡화</option>
<option value="인테리어">인테리어</option>
<option value="육아">육아</option>
<option value="기타">기타</option>
</select> 
</td>
</tr>
<tr>
<td>사진:</td><td><input type="file" name="p_photo1"><input type="hidden"name="p_photo1_old"value="${p_photo1 }"></td>
</tr>
<tr>
<td>사진2(필수아님):</td><td><input type="file" name="p_photo2"><input type="hidden"name="p_photo2_old"value="${p_photo2 }"></td>
</tr>
<tr>
<td>사진3(필수아님):</td><td><input type="file" name="p_photo3"><input type="hidden"name="p_photo3_old"value="${p_photo3 }"></td>
</tr>
<tr>
<td colspan="2" align="center"><button>수정하기</button> </td>
</tr>
</table>
</form>
</body>
</html>