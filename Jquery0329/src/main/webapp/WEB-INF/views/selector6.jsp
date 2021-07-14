<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[가장 가까운 상위 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
			$(".txt1").closest("div")
				.css({
					"border":"2px solid #f00"
					})
		});
		



</script>

</head>
<body>
<h1>[가장 가까운 상위 선택자]</h1>
	
<h1 class="title">선택자</h1>
<div>
	<div>
		<p class="txt1">내용</p>
	</div>

</div>

</body>
</html>