<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="../../css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
   function listdo(page) {
	   document.searchform.pageNum.value=page;
	   document.searchform.submit();
   }
</script>
</head>
<body>
<table style="font-weight:bold">
	<c:if test="${param.tema == 1}">
		<caption>공지사항</caption>
	</c:if>
	<c:if test="${param.tema == 2}">
		<caption>건의사항</caption>
	</c:if>
	<c:if test="${param.tema == 3}">
		<caption>자유게시판</caption>
    </c:if>
</table>
<table>
   <tr>
       <td colspan="5">
          <div style="display : inline;">
             <form action="list.shop?=${param.tema}" method="post" name="searchform">
                <input type="hidden" name="pageNum" value="1">
                <input type="hidden" name="tema" value="${param.tema}">
                <input type="hidden" name="userid" value="${sessionScope.login}">
                   <select name="searchtype" style="width:100px;">
                      <option value="">선택하세요</option>
                      <option value="subject">제목</option>
                      <option value="name">작성자</option>
                      <option value="content">내용</option>
                   </select>
                   <script type="text/javascript">
                      searchform.searchtype.value="${param.searchtype}";
                   </script>
                   <input type="text" name="searchcontent" value="${param.searchcontent}" style="width:250px;">
                   <input type="submit" value="검색">
             </form>
          </div>
       </td>
   </tr>

<c:if test="${listcount > 0}">
   <tr>
       <td>글개수:${listcount}</td>
   </tr>
   <tr>
       <th>번호</th><th>제목</th><th>글쓴이</th><th>날짜</th><th>조회수</th>
   </tr>
   <c:forEach var="border" items="${borderlist}">
      <tr>
          <td>${borderno}</td>
          <c:set var="borderno" value="${borderno-1}"/>
          
          <td style="text-align:left;">
          <c:if test="${!empty border.fileUrl}"> <%-- 첨부파일 존재 --%>
             <a href="file/${border.fileUrl}">@</a>
          </c:if>
          <c:if test="${empty border.fileUrl}">
             &nbsp;&nbsp;&nbsp;
          </c:if>
          <a href="detail.shop?tema=${border.tema}&no=${border.no}">${border.subject}</a>
          </td>
          <td>${border.nickname}</td>
          <td><fmt:formatDate value="${border.date}" pattern="yyyy-MM-dd HH:hh"/></td>
          <td>${border.view}</td>
      </tr>
   </c:forEach>
   
   
   
   <%-- 페이지 처리 부분 --%>
		<tr><td colspan="5">
			<div class="w3-container">
			<c:if test="${pageNum <= 1}"><a class="w3-button w3-white w3-border">＜</a></c:if>
			<c:if test="${pageNum > 1}">
				<a class="w3-button w3-white w3-border" href="javascript:listcall(${pageNum - 1})">＜</a>
			</c:if>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == pageNum}"><a class="w3-button w3-light-gray w3-border">${a}</a></c:if>
				<c:if test="${a != pageNum}">
					<a class="w3-button w3-white w3-border" href="javascript:listcall(${a})">${a}</a></c:if>
			</c:forEach>
			
			<c:if test="${pageNum >= maxpage}"><a class="w3-button w3-white w3-border">＞</a></c:if>
			<c:if test="${pageNum < maxpage}">
				<a class="w3-button w3-white w3-border" href="javascript:listcall(${pageNum + 1})">＞</a></c:if>
			</div>
		<%----------------%>
		
		
		
</c:if>
<c:if test="${listcount == 0}">
   <tr>
       <td colspan="5">등록된 게시물이 없습니다.</td>
   </tr>
</c:if>
<tr>
    <td colspan="5" align="right">
       <a href="write.shop?tema=${param.tema}">[글쓰기]</a>
    </td>
</tr>
</table>
</body>
</html>