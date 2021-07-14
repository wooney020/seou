<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[글 목록 페이지]</title>
<script type="text/javascript">

function boardWriteForm(){

	location.href = "/board/writeForm";
	
}
	

function searchBoard(page){
	var searchForm = document.getElementById("searchForm");
	document.getElementById("currentPage").value = page;
	searchForm.submit();
}


</script>
</head>
<body>

	<input type = "button" value = "글 등록" onclick = "boardWriteForm()">
	
	<table border="1">
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<c:forEach var = "board" items = "${boardList }">
			<tr>
				<td>${board.BOARD_NO }</td>
				<td>
				<a href = "/board/detail?board_no=${board.BOARD_NO }">${board.BOARD_TITLE }</a>
				</td>
				<td>${board.CUSTOMER_NM}</td>
				<td>${board.BOARD_INDATE}</td>
			</tr>	
		
		</c:forEach>
	
	</table>
	
	<a href= "javascript:searchBoard(${boardNavi.currentPage - boardNavi.pagePerGroup })">◁◁ </a>
	<a href = "javascript:searchBoard(${boardNavi.currentPage - 1 })">◀ </a>
	<c:forEach var = "counter" begin="${boardNavi.startPageGroup }" end="${boardNavi.endPageGroup }">
		<a href = "javascript:searchBoard(${counter})">${counter }</a>
	
	</c:forEach>
	<a href = "javascript:searchBoard(${boardNavi.currentPage + 1 })">▶</a>
	<a href = "javascript:srarchBoard(${boardNavi.currentPage + boardNavi.pagePerGroup })">▷▷</a>
	
	
	<br>
	
	<form action="/board/listForm" method = "get" id= "searchForm">
		제목 : <input type ="text" name = "searchText" value = "${searchText }">
		<input type ="hidden" name = "page" id="currentPage">
		<input type = "button" value = "검색" onclick = "searchBoard()">
		
	</form>
</body>
</html>