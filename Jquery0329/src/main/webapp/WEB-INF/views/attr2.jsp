<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[객체조작 - attr() , removeAttr()]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){

	var srcVal = $("#sec_1 img").attr("src");
	console.log(srcVal);

	$("#sec_1 img")
		.attr({
			"width":200, //크기 속성 추가
			"src" : srcVal.replace("1.png","2.png"), //가져온 src 요소의 속성의 문자열을 교체하여 다른걸로 바꿈. 
			"alt" : "가위" // 이미지 이름을 가위로 변경
			})
		.removeAttr("border"); //border속성 삭제. 메소드 체이닝.
	
});


</script>
</head>
<body>

	<h1>
		<strong>객체 조작 및 생성</strong>
	</h1>
	<section id = "sec_1">
		<h2>이미지 속성</h2>
		<p>
			<img alt="바위" src="/resources/images/attrImg1.png" border = "2">
	</section>

</body>
</html>