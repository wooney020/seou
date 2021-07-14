<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function boardUpdateForm(boardnum){
	location.href="/board/updateForm?boardnum="+boardnum;
}

function boardDelete(boardnum){
	var del_test = confirm("삭제하시겠습니까?")
	if(del_test==true){
		location.href="/board/delete?boardnum="+boardnum;
	}
}

function boardUpdateHits(boardnum ){
	location.href="/board/updateHit?boardnum="+boardnum;
	//location.href="/board/updateHit?boardnum="+boardnum+"&id="+id;
}

</script>
</head>
<body>
<h1> [ ${detail.id}님의 블로그 ]</h1>
<table>
			<tr>
				<td>제목</td>
				<td>
					${detail.title}
				</td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td>
					${detail.inputdate}
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					${detail.content}
				</td>
			</tr>
			
		</table>
		추천수 ${detail.likecnt } 
		<input type="button" value="추천하기" onclick="boardUpdateHits('${detail.boardnum}')"><br><br>

	
	<c:if test="${sessionScope.loginVO.id == detail.id}">
	
	<input type="button" value="수정" onclick="boardUpdateForm(${detail.boardnum})">
	<input type="button" value="삭제" onclick="boardDelete(${detail.boardnum})">	
	</c:if>	 
		
</body>
</html>