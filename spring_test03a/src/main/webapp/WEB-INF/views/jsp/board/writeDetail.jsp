<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
        isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  request.setCharacterEncoding("euc-kr");
%>  
<%
  pageContext.setAttribute("crcn","\r\n");
  pageContext.setAttribute("br","</br>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۻ� â</title>
<script src="</script">http://code.jquery.com/jquery-latest.js"></script> 
<script>
 function fn_deleteWrite(num){
  //alert(num);
  var frm=document.frmContent;
  
  in2=document.createElement("input");
  in2.setAttribute("type","hidden");
  in2.setAttribute("name","num");
  in2.setAttribute("value",num);
  
  frm.appendChild(in2);
  frm.submit();
 }
 
 function fn_showMod(){
  var d_content=document.getElementById("d_content");
  var d_mod=document.getElementById("d_mod");
  
  d_content.style.display="none";
  d_mod.style.display="block";
 }
 
 function fn_modWrite(num){
  var frm=document.frmMod;
  //input �±׸� �������� �����ؼ� name�� value�� ������ form�±׿� �ٿ��� ������ �����Ѵ�.
  var in1=document.createElement("input");
  in1.setAttribute("type","hidden");
  in1.setAttribute("name","action");
  in1.setAttribute("value","modWrite");
  
  in2=document.createElement("input");
  in2.setAttribute("type","hidden");
  in2.setAttribute("name","num");
  in2.setAttribute("value",num);
  
  frm.appendChild(in1);
  frm.appendChild(in2);
  frm.submit();
 }
 
 function fn_delImage(){
  detailImg=document.getElementById("detailImg");
  detailImg.src="";
 }
 
 function readURL(input){
   if(input.files && input.files[0]){
    var reader=new FileReader();
    reader.onload=function (e){
     $('#detailImg').attr('src',e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
    
   }
 } 
</script>
</head>
<body>
<div id="d_content">
<h1>�ۻ� â</h1>
<form name="frmContent" action="${pageContext.request.contextPath}/board/delWrite.do">
 <table  border="1" width="800px">
    <tr>
     <td bgcolor="#ccff66" align="center">�۹�ȣ</td>
     <td>${map.write.num } </td>
   </tr>
   <tr>
     <td bgcolor="#ccff66" align="center">�۾���</td>
     <td>${map.write.author } </td>
   </tr>
   <tr>
     <td bgcolor="#ccff66" align="center">������</td>
     <td>${map.write.title } </td>
   </tr>
   <tr height="500px">
     <td bgcolor="#ccff66" align="center">�۳���</td>
     <td>${fn:replace(map.write.content,crcn,br) } </td>
   </tr>
<c:choose> 
  <c:when test="${empty map.imageList or map.imageList=='null' }">
     <tr>
     <td bgcolor="#ccff66" align="center">�̹���</td>
     <td>
          <img  src="${pageContext.request.contextPath}/img/default.gif" /> 
     
     </td>
   </tr>
  </c:when>  
  <c:otherwise>
   <tr>
     <td bgcolor="#ccff66" align="center">�̹���</td>
     <td>
     <c:forEach var="img" items="#{map.imageList}">
         <img width="400" height=400  src="${pageContext.request.contextPath}/fileDownload.do?fileName=${img.imageFileName }&num=${img.num}" />
   <br>
  </c:forEach>         
     </td>
   </tr>
  </c:otherwise>
</c:choose>   
   <tr>
     <td bgcolor="#ccff66" align="center">�۾���¥</td>
     <td>${map.write.writeday } </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
     <c:choose>
     	<c:when test="${id != null && id eq map.write.id}">
     		<input  type="button" value="�۸��" onClick="location.href='${pageContext.request.contextPath}/board/listBoard.do'" />
   		  	<input  type="button" value="�ۼ���"  onClick="fn_showMod()"/>
  	        <input  type="button" value="�ۻ���" onClick="fn_deleteWrite('${map.write.num}')" />
     	</c:when>
     	
     	<c:otherwise>
       		<input  type="button" value="�۸��" onClick="location.href='${pageContext.request.contextPath}/board/listBoard.do'" />
     	</c:otherwise>
     </c:choose>
     </td>
   </tr>
   
<%-- <c:choose> 
  <c:when test="${id==write.id }">  
   <tr>
     <td colspan="2" align="center">
        <input  type="submit" value="�۸��" />
        <input  type="button" value="�ۼ���"  onClick="fn_showMod()"/>
        <input  type="button" value="�ۻ���" onClick="fn_deleteWrite('${write.num}')" />
     </td>
   </tr>
  </c:when>
  <c:otherwise>
    <tr>
     <td colspan="2" align="center">
        <input  type="submit" value="�۸��" />
     </td>
   </tr>
  </c:otherwise>   
</c:choose>  --%>  
 </table>
 </form>
</div>
<div  id="d_mod" style="display:none;">
<h1>�ۼ��� â</h1>
<form name="frmMod" method="post" encType="multipart/form-data" 
           action="${pageContext.request.contextPath}/board/modWrite.do">
 <table  border="1" width="800px"  >
    <tr>
     <td bgcolor="#ccff66" align="center">�۹�ȣ</td>
     <td>${map.write.num } </td>
   </tr>
   <tr>
     <td bgcolor="#ccff66" align="center">�۾���</td>
     <td>${map.write.author } </td>
   </tr>
   <tr>
     <td bgcolor="#ccff66" align="center">������</td>
     <td><input type="text"  name="title" value="${map.write.title }" /> </td>
   </tr>
   <tr height="500px">
     <td bgcolor="#ccff66" align="center">�۳���</td>
     <td>
        <textarea rows="50" cols="100" name="content" >${map.write.content }</textarea>
        </td>
   </tr>
 <c:choose> 
  <c:when test="${empty map.imageList or map.imageList=='null' }">
     <tr>
     <td bgcolor="#ccff66" align="center">�̹���</td>
     <td>
          <img  src="${pageContext.request.contextPath}/img/default.gif" /> 
     
     </td>
   </tr>
  </c:when>  
  <c:otherwise>
   <tr>
     <td bgcolor="#ccff66" align="center">�̹���</td>
     <td>
     <c:forEach var="img" items="${map.imageList }">
         <img  width="400px" height="400px" 
               id="detailImg"  src="${pageContext.request.contextPath}/fileDownload.do?fileName=${img.imageFileName }&num=${img.num}" />
         <a href="javascript:fn_delImage()" >����</a>
         <br>
         <input   type="file" size=20 name="imageFile" onChange="readURL(this)" /><br>
         <input  type="hidden" name="oldImageFile" value="${img.imageFileName }" />
         <input  type="hidden" name="num" value="${img.num }" />
     </c:forEach>    
     </td>
   </tr>
  </c:otherwise>
</c:choose>   
   <tr>
     <td bgcolor="#ccff66" align="center">�۾���¥</td>
     <td>${map.write.writeday } </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
        <input  type="button" value="�۸��"  onClick="fn_listBoard()"/>
        <input  type="submit" value="�����Ϸ�" />
        <%-- <input  type="button" value="�����Ϸ�" onClick="fn_modWrite('${write.num}')"/> --%>
     </td>
   </tr>
 </table>
</form> 
</div>
</body>
</html>
