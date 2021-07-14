<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[반복문 - each]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){

	var obj = [
		{
			"area":"서울"//속성 : 값 , 자바의 객체 안의 멤버변수로 생각하면 편함.
		} 
		,{"area":"부산"} 
		,{"area":"전주"}

	]; //[]배열 {}객체 
	

	$(obj).each(function(i,o){ //자바스크립트의 배열도 each 사용가능

		console.log(i+":", o); //i 는 index o는 객체
		console.log(i+":", this); //this도 자바스크립트 객체상태. 
		//자바스크립트의 객채 형태기 떄문에 선택자를 쓰지 않아도 되서 바로 this

		}); //자바스크립트의 변수를 제이쿼리로 선택. 

	console.log("======The End1 ======");

	$.each($("#menu2 li"),function(i,o){ //요소를 선택

		console.log(i+":", o); //o는 객체가 아닌 태그임. 자바스크립트의 메소드 사용불가.
		$(o).css("background-color","#f00"); //선택해서 나온 값을 다시 선택해서 제이쿼리문법 사용가능 상태.
		});
	
	console.log("======The End2 ======");

	$.each($("#menu2 li"),function(i){
		
		console.log(i+":", $(this)); //현재의 객체를 선택하겠다. 제이쿼리 문법 사용가능 상태
		console.log(i+":", this);
		}); //수정

	// $("h2").addClass("high-light"); // h2태그에 전부 클래스 이름을 줌.

	$("h2").each(function(index,item){
			$(this).addClass("high-light-"+index); //this 혹은 item. 효과는 동일.

		});
	


	
});

</script>
<style type="text/css">

.high-light-0{
	background : yellow;
}
.high-light-1{
	background : orange;
}
.high-light-2{
	background : blue;
}
.high-light-3{
	background : green;
}
.high-light-4{
	background : purple;
}

</style>
</head>
<body>

<h1>[each 반복문]</h1>

<h1>탐색 선택자</h1>
<ul id = "menu1">
	<li>내용1-1</li>
	<li>내용1-2</li>
	<li>내용1-3</li>
</ul>

<ul id = "menu2">
	<li>내용2-1</li>
	<li>내용2-2</li>
	<li>내용2-3</li>
</ul>

<h2>item - 0</h2>
<h2>item - 1</h2>
<h2>item - 2</h2>
<h2>item - 3</h2>
<h2>item - 4</h2>


</body>
</html>