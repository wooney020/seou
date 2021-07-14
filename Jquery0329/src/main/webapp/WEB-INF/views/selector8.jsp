<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[처음과 마지막 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){

	//first , last
$("#menu li:first")
.css({
      "background-color":"#ff0"
   });

$("#menu li:last")
.css({
      "background-color":"#0ff"
   });

//홀수 짝수 선택자
$("#menu li:even")
.css({
      "background-color":"#ff0"
   });

$("#menu li:odd")
.css({
      "background-color":"#0ff"
   });


//eq선택
$("#menu2 li").eq(1) // 메소드를 이용한 위치탐색선택
	.css({
		"background-color" : "#ff0"
	
		});

$("#menu2 li:eq(3)") // 필터선택을 이용한 위치탐색선택
.css({
	"background-color" : "#0ff"

	});

});
</script>

</head>
<body>

<h1>[처음과 마지막 선택자]</h1>

<h1>탐색 선택자</h1>
<ul id = "menu">
	<li>내용1</li>
	<li>내용2</li>
	<li>내용3</li>
	<li>내용4</li>
	
</ul>

<ul id = "menu2">
	<li>내용5</li>
	<li>내용6</li>
	<li>내용7</li>
	<li>내용8</li>
	<li>내용9</li>
	<li>내용10</li>


</ul>


</body>
</html>