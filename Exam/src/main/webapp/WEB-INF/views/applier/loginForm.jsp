<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인 폼]</title>
<script type="text/javascript">
function loginCheck(){
	
	//데이터 가져오기
	var applier_id = document.getElementById("applier_id").value;
	var applier_pw = document.getElementById("applier_pw").value;



	//ID검사
	if(applier_id == "" || applier_id.length == "0"){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(applier_id.length<3 || applier_id.length>10){
		alert("아이디는 3~10글자 사이로 입력해주세요.");
		return false;
	}
	
	//PW검사
	if(applier_pw == "" || applier_pw.length == "0"){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(applier_pw.length<3 || applier_pw.length>10){
		alert("비밀번호는 3~10글자 사이로 입력해주세요.");
		return false;
	}


		
	return true;


	
}





</script>
</head>
<body>
<h1>[ 로그인 폼 ]</h1>

<form action="/applier/login" method = "post" onsubmit = "return loginCheck();">
<table>
	<tr>
		<td>아이디</td>
		<td><input type = "text" id = "applier_id" name = "applier_id"></td>
	<tr>
	<tr>
		<td>비밀번호</td>
		<td><input type = "password" id = "applier_pw" name = "applier_pw"></td>
	<tr>
</table>
<input type = "submit" value = "로그인">

</form>

</body>
</html>