<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jspHeader.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
</head>
<body>
<h3>�������ε�</h3>
<form action="picture.shop" method="post" enctype="multipart/form-data">
   <input type="file" name="picture">
   <input type="submit" value="�������">
</form>
</body>
</html>