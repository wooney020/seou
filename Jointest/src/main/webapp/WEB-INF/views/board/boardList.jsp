<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시글 목록]</title>
</head>
<body>

<table border = "1">
	<tr>
		<th>글 번호</th>
		<th>글 제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var ="board" items = "${boardList }">
		<tr>
			<td>${board.board_no }</td>
			<td><a href = "">${board.board_title }</a></td>
			<td>${board.user_id}</td>
			<td>${board.board_indate }</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>