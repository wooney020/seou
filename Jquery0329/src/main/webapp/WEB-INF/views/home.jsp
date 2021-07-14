<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<ul>
		<li>
			<a href = "/selector1">직접선택자 - 전체 선택자</a>
		</li>
		<li>
			<a href = "/selector2">직접선택자 - 아이디 선택자</a>
		</li>
		<li>
			<a href = "/selector3">직접선택자 - 클래스 선택자</a>
		</li>
		<li>
			<a href = "/selector4">간접선택자 - 부모 선택자</a>
		</li>
		<li>
			<a href = "/selector5">간접선택자 - 하위 선택자</a>
		</li>
		<li>
			<a href = "/selector6">간접선택자 - 가장 가까운 상위 선택자</a>
		</li>
		<li>
			<a href = "/selector7">간접선택자 - 원하는 하위 선택자</a>
		</li>
		<li>
			<a href = "/selector8">위치선택자 - 처음과 마지막 선택자</a>
		</li>
		<li>
			<a href = "/each">반복문 - each</a>
		</li>
		<li>
			<a href = "/selector9">속성선택자 - selected , checked</a>
		</li>
		<li>
			<a href = "/attr1">객체조작 - html(), text()</a>
		</li>
		<li>
			<a href = "/attr2">객체조작 - attr() , removeAttr()</a>
		</li>
		<li>
			<a href = "/attr3">객체조작-addClass(),removeClass(),toggleClass(),hasClass()</a>
		</li>
		<li>
			<a href = "/attr4">객체조작- prop()</a>
		</li>
		<li>
			<a href = "/event1">이벤트 - click</a>
		</li>
		
		<li>
			<a href = "/ajax1">비동기 통신 - ajax</a>
		</li>
		
	</ul>
</body>
</html>
