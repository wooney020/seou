<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[이벤트 - click]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	//이벤트를 등록
	$("#btn1").click(function(){ //매개변수에 클릭이 되면 실행 될 함수를 넣어줌.
			alert("버튼이 클릭 되었습니다.");
		});


	$("#header1").click(function(){
			$(this).html($(this).html()+"+"); //원래가지고 있던 문자열에 +를 추가하여 덮어씌우는 것. (매개변수가 없는 것은 그냥 태그 전체를 가져옴.)

		});

	$("#header1").on("click",function(){//매개변수(연결하려는 이벤트의 이름(문자열로) , 이벤트가 발생하면 실행할 함수)
			$(this).css("background-color","#f00");

		}); 

	$("#header2").on("click",function(){
			$("#header1").off("click"); //헤더2번을 누르면 헤더 1의 클릭 이벤트를 지우겠다.
		});

	$("#header3").on("click",function(){
		$("#header1").trigger("click"); //헤더3번을 누르면 헤더 1의 클릭 이벤트를 강제로 발생시켜라.
	});

	$("#rel_site").on("change",function(){
		$(".txt").text($(this).val());
		});

});




</script>
</head>
<body>

<input type = "button" id = "btn1" value = "버튼">
<h1 id = "header1"> 클릭테스트</h1>
<h1 id = "header2"> 클릭없애기</h1>
<h1 id = "header3"> 트리거</h1>

<select id = "rel_site">
	<option value = "">사이트 선택</option>
	<option value = "www.google.com">구글</option>
	<option value = "www.naver.com">네이버</option>
	<option value = "www.daum.com">다음</option>

</select>
<p class = "txt"></p>

</body>
</html>