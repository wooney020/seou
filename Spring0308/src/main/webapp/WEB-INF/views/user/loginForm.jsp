<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인 폼]</title>
</head>
<body>
	
	<form action = "/user/login" method = "post">
	 ID : <input type = "text" name = "user_id" ><br>
	 PW : <input type = "password" name = "user_pw"><br>
	<input type = "submit" value = "로그인" >
	</form>
</body>
</html>