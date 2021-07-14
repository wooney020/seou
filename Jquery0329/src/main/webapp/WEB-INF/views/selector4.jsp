<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[부모 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#list_1").parent().css("border","2px dashed #f00");


		});
		
		


</script>

</head>
<body>
	<h1>[부모 선택자]</h1>
	
	<h1>인접 관계 선택자</h1>
	<ul id = "wrap">
		<li>리스트1
			<ul>
				<li id ="list_1">리스트1-1</li>
				<li>리스트1-2</li>			
			</ul>
		</li>
	
	</ul>

</body>
</html>