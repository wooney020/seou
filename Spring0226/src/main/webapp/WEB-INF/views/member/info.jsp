<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>



<!--  EL표현식-->
${memberName}<br>
${memberAge }<br>
${memberFlag }<br>
${strList }<br>


<table>
	<tr>
		<th>번호</th>
		<th>문자열</th>
	</tr>
	<c:forEach var ="s" items="${strList }" varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${s }</td>
	
	</c:forEach>
</table>


<c:forEach var="s" items="${strList }">
${s }<br>
</c:forEach>
</body>
</html>