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
<title>ȸ�� �� ����</title>
<script>
function fn_show(){
	d_detail=document.getElementById("div_detail");
	d_modMember=document.getElementById("div_modMember");
	
	d_detail.style.display="none";
	d_modMember.style.display="block"
	
}

function fn_delete(id){
	result=confirm("�����Ͻðڽ��ϱ�?");
	if(result==true){
	
	var url="${pageContext.request.contextPath}/member/delMember.do";
	var form=document.createElement("form");
	form.setAttribute("method","get");
	form.setAttribute("action",url);
	document.body.appendChild(form);
	
	var _input=document.createElement("input");
	_input.setAttribute("type","hidden");
	_input.setAttribute("name","id");
	_input.setAttribute("value",id);
	form.appendChild(_input);
	form.submit();
	}else{
		return;
	}	
}
</script>
</head>
<body>
<div id="div_detail">
<h1 style="text-align:center">ȸ�� �� ����</h1>
<table border="1" width="800px" align="center">
<tr>
<td bgcolor="yellow">���̵�</td><td>${detail.id }</td>
</tr>
<tr>
<td bgcolor="yellow">�̸�</td><td>${detail.name }</td>
</tr>
<tr>
<td bgcolor="yellow">������</td><td>${detail.weight }</td>
</tr>
<tr>
<td bgcolor="yellow">Ű</td><td>${detail.height }</td>
</tr>
<tr>
<td bgcolor="yellow">����</td><td>${detail.age }</td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" value="������� ���ư���" onClick="location.href='${pageContext.request.contextPath}/member/listMember.do'"/>
<input type="button" value="�����ϱ�" onClick="fn_show()"/>
<input type="button" value="�����ϱ�" onClick="fn_delete('${detail.id}')"/>
</td>
</tr>
</table>
</div>
<div id="div_modMember" style="display:none">
<form method="post" action="${pageContext.request.contextPath}/member/modMember.do">
<h1 style="text-align:center">ȸ�� ���� ����</h1>
<table border="1" width="800px" align="center">
<tr>
<td bgcolor="yellow">���̵�</td>
<td>
<input type="text" value="${detail.id }" name="id" disabled/>
<input type="hidden" value="${detail.id }" name="id"/>
</td>
</tr>
<tr>
<td bgcolor="yellow">�̸�</td>
<td><input type="text" value="${detail.name }" name="name"/></td>
</tr>
<tr>
<td bgcolor="yellow">������</td>
<td><input type="text" value="${detail.weight }" name="weight"/></td>
</tr>
<tr>
<td bgcolor="yellow">Ű</td>
<td><input type="text" value="${detail.height }" name="height"/></td>
</tr>
<tr>
<td bgcolor="yellow">����</td>
<td><input type="text" value="${detail.age }" name="age"/></td>
</tr>
<tr align="center">
<td colspan="2">
<input type="button" value="�������" />
<input type="submit" value="�����Ϸ�" />
</td>
</tr>
</table>
</form>
</div>
</body>
</html>