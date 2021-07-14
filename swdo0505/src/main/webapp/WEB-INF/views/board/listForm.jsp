<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 개인 블로그 ]</title>
<script type="text/javascript">
function boardWriteForm(){
	location.href = "/board/writeForm";
}
</script>
</head>
<body>
<h1>${id}님의 블로그</h1>
<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		
		<c:forEach var="board" items="${boardList }">
			
		<tr>
				<td>${board.boardnum }</td>
				<td>
					<a href="/board/detail?boardnum=${board.boardnum }">${board.title }</a>
				</td>
				<td>${board.inputdate }</td>
					
		</tr>
		</c:forEach>
		
		
		<c:if test="${sessionScope.loginVO.id == id}">
				<tr>
					<td colspan="3">	
					<input type="button" value="글 쓰기" onclick="boardWriteForm()"></td>
				</tr>
			</c:if>
			
		
</table>

</body>
</html>