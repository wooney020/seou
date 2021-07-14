<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 글 등록 페이지 ]</title>
</head>
<body>

<form action="/board/write"  method = "post" enctype="multipart/form-data"><!-- enctype은 파일이 있을 때만 사용해야함  -->
	<table border="1">
		<tr>
			<td>글 제목</td>
			<td>
			<input type ="text" name = "board_title">
			</td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td>
				<textarea rows="10" cols="10" name = "board_content"></textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<input type = "file" name = "upload "  ><!-- 파일을 찾을 수 있는 입력폼 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" value = "등록">	
			</td>
		</tr>
	</table>
	




</form>
</body>
</html>