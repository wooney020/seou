<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function formCheck(){
	return true;
}







</script>
</head>
<body>

<form action="/user/join" method = "post" onsubmit = "">
ID:<input type = "text" name = "user_id" id = "id"><br>
PW:<input type = "password" name = "user_pw" id = "pw"><br>
NM:<input type = "text" name = "user_nm" id = "name"><br>
<input type="submit" value = "전송">

</form>
</body>
</html>