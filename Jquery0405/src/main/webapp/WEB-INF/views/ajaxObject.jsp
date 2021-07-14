<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ajax 데이터 전송]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
			$("#btn").on("click" , function(){
					//문자열에 입력된 값을 가져온다.
					var id = $("#id").val();
					//숫자에 입력된 값을 가져온다.
					var num = $("#num").val();
					//비동기 통신으로 문자열의 값과 숫자의 값을 서버로 전송한다.
					$.ajax({
						url: "/ajaxtest1", //요청주소
						type: "get", //전송방식
						data: {
								id : id,
								num : num,
								bool : false
							},
						success: function(data){
							console.log(data);
								
							},
						error: function(e){
							console.log(e);
							}


					});
				});


			$("#btn1").on("click",function(){
				$.ajax({
						url:"/ajaxtest2",
						type:"post",
						data : {
								custid : "id",
								password : "pw",
								age : 20
							},
						dataType :"JSON", //서버로부터 전달받는 데이터의 타입
						success: function(data){
							console.log(data); 
							console.log(data.flag);
							console.log(data.hobby);
							//dataType이 text일 경우 {}로 온 것은 하나의 문자열임. 
							//값을 꺼낼때 문자열 자르기 코드를 써야함. (그렇기 때문에 JSON타입을 써야함.)
							//자바스크립트에는 ArrayList가 없기때문에, []로 담겨서 옴. 

							var context = ''; //싱글쿼테이션으로 문자열만들기.
							$(data.hobby).each(function(index,item){
									context += '<input type="checkbox" name="hobby" class="hobby">'+'<span>'+this+'</span>'; //concat
								});
							$("#hobbyDiv").html(context); // hobby의 체크박스 생김
							$(".hobby").on("click",function(){
									var text = $(this).next().html();
									alert(text);

								});

							},
						error: function(e){
							console.log(e);
							}
					});
				});
		$("#btn2").on("click",function(){

			$.ajax({
					url:"/ajaxtest4",
					type:"post",
					contentType : "application/json; charset=utf-8" ,//보내주는 데이터의 타입
					data:JSON.stringify({
							custid :"id",
							password : "pw",
							age : 20,
							hobby :["스포츠","영화감상","노래부르기"]
						}),
						//이 데이터를 JSON으로 바꿔주는 코드를 적어줘야함.(하나의 큰 문자열로 바뀜)
						//이 전까지는 변수명을 매칭해 하나하나 연결되게 했지만, hobby가 배열이기 때문에 json으로 바꿔줘야함.
						//직렬화라고 함.
					dataType :"json",
					success: function(data){
								console.log(data);
						},
					error: function(e){ 
								console.log(e);
						}


				});


			});


		});





</script>
<style type="text/css">
.hobby{
	display:inline-block;
	width : 20px;
	height: 20px;
}

</style>
</head>
<body>

	문자열 : <input type= "text" id = "id"> <br>
	숫자 : <input type= "text" id = "num"> <br>
	<input type= "button" id = "btn" value = "전송"> <br>
	<br>
	<br>
	<input type = "button" value = "전송1" id = "btn1">
	
	<br>
	<div id = "hobbyDiv"></div>
	<br>
	<input type ="button" id="btn2" value ="전송2">
</body>
</html>