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
<title>ȸ�� ���â</title>
</head>
<body>
<h1>ȸ�����â�Դϴ�.</h1>

<table border="1" width="100%">
	<tr bgcolor="skyblue" align="center">
		<td>���̵�</td>
		<td>�̸�</td>
		<td>Ű</td>
		<td>������</td>
		<td>����</td>
	</tr>
	
	<c:forEach var="mem" items="${memList }">
		<tr>
			<td>${mem.id }</td>
			<td><a href="${pageContext.request.contextPath}/member/detail.do?id=${mem.id}"> ${mem.name }</td>
			<td>${mem.height }</td>
			<td>${mem.weight }</td>
			<td>${mem.age }</td>
		</tr>
	</c:forEach>
</table>
<br><br>
<a href="${pageContext.request.contextPath}/member/memberForm.do">ȸ�����</a>
</body>
</html>