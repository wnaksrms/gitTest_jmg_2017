<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
     isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록창</title>
</head>
<body>
<h1>회원목록창입니다.</h1>

<table border="1" width="100%">
	<tr bgcolor="skyblue" align="center">
		<td>아이디</td>
		<td>이름</td>
		<td>키</td>
		<td>몸무게</td>
		<td>나이</td>
	</tr>
	
	<c:forEach var="mem" items="${memList }">
		<tr>
			<td>${mem.id }</td>
			<td>${mem.name }</td>
			<td>${mem.height }</td>
			<td>${mem.weight }</td>
			<td>${mem.age }</td>
		</tr>
	</c:forEach>
</table>
<br><br>
<a href="#">회원등록</a>
</body>
</html>