<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[하위 선택자]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function(){
			$("#wrap h1") // wrap을 id로 가진 요소를 기준으로 하위에 있는 h1을 모두 선택
				.css({
					"background-color":"yellow",
					"border":"2px dashed #f00"
					})


		//자식요소선택자
		$("#wrap > h1").css("border","2px dashed #f00")

		$("#wrap > section").children() //id를 기준으로 section을 찾고 거기서 아이들.
			.css({
				"background-color":"yellow",
				"border":"2px solid red"
				})
		});
		

</script>
</head>
<body>
	<h1>[하위 선택자]</h1>

	<div id = "wrap">
		<h1>인접 관계 선택자</h1>
		<p>내용1</p>
		<section>
			<h1>하위 요소 선택자</h1>
			<p>내용2</p>
		</section>
	
	</div>


</body>
</html>