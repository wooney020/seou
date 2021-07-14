<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h1>[ SES Blog 목록 ]</h1>
	
	<c:forEach var="user" items="${userList}">
		<img alt="프로필 사진" src="/resources/images/photo${user.photo}.png">
		<a href="/board/listForm?id=${user.id}">
		${user.name}(${user.id})님의 블로그 보러가기<br></a>
		<input type="hidden" name = id value="${user.id}">
	</c:forEach>
	
	 
</body>
</html>