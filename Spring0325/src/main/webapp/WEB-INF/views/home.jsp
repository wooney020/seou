<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>[메인 화면]</title>
	<script type="text/javascript" src = " resources/js/jquery-3.6.0.js"></script>
	<script type="text/javascript">

	


	</script>





</head>
<body>


	<ul>
		
		<c:choose>
			<c:when test="${empty sessionScope.loginId}">
			<li>
			<a href= "/customer/joinForm">회원가입 폼 이동</a>
			</li>
			<li>
			<a href = "/customer/loginForm">로그인 폼 이동</a>
			</li>
		
			</c:when>
			<c:otherwise>
				<li><a href = "/customer/profile">${sessionScope.loginName}</a>님 환영합니다.
				<li><a href = "/customer/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	
	</ul>
	



</body>
</html>
