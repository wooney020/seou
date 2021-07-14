<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>[ Blog 글 수정 ]</h1>

<form action="/board/update" method="post">
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
					<input type="hidden" name = "boardnum" value="${detail.boardnum}"><!--name 속성을 안 넣어서 안 된 것임.-->
					<input type="submit" value="수정">
				</td>
			</tr>			
		</table>
	</form>
	

</body>
</html>