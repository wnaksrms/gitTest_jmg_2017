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
<title>�۸��â</title>
</head>
<body>
<h1>�۸��â</h1>
<table border="1" width="90%">

    <tr bgcolor="yellow" align="center">
        <td>�۹�ȣ</td>
        <td>������</td>
        <td>�۾���</td>
        <td>�̸���</td>
        <td>�ۼ�����</td>
    </tr>
    <c:forEach var="write" items="${map.public_list }">
        <tr>
            <td align="center">
                <img src="${pageContext.request.contextPath}/resources/image/bbs_top.gif"/>
            </td>
           
           <td>
           <c:choose>
           	<c:when test="${write.newWrite=='true'}">
           	<a href="${pageContext.request.contextPath}/board/writeDetail.do?num=${write.num}">${write.title }</a>
           	<img src="${pageContext.request.contextPath}/resources/image/ico_new.gif"/>
           	</c:when>
        	<c:otherwise>
              <a href="${pageContext.request.contextPath}/board/writeDetail.do?num=${write.num}">${write.title }</a>
              </c:otherwise>
           </c:choose>
           </td>
           <td>${write.author }</td>
           <td>${write.email }</td>
           <td>${write.writeday }</td>
        </tr>
    </c:forEach>
     <c:forEach var="write" items="${map.private_list }">
        <tr>
            <td align="center">${write.num }</td>
            <td>
             <c:choose>
           	<c:when test="${write.newWrite=='true'}">
           	<a href="${pageContext.request.contextPath}/board/writeDetail.do?num=${write.num}">${write.title }</a>
           	<img src="${pageContext.request.contextPath}/resources/image/ico_new.gif"/>
           	</c:when>
        	<c:otherwise>
              <a href="${pageContext.request.contextPath}/board/writeDetail.do?num=${write.num}">${write.title }</a>
              </c:otherwise>
           </c:choose>
            </td>
            <td>${write.author }</td>
            <td>${write.email }</td>
            <td>${write.writeday }</td>
        </tr>
    </c:forEach>
</table>
<br><br>
    <c:if test="${isLogOn!=null && isLogOn eq true }">
    <a href="${pageContext.request.contextPath}/board/writeForm.do">�۾���</a>
    </c:if>
    </body>
</html>