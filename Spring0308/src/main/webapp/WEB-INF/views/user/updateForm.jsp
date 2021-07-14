<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원 정보 수정]</title>
</head>
<body>

<form action="/user/update" method = "post">
NO: ${userVO.user_no }<br>
ID: ${userVO.user_id }<br>
PW: <input type= "password" name = "user_pw"><br>
NM: <input type= "text" name = "user_nm" value = "${userVO.user_nm }"><br>
INDATE: ${userVO.user_indate }<br>
<input type = "hidden" name = "user_no" value = "${userVO.user_no }"> 
<input type="submit" value = "수정">
</form>
</body>
</html>