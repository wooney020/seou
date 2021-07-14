<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<ul>
		<c:choose>
			<c:when test="${empty sessionScope.loginVO }">
				<li>
					<a href = "/customer/loginForm"> 로그인 폼으로 이동</a>
				</li>
			</c:when>
			<c:otherwise>
				${sessionScope.loginVO.customer_nm }님 환영합니다.
				<li>
					<a href = "/board/listForm">게시글 목록 페이지</a>
				</li>
				<li>
					<a href = "/customer/logout">로그아웃</a>
				</li>
			</c:otherwise>
		
		</c:choose>
	
	</ul>

</body>
</html>
