<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function goMain(){
	location.href = "/";
};

function sendNumber(){
	var num = 100;
	location.href = "/sendNumber?num="+num;
}



</script>
</head>
<body>
	<h1>회원 가입 페이지 입니다.</h1>
	
	<input type = "button" value = "메인으로" onclick = "goMain()"><br>
	<input type = "button" value = "숫자데이터 전달" onclick = "sendNumber()">
	
</body>
</html>