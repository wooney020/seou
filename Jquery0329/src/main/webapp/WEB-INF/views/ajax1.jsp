<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[비동기 통신 - ajax]</title>
<script type="text/javascript" src= "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn1").on("click",function(){
		console.log("ajax 실행 전");
		$.ajax({
			url : "ajaxtest1", //앞에 /가 붙으면 절대주소 안붙으면 상대주소임. 붙여도 안 붙여도 상관없음.
			type : "get",
			data: {
					num : 10 //변수명 : 값
				},//객체 형태로 보내기
			dataType : "text",
			success : function(data){ //매개변수 data는 서버로 부터 받아온 데이터. 변수명은 마음대로 해도 됨.
				console.log("서버로 부터 전달받은 데이터 : "+data);
				},
			error: function(e){ //매개변수 명은 마음대로 해도 됨. 에러에 대한 정보가 들어가는 객체.
				console.log(e);
				}//에러가 나면 실행되는 부분
		});

		console.log("ajax 실행 후");
	});

	$("#formButton1").on("click",function(){//button에 클릭 이벤트 부여
			var name = $("#name").val();
			var age = $("#age").val();
			var phone = $("#phone").val(); // 가져온 데이터를 자바스크립트 변수에 담음.

			$.ajax({
					url :"/ajaxtest2",
					type : "post",
					data : {
							name : name, //서버에서 전달받을 데이터 이름(=name속성) : 자바스크립트 데이터
							age : age,
							phone : phone
						},
					success : function(data){
							
						},
					error : function(e){
							console.log(e);
						}
			});

			
}); 
	
































	

});

</script>
</head>
<body>

<input type = "button" id = "btn1" value = "버튼1"> 

<br>

<form id = "writeForm1">
이름 <input type = "text" id = "name"><br>
나이 <input type = "text" id = "age"><br>
전화 <input type = "text" id = "phone"><br>
	<input type = "button" id = "formButton1" value = "저장"><br>
</form>

</body>
</html>