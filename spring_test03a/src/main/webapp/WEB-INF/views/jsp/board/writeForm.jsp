<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
     isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���â</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload=function(e){
			$('#preview').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
var cnt=3;
function fn_addFile(){
	cnt++;
	$("#d_file").append("<br>"+"<input  type='file' name='file"+cnt+"' />");
	
	
	
}
</script>
</head>
<body>
<h1>�۾���â</h1>
<form method="post" action="${pageContext.request.contextPath}/board/addWrite.do"
				encType="multipart/form-data">
  <table>
   <tr>
  <td>�����ۿ���</td>
  <td>
  <input type="radio" size="20" maxlength="100" name="publicWrite" value="y"/>������
  <input type="radio" size="20" maxlength="100" name="publicWrite" value="n" checked/>�Ϲݱ�
  </td>
  </tr>
  
  <tr>
  <td>�ۼ���</td>
  <td><input type="text" size="20" maxlength="100" name="author"/></td>
  </tr>
  
  <tr>
  <td>email</td>
  <td><input type="text" size="20" maxlength="100" name="email"/></td>
  </tr>
  
  <tr>
  <td>����</td>
  <td><input type="text" size="20" maxlength="100" name="title"/></td>
  </tr>
  
  <tr>
  <td>�۳���</td>
  <td>
  <textarea name="content" rows="10" cols="65" maxlength="4000" ></textarea>
  </td>
  </tr>
	
  <tr>
  <td>��й�ȣ</td>
  <td><input type="text" size="20" maxlength="100" name="passwd"/></td>
  </tr>
  
   <tr>
  <td>�̹�������÷��</td>
  <td>
  <input type="button"  value="���� �߰�" onClick="fn_addFile()"/><br><br><br>
  <div id="d_file">
	<input type="file" name="file1"/><br>
	<input type="file" name="file2"/>

     </div>
  <!-- <input type="file" size=20 name="imageFile" onchange="readURL(this)"/><br>
  <img id="preview" src="#" width=200 height=200/> -->
  </td>
  </tr>
  <tr>
  <td colspan="2" align=center>
  <input type="submit" value="����">
  <input type="reset" value="�ʱ�ȭ">
  </td>
  </tr>

  </table>
</body>
</html>