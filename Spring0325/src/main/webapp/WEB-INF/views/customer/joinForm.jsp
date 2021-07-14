<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원 가입 폼]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
var idCheckFlag = false;

function formCheck(){
	var customer_id = $("#customer_id").val();
	var customer_pw = $("#customer_pw").val();
	var customer_nm = $("#customer_nm").val();	
	var customer_pwCheck = $("#customer_pwCheck").val();

	if(customer_id == "" || customer_id.length == 0){
		alert("ID를 입력해 주세요");
		return false; 
		}
	
	if(!idCheckFlag){
		alert("중복확인을 해주세요");
		return false;
		}
	
	
	if(customer_pw == "" || customer_pw.length == 0){
		alert("PW를 입력해 주세요");
		return false;
		}

	if(customer_pw != customer_pwCheck){
		alert("같은 비밀번호를 입력해 주세요");
		return false;
		}

	if(customer_nm =="" ||customer_nm.length == 0){
		alert("이름을 입력해 주세요");
		return false;
	
		}
	return true; //폼 데이터 전송
}


	$(function(){
		//중복확인 버튼을 클릭했을 때
		$("#idCheck").on("click",function(){
			
			//입력된 ID의 값을 가져온다.
			var id = $("#customer_id").val();	
			//ID값을 비동기방식으로 서버로 전달하다.
			$.ajax({
					url:"/customer/idCheck", 
					type: "post",
					data: {customer_id: id}, //VO와 변수명을 맞춰줘야함
					success: function(data){
							console.log(data);

							if(data){//true일 경우(사용가능)
								alert("사용가능한 ID입니다.");
								idCheckFlag = true;
							}else{
								alert("중복된 ID입니다. 다시 입력해주세요");
								$("#customer_id").val(""); //값 초기화
								idCheckFlag = false;
								}
							
						},
					error:function(e){
							console.log(e);
						}
			});
			
		});

		$("#customer_id").on("change",function(){
			idCheckFlag = false;
			
			});

	});

	
	
	/* var customer_id = document.getElementById("customer_id");
	var customer_pw = document.getElementById("customer_pw");
	var customer_nm = document.getElementById("customer_nm");
	var customer_pwCheck = document.getElementById("customer_pwCheck");


	if(customer_id.value == "" || customer_id.value.length == 0 ){
	// 속성을 가져올 때 value를 붙여도 됨.
		alert("ID를 입력해 주세요");
		return false; //전송실패
		}
	if(customer_pw.value == "" || customer_pw.value.length == 0){
		alert("PW를 입력해 주세요");
		return false;
		}

	if(customer_pw.value != customer_pwCheck.value){
		alert("같은 비밀번호를 입력해 주세요");
		return false;
		}

	if(customer_nm.value =="" ||customer_nm.value.length == 0){
		alert("이름을 입력해 주세요");
		return false;
	
		}  */





</script>
</head>
<body>
	<h1>[회원 가입]</h1>
	<form action="/customer/join" onsubmit = "return formCheck();" method = "post">
	<table border = "1">
		<tr>
			<td>ID</td>
			<td>
			<input type = "text" name = "customer_id" id = "customer_id">
			<input type = "button" id = "idCheck" value = "중복확인">
			</td>
		</tr>	
		<tr>
			<td>PW</td>
			<td>
			<input type = "password" name = "customer_pw" id = "customer_pw">
			</td>
		</tr>
		<tr>
			<td>PWCheck</td>
			<td>
			<input type = "password"  id = "customer_pwCheck">
			</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>
			<input type = "text" name = "customer_nm" id = "customer_nm">
			</td>
			
		</tr>
		<tr>
			<td colspan = "2">
			<input type = "submit" value = "가입">
			</td>
		</tr>
	</table>
	
	</form>
	
</body>
</html>