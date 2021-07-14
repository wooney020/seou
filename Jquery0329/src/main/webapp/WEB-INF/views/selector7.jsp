<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[원하는 하위 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){

	$("#wrap").find("p").css("border","2px solid #f00");

});


</script>
</head>
<body>
	<h1>[가장 가까운 하위 선택자]</h1>
	<div id= "wrap">
		<div>
			<p>내용1</p>
			<div>
				<p>내용2</p>
				<div>
					<p>내용3</p>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>