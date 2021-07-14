<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function formCheck(){

	//ID와 password가 입력되었는지 검사

	var inputId = document.getElementById("inputId").value;
	var inputPw = document.getElementById("inputPw").value;

	
	if(inputId = "" || inputId.length == 0){
		alert("ID를 입력해주세요");
		return false;
		}
	

	if(inputPw = "" || inputPw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
		}

		return true;
}




</script>
</head>
<body>
	
	<h1>새로 바뀐 메인 페이지</h1>
	<a href = "http://localhost:8888/join">회원가입 폼</a><br>
	<a href = "/join">회원가입 폼</a><br>
	
	<!-- 쿼리 스트링(데이터를 전달하는 방법 중 1번째)  -->
	<!-- (하나일 때)요청주소?변수명=값 , /(여러개일때)요청주소?변수명=값&변수명=값&변수명=값 ....  -->
	<!-- 이 때의 값은 컨트롤러의 리퀘스트 맵핑의 매개변수 값과 자료형이 같아야함. -->
	<a href = "/sendNumber?num=3">숫자 데이터 전달</a><br>

	<a href = "/sendString?str=SpringText">문자열 데이터 전달</a><br>
	
	<a href = "/sendData?num=10&str=text&flag=true">데이터 여러개 전달</a><br>
	
	<!-- 데이터를 숨기는 전달 방식 2번째 (POST) -->
	<form action="/sendFormData2" method = "POST"  onsubmit = "return formCheck();">
	ID : <input type = "text" id = "inputId" name = "sendId"><br> <!-- 변수명은 name에서 지정  -->
	PW : <input type = "password" id = "inputPw" name = "sendPw"><br>
	<input type="submit" value ="전송">
	</form>
	
</body>
</html>