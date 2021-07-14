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
		<c:when test="${empty sessionScope.loginVO}"><!-- empty el표현식에서 사용할 수 있는 연산자. 값이 존재하는지 확인. 값이 비면 true를 반환 -->
		<li>
			<a href = "/user/joinForm">회원 가입 폼 이동</a>
		</li>
	
		<li>
			<a href = "/user/loginForm">로그인 폼 이동</a>
		</li>
		</c:when>
		<c:otherwise>
		${sessionScope.loginVO.user_nm}님 환영합니다!
		<li>
			<a href ="/user/listForm">회원 정보 보기</a>
		</li>
	
		<li>
			<a href = "/user/logout">로그아웃</a><!-- 세션에 있는 로그인 정보 지워주기. -->
		</li>
		
		</c:otherwise>
	</c:choose>
	
	
	
	

</ul>

</body>
</html>
