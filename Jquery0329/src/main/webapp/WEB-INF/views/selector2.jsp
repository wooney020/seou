<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[아이디 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#tit").css("background-color","#ff0")
				 .css("border","2px solid #f00")
		}); //메소드 체이닝 기법

	$(function(){
		$("#tit").css({"background-color":"#ff0"
				 ,"border":"2px solid #f00"})
		}); // 이렇게도 가능
	
	
</script>
<style type="text/css">
	#tit{
		background - color : "#cccccc";
		border-radius : 5px;
		
	}

</style>


</head>
<body>
	<h1>제이쿼리</h1>
	<h2 id = "tit">선택자</h2>
	<h3>직접 선택자</h3>
</body>
</html>