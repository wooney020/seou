<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원가입]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

var idCheckflag = false;
//유효검사
function joinCheck(){

	var user_id = $("#user_id").val();
	var user_pw = $("#user_pw").val();
	var user_nm = $("#user_nm").val();

	if(user_id == "" || user_id.length == 0){
			alert("ID를 입력하세요");
			return false;
		}
	if(!idCheckflag){
			alert("중복검사를 해주세요");
			return false;
		}
	if(user_pw == ""||user_pw.length ==0){
			alert("비밀번호를 입력해주세요");
			return false;
		}
	if(user_nm=="" ||user_nm.length == 0){
			alert("이름을 입력해주세요");
			return false;
		}
	

	return true;
}

	$(function(){
		//중복검사
		$("#idCheck").on("click",function(){
			var user_id = $("#user_id").val();	
			alert("중복확인");
			idCheckflag = true;
			//비동기방식으로 데이터 전달

			});



		});

</script>
<style type="text/css">

#bg1{
	width : 300px;
	height : 300px;
	background-color : #e1f5fe;

}

#bg2{
	color:#768da1;
	position: relative;
	left:10%;
	top:18%;
}
#bg3{
position: relative;
left:3%

}

#join{

width:150px;


}

.btn1{
background-color:white;
border : solid 1px #768da1;
color: #768da1;
}
</style>
</head>
<body>
<div id = "bg1">
<div id = "bg2">
	<form action="/user/join" method ="post" onsubmit = "return joinCheck();">

		UserID<br>
		<input type="text" id = "user_id" name = "user_id">
		<input type ="button" id ="idCheck" class ="btn1" value="중복확인"><br>
		UserName<br>
		<input type = "text" id = "user_nm" name = "user_nm"><br>
		Password<br>
		<input type = "password" id = "user_pw" name = "user_pw"><br>
		<br>
		<div id = "bg3">
		<input type = "submit" id = "join" class="btn1" value = "join">	
		</div>
	</form>
</div>
</div>
</body>
</html>