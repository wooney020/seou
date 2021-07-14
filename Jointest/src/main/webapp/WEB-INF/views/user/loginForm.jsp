<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인]</title>
<style type="text/css">

#bg1{
	width : 300px;
	height : 300px;
	background-color : #e1f5fe;
}

table{
	color:#768da1;
	position: relative;
	left:15%;
	top:30%;
}

#loginBtn{
width:150px;
background-color:white;
border : solid 1px #768da1;
color: #768da1;
}
#bg2{
position: relative;
left:15%

}

</style>
</head>
<body>

<form action="/user/login" method = "post" >
	<div id = "bg1">
	<table >
		
		<tr>
			<td>ID</td>
			<td><input type="text" id = "user_id" name = "user_id"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" id = "user_pw" name ="user_pw"></td>
		</tr>
		<tr>
		 <td colspan = "2">
		 	<div id = "bg2">
		 		<input type ="submit" value = "login" id = "loginBtn">
		 	</div>
		 </td>
		</tr>
	</table>
	
 </div>


</form>

</body>
</html>