<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인페이지</title>
</head>
<body>
	
	

	<ul>
		
			<li>
			<a href = "/member/joinForm"> 회원가입</a><br>
		
			</li>
		
	
			<li>
			<a href = "/member/info">회원정보</a>
		</li>
		
		
		<li>
			로그아웃
		</li>
		
	
	</ul>
	
	<c:set var="str" value = "1234"></c:set>
	
	str값: ${str}
	
	<br>
	<c:remove var="str"/>
	
	str값: ${str}
	
	<c:choose>
	
		<c:when test="">
		</c:when>
		
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</body>
</html>
