<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">

function formCheck(){
	var loginId= document.getElementById("id").value;
	var loginPw= document.getElementById("password").value;

	if(loginId==0 || loginId.length==0){
		alert("아이디를 입력해주세요");
		return false;
	}

	if(loginPw==0||loginPw.length==0){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<h1>[ 로그인 ]</h1>
	<form action="/member/login" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" id="id"></td>		
			</tr>
			
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="password"></td>		
			</tr>
			
			<tr>
				<td colspan='2'>
					<input type="submit" value="Login">
				</td>
			</tr>
		
		</table>
		
	</form>
</body>
</html>