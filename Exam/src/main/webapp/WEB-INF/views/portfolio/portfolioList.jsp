<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[개인 포트폴리오]</title>
<style type="text/css">

table {
text-align : center;
}

</style>
</head>
<body>

<table border = 1>
	<tr> 
		<td>번호</td>
		<td>종류</td>
		<td>제목</td>
		<td>공개여부</td>
		<td>작성일/공개일</td>
	</tr>
	
	
	<c:choose>
		<c:when test="${!empty portfolioList }">
			<c:forEach var = "portfolio" items = "${portfolioList }" varStatus="status">
			<tr>
    			<td>${status.count}</td>
				<c:choose>
					<c:when test="${portfolio.portfolio_type == 1}">
						<td>학력정보</td>
					</c:when>
					<c:when test="${portfolio.portfolio_type == 2}">
						<td>경력정보</td>
					</c:when>
					<c:otherwise>
						<td>프로젝트</td>
					</c:otherwise>
					
				</c:choose>
				
				<td>
				<a href = "/portfolio/detail?portfolio_no=${portfolio.portfolio_no }">${portfolio.portfolio_title }</a>
				</td>
				<c:choose>
					<c:when test="${portfolio.portfolio_gb == 0}">
						<td><a href = "/portfolio/gbUpdate?portfolio_no=${portfolio.portfolio_no }&portfolio_gb=${portfolio.portfolio_gb}">미공개</a></td>
					</c:when>
					<c:otherwise>
						<td><a href = "/portfolio/gbUpdate?portfolio_no=${portfolio.portfolio_no }&portfolio_gb=${portfolio.portfolio_gb}">공개</a></td>
					</c:otherwise> 
				</c:choose>
				<td>${portfolio.portfolio_gb_date }</td>
			</tr>	
		</c:forEach> 
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5">작성된 포트폴리오가 없습니다 </td>
			</tr>
		
		</c:otherwise>
	</c:choose>
	
		
	</table>

<br>
<a href = "/portfolio/writeForm">포트폴리오 작성하기</a><br>
<a href = "/">메인으로</a>

</body>
</html>