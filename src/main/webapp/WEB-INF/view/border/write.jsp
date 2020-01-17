<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /WEB-INF/view/border/write.jsp --%>
<%@ include file="/WEB-INF/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form:form modelAttribute="border" action="write.shop" enctype="multipart/form-data" name="f">
<input type="hidden" name="no" value="${param.no}">
<input type="hidden" name="tema" value="${param.tema}">

<table>
   <tr>
       <td>글쓴이</td>
       <td>
          <form:input path="nickname" value="${sessionScope.loginUser.nickname}" />
          <font color="red"><form:errors path="nickname" /></font>
       </td>
   </tr>
   <tr>
       <td>제목</td>
       <td>
          <form:input path="subject" />
          <font color="red"><form:errors path="subject" /></font>
       </td>
   </tr>
   <tr>
       <td>내용</td>
       <td>
          <form:textarea path="content" rows="15" cols="80"/>
          <script>CKEDITOR.replace("content", {
             filebrowserImageUploadUrl : "imgupload.shop"
          });
          </script>
          <font color="red"><form:errors path="content" /></font>
       </td>
   </tr>
   <tr>
       <td>첨부파일</td>
       <td>
          <input type="file" name="file">
       </td>
   </tr>
   <tr>
       <td colspan="2">
          <a href="javascript:document.f.submit()">[게시글 등록]</a>
       </td>
   </tr>
</table>
</form:form>
</body>
</html>