<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[객체조작 - prop()]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){

	var result_1 = $("#chk1").prop("checked"); //체크가 되었는지 아닌지 조사( boolean타입으로 나옴)
	console.log(result_1);

	var result_2 = $("#chk2").prop("checked"); //체크가 되어있는 속성
	console.log(result_2);

	var result_2 = $("#chk3").prop("checked" , true); //이 아이디를 가진 태그를 체크해주어라.
	var result_3 = $("#se_1").prop("selectedIndex"); //셀렉된 인덱스를 출력해줌.
	console.log(result_3);




	
});





</script>
</head>
<body>

<h1>
	<strong>객체 조작 및 생성</strong>
</h1>
<form action = "#" id ="form_1">
	<p>
		<input type = "checkbox" name = "chk1" id = "chk1">
		<label for = "chk1">chk1</label>
		<input type = "checkbox" name = "chk2" id = "chk2" checked = "checked">
		<label for = "chk2">chk2</label>
		<input type = "checkbox" name = "chk3" id = "chk3">
		<label for = "chk3">chk3</label>
	</p>
	<p>
		<select name = "se_1" id = "se_1">
			<option value="opt1">option1</option>
			<option value="opt2">option2</option>
			<option value="opt3" selected = "selected">option3</option>
		</select>
	</p>
</form>
</body>
</html>