<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="../css/main.css">
<script>
	function listcall(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
	function up(no,num,name,content){
		if(confirm("댓글을 수정하시겠습니까?")){
			location.href="updatereply.shop?no=" + no + "&num=" + num + "&name=" + name + "&content=" + content;
			
		}
	}
	function recom(no,num,grp,grplevel,grpstep){
			location.href="reply.shop?no=" + no + "&num=" + num + "&grp="+ grp + "&grplevel="+ grplevel + "&grpstep="+ grpstep;
	}
	function del(no,num){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="deletereply.shop?no=" + no +"&num=" + num;
		}
	}
</script>
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
</table>



<!------------------ 댓글부분 ------------------->
<table>
<c:if test="${commentcount==0}">
   <tr>
      <td colspan="5">등록된 댓글이 없습니다.</td>
   </tr>
</c:if>

<c:if test="${commentcount > 0 }">
   <input type="hidden" name="no" value="${replyboard.no}">
   <input type="hidden" name="num" value="${replyboard.num}">
   <input type="hidden" name="userid" value="${replyboard.userid}">
   <input type="hidden" name="content" value="${replyboard.content}">
   
   <tr>
      <td style="width:20%;">
         <c:if test="${replyboard.grplevel>0}">
            <c:forEach var="i" begin="2" end="${replyboard.grplevel}">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </c:forEach>└
         </c:if>
      userid : ${replyboard.userid}
      </td>
      
      <td style="width:50%; text-align:left;">
      ${replyboard.content}&nbsp;&nbsp;
      
      <a href="javascript:recom('${replyboard.no}','${replyboard.num}','${replyboard.grp}','${replyboard.grplevel}','${replyboard.grpstep}','${border.tema}')">[댓글]</td>      
      <td style="font-size:13px"> 
	     <c:if test="${sessionScope.loginUser == replyboard.id}">
		    <a href="javascript:up('${replyboard.no}','${replyboard.num}','${replyboard.userid}','${replyboard.content}')">[수정]</a>
			<a href="javascript:del('${replyboard.no}','${replyboard.num}')">[삭제]</a>
		 </c:if>
	  </td>
   </tr>
</c:if>
<tr>
   <td colspan="5">
      <div class="w3-container">
         <c:if test="${pageNum <= 1}"><a>＜</a></c:if>
	     <c:if test="${pageNum > 1}">
				<a href="javascript:listcall(${pageNum - 1})">＜</a>
	     </c:if>
		 <c:forEach var="a" begin="${startpage}" end="${endpage}">
		    <c:if test="${a == pageNum}"><a>[${a}]</a></c:if>
			<c:if test="${a != pageNum}">
			   <a href="javascript:listcall(${a})">[${a}]</a>
			</c:if>
		 </c:forEach>			
		    <c:if test="${pageNum >= maxpage}"><a >＞</a></c:if>
			<c:if test="${pageNum < maxpage}">
			   <a href="javascript:listcall(${pageNum + 1})">＞</a>
			</c:if>
			</div>
   </td>
</tr>
</table>
<table>
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