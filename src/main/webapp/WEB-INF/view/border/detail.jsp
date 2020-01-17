<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<table>
   <tr>
      <td width="15%">닉네임</td>
      <td width="85%" class="leftcol">${border.nickname}</td>
   </tr>
   <tr>
      <td>제목</td>
      <td class="leftcol">${border.subject}</td>
   </tr>
   <tr>
      <td>내용</td>
      <td class="legtcol">
         <table class="lefttoptable">
            <tr>
               <td class="leftcol lefttoptable">${border.content}</td>
            </tr>
         </table>
      </td>
   </tr>
<tr>
    <td>첨부파일</td>
    <td>
       &nbsp;
       <c:if test="${!empty border.fileUrl}">
       <a href="file/${border.fileUrl}">${border.fileUrl}</a>
       </c:if>
    </td>
</tr>
<tr>
    <td colspan="2">
      <c:if test="${sessionScope.loginUser.nickname == border.nickname}">
       <a href="update.shop?tema=${border.tema}&no=${border.no}">[수정]</a>
       <a href="delete.shop?tema=${border.tema}&no=${border.no}">[삭제]</a>
        </c:if>
       <a href="list.shop?tema=${border.tema}">[게시물 목록]</a>
    </td>
</tr>
</table>
</body>
</html>