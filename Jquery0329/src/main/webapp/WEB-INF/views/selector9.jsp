<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[selected, checked]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	var selectedValue = $("#zone1 :selected").val();
	console.log(selectedValue);

	var checkedValue = $("#zone2 :checked").val();
	console.log(checkedValue);

	setTimeout(function(){
		var value = $("#zone1 :selected").val();
		alert(value);
		},5000); // 5초뒤 함수 실행



});

</script>
</head>
<body>
	<h1>[selected, checked]</h1>

	<p id = "zone1">
		<select>
			<option value = "aaa">옵션1</option>
			<option value = "bbb" selected = "selected">옵션2</option>
			<option value = "ccc">옵션3</option>
		</select>
	</p>
	<p id = "zone2">
		<input type ="radio" name = "gender" value = "female" checked = "checked">여성
		<input type ="radio" name = "gender" value = "male">남성
	</p>
</body>
</html>