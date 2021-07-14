<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상세 정보]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){

	$("#portfolioDelete").on("click",function(){

		location.href = "/portfolio/delete?portfolio_no="+$("#portfolio_no").val();
		});
	
	$("#goMain").on("click",function(){

		location.href = "/"
		});


	
});



</script>
</head>
<body>
<h1>[상세 정보]</h1>
<br>


<table >
		<tr>
			<td>제목</td>
			<td>${portfolioDetail.portfolio_title }</td>
		</tr>
		<tr>
			<td>종류</td>
			<c:choose>
					<c:when test="${portfolioDetail.portfolio_type == 1}">
						<td>학력정보</td>
					</c:when>
					<c:when test="${portfolioDetail.portfolio_type == 2}">
						<td>경력정보</td>
					</c:when>
					<c:otherwise>
						<td>프로젝트</td>
					</c:otherwise>
					
				</c:choose>
		</tr>
		<tr>
			<td>시작일</td>
			<td>${portfolioDetail.portfolio_st }</td>
		</tr>
		<tr>
			<td>종료일</td>
			<td>${portfolioDetail.portfolio_et }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="25" cols="40" readonly = "readonly">${portfolioDetail.portfolio_content }</textarea>
			</td>
		</tr>
		<tr>
			<td>공개여부</td>
			<c:choose>
					<c:when test="${portfolioDetail.portfolio_gb == 0}">
						<td>미공개</td>
					</c:when>
					<c:otherwise>
						<td>공개</td>
					</c:otherwise>
			</c:choose>
		</tr>
		<c:if test="${sessionScope.loginVO.applier_id==portfolioDetail.applier_id}">
		<tr>
			<td colspan="2">
			<input type = "button" value = "삭제" id = "portfolioDelete">
			<input type = "hidden" value = "${portfolioDetail.portfolio_no }" id = "portfolio_no">
			<input type = "button" value = "메인으로" id = "goMain">	
			</td>
		</tr>
		</c:if>
	</table>
	

</body>
</html>