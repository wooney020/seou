<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function formCheck(){

	var customer_id = document.getElementById("customer_id");
	var customer_pw = document.getElementById("customer_pw");
	

	if(customer_id.value == "" || customer_id.value.length == 0 ){
	// 속성을 가져올 때 value를 붙여도 됨.
		alert("ID를 입력해 주세요");
		return false; //전송실패
		}
	if(customer_pw.value == "" || customer_pw.value.length == 0){
		alert("PW를 입력해 주세요");
		return false;
		}

	return true; //폼 데이터 전송
}




</script>
</head>
<body>

	<form action="/customer/login" onsubmit = "return formCheck();" method = "post">
	<table border="1">
	<tr>
			<td>ID</td>
			<td>
			<input type = "text" name = "customer_id" id = "customer_id">
			</td>
		</tr>	
		<tr>
			<td>PW</td>
			<td>
			<input type = "password" name = "customer_pw" id = "customer_pw">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
			<input type = "submit" value = "로그인">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>