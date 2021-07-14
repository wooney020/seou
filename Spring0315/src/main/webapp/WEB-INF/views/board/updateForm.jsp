<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시글 수정 폼]</title>
</head>
<body>
	
	<form action="/board/update" method = "post" enctype="multipart/form-data">
		글 번호 : ${detail.BOARD_NO }<br>
		글 제목 :<input type = "text" name = "board_title" value = ${detail.BOARD_TITLE }><br>
		작성자 :  ${detail.COUSTOMER_NM }<br>
		조회수 :  ${detail.BOARD_HITS }<br>
		글 내용 : <textarea rows="10" cols="10" name = "board_content"> ${detail.BOARD_CONTENT }<br></textarea>
		작성일 :  ${detail.BOARD_INDATE}<br>
		<c:if test="${detail.BOARD_ORIGINAL != null}">
		저장된 파일명 : ${detail.BOARD_ORIGINAL }<br>
		</c:if>
		첨부파일 : <input type ="file" name = "upload" ><br>
		
		<input type = "hidden" name ="board_no" value ="${detail.BOARD_NO}">
		<input type = "submit" value="수정">
		
	</form>

</body>
</html>