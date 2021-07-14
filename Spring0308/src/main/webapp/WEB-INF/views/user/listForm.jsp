<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){




	function userDeleteFnc(){

		
	$(".delBtn").on("click",function(){
		//지금 누른 삭제버튼의 회원의 회원번호를 가져와야한다.
	
		var user_no =$(this).closest("tr").find("td").html();

		//비동기 통신으로 서버에 회원번호를 전달해서 회원을 삭제한다.
		$.ajax({
			url:"/user/delete",
			type:"post",
			data:{
				user_no : user_no
				},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				var context = '';
				
				$.each(data,function(index, item){
					context += '<tr>';
					context += '<td>' +item.user_no+'</td>';
					context += '<td>' +'<a href ="/user/detail?user_no='+item.user_no+'">'+item.user_id+'</a></td>';
					context += '<td>' +item.user_pw+'</td>';
					context += '<td>' +item.user_nm+'</td>';
					context += '<td>' +item.user_indate+'</td>';
					context += '<td><input type="button" value="삭제" class ="delBtn"></td>';
					context += '</tr>';
				});

				$(".tbody").html(context);

				//새로운 삭제버튼에 이벤트 연결
				userDeleteFnc();
				},
			error:function(e){
				console.log(e);
				}
			});

		});
	}
	//ready함수가 실행되면 이벤트 연결 함수를 실행.
	userDeleteFnc(); //delete 이벤트 함수실행.(함수 안에 넣어놨기 때문에 실행을 해주어야 이벤트가 실행됨.)
});

/* function userDelete(user_no){
	//컨트롤러로 삭제 요청을 전달하는데 onclick으로부터 전달받은 데이터로 같이 보낸다.
	location.href = "/user/delete?user_no="+user_no;
}
 */



</script>
</head>
<body>

	<h1>[ 회원 정보 ]</h1>
	
	<table border = "1">
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입일</th>
			<th>삭제</th>
		</tr>
	</thead>
		<tbody class = "tbody">
			<c:forEach var = "user" items = "${userList }"> <!-- items에는 반복할 대상 -->
				<tr>
					<td class>${user.user_no }</td>
					<td>
					<a href ="/user/detail?user_no=${user.user_no }" >${user.user_id }</a>
					</td>
					<td>${user.user_pw }</td>
					<td>${user.user_nm }</td>
					<td>${user.user_indate }</td>
					<td>
					<!--  <input type="button" value="삭제" onclick="userDelete(${user.user_no})"> -->
					<input type="button" value="삭제" class ="delBtn"  user_no = "${user.user_no }"> 
					<input type ="hidden" value = "${user.user_no }" class = "userNoBtn">
					</td>
				</tr>
		
		
		</c:forEach>
		</tbody>
	
	
	
	
	
	</table>

</body>
</html>