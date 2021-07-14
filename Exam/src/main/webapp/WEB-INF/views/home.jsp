<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>[메인 화면]</title>
<style type="text/css">
table {
text-align : center;
}


	
</style>
</head>
<body>
<h1>[ 메인 화면 ]</h1>

<table border = 1>
	<tr> 
		<td >번호</td>
		<td >종류</td>
		<td >제목</td>
		<td >이름</td>
		<td >공개일</td>
	</tr>
	
	<c:choose>
		<c:when test="${!empty portfolioList}">
			<c:forEach var = "portfolio" items = "${portfolioList }" varStatus="status">
			<tr>
    			<td >${status.count}</td>
				<c:choose>
					<c:when test="${portfolio.PORTFOLIO_TYPE == 1}">
						<td  >학력정보</td>
					</c:when>
					<c:when test="${portfolio.PORTFOLIO_TYPE == 2}">
						<td >경력정보</td>
					</c:when>
					<c:otherwise>
						<td >프로젝트</td>
					</c:otherwise>
					
				</c:choose>
				
				<td >
				<a href = "/portfolio/detail?portfolio_no=${portfolio.PORTFOLIO_NO }">${portfolio.PORTFOLIO_TITLE }</a>
				</td>
				<td >${portfolio.APPLIER_NM }</td>
				<td >${portfolio.PORTFOLIO_GB_DATE }</td>
			</tr>	
		
			</c:forEach> 
			</c:when>
		<c:otherwise>
			<tr>
				<td colspan="5"> 공개된 포트폴리오가 없습니다 </td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<br>

<c:choose>
		<c:when test="${empty sessionScope.loginVO}">
			<a href = "/applier/joinForm">회원가입</a><br>
			<a href = "/applier/loginForm">로그인</a>
		</c:when>
		<c:otherwise>
			<a href = "/applier/logout">로그아웃</a><br>
			<a href ="/portfolio/portfolioList">포트폴리오</a>
		</c:otherwise>
</c:choose>
	

</body>
</html>
