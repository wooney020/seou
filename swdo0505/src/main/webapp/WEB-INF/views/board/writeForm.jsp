<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>[ Blog 글쓰기 ]</h1>
<form action="/board/write" method="post">
		<table border="1">
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="10" cols="10" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<%-- 	<input type="hidden" name="id" value="${sessionScope.loginVO.id }"> --%>
					<input type="submit" value="저장">
				</td>
			</tr>			
		</table>
	</form>
	
	
</body>
</html>