<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[클래스 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
	$(".item").css("color","orange");
	$("h1.item").css("background","red");//h1태그중 클래스 이름이 item인것
	$(".item.select").css("border","5px solid #0f0");//클래스 이름이 item이면서 select도 가진 것
});	


</script>
</head>
<body>
	<h1>[클래스 선택자]</h1>
	
	<h1 class = "item">Header-0</h1>
	<h1 class = "item select">Header-1</h1>
	<h2 class = "item">Header-2</h2>
	
</body>
</html>