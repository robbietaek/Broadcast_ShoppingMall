<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>구매자 페이지</title>
  </head>
  <body>
      <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">구매자 주문 내역</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="../shop/index.shop">Home</a></li>
                <li class="breadcrumb-item"><a href="customer-order.shop">My Orders</a></li>
                <li class="breadcrumb-item active">구매자 주문 내역</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="row bar">
                      <div class="col-lg-3 mt-4 mt-lg-0">
              <!-- CUSTOMER MENU -->
              <div class="panel panel-default sidebar-menu">
                <div class="panel-heading">
                  <h3 class="h4 panel-title">Customer section</h3>
                </div>
                <div class="panel-body">
                  <ul class="nav nav-pills flex-column text-sm">
                    <li class="nav-item">
                       <a href="../item/customer-order.shop" 
                          class="nav-link active">
                          <i class="fa fa-list"></i> 주문 내역</a></li>
                    <li class="nav-item">
                       <a href="../item/customer-wishlist.shop" 
                          class="nav-link">
                          <i class="fa fa-heart"></i> 찜한 상품</a></li>
                    <li class="nav-item">
                       <a href=".shop" class="nav-link">
                          <i class="fa fa-user"></i> 결제 내역</a></li>
                    <li class="nav-item">
                       <a href="../shop/index.shop" class="nav-link">
                          <i class="fa fa-sign-out"></i> Logout</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div id="customer-order" class="col-lg-9">
              <p class="lead text-muted">기타 궁금한 점이 있으시다면 <a href="../shop/contact.shop">문의</a>해주시고, 평일 AM 09 - PM 18 연락 가능합니다.</p>
              
              <div class="d-flex justify-content-end">
                  <div class="col-sm-5 text-right">
                     <form action="customer-order.shop" method="post" name="searchform">
                        <div class="input-group">
                           <input type="hidden" name="pageNum" value="1"> <select
                              name="searchtype" style="width: 100px">
                              <option value="">검색</option>
                              <option value="itemname">물품명</option>
                              <option value="tema">카테고리</option>
                              <option value="date">등록일</option>
                           </select>
                           <script>
                              searchform.searchtype.value = "${param.searchtype}";
                           </script>

                           <input type="text" name="searchcontent"
                              value="${param.searchcontent }" placeholder="Search"
                              class="form-control"> <span class="input-group-btn">
                              <button type="submit" class="btn btn-template-main">
                                 <i class="fa fa-search"></i>
                           </button>
                        </span>
                     </div>
                  </form>
               </div>
            </div>
            <br/>
            <div class="box mt-0 mb-lg-0">
                  <div class="table-responsive">
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>등록번호</th>
                              <th>카테고리</th>
                              <th>물품명</th>
                              <th>등록 날짜</th>
                              <th>상세/수정/삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:if test="${listcount ne null}">
                           <c:forEach items="${orderList}" var="i" varStatus="status">
                              <c:set var="itemno1" value="${itemno-(status.index)}"/>
                              <tr>
                                 <th>${itemno1 }</th>
                                 <td>${fn:substring(i.tema,0,5)}</td>
                                 <td>${fn:substring(i.itemname,0,10)}</td>
                                 <td><fmt:formatDate value="${i.date}"
                                       pattern="yyyy년MM월dd일 HH시mm분ss초" /></td>
                                 <td><a href="sellingdetail.shop?userid=${sessionScope.loginUser.userid}&tema=${i.tema}&itemid=${i.itemid}"
                                    class="btn btn-template-outlined btn-sm">View</a> 
                                    <a href="sellingeditForm.shop?userid=${sessionScope.loginUser.userid}&tema=${i.tema}&itemid=${i.itemid}"
                                    class="btn btn-template-outlined btn-sm">Edit</a> 
                                    <a href="sellingdelete.shop?userid=${sessionScope.loginUser.userid}&tema=${i.tema}&itemid=${i.itemid}"
                                    class="btn btn-template-outlined btn-sm">Delete</a>
                              </tr>
                           </c:forEach>
                        </c:if>
                        <c:if test="${listcount == 0}">
                           <tr><td colspan="5" style="text-align:center;">주문한 내역이 없습니다.<td><tr>
                        </c:if>
                        </tbody>
                     </table>

                     <div class="d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                           <ul class="pagination">


                              <c:if test="${pageNum >1 }">
                                 <li class="page-item"><a
                                    href="customer-order.shop?userid=${sessionScope.loginUser.userid}&pageNum=${pageNum-1}"
                                    class="page-link">«</a></li>
                              </c:if>

                              <c:if test="${pageNum <= 1 }">
                                 <li class="page-item"><a href="#" class="page-link">«</a></li>
                              </c:if>

                              <c:forEach var="a" begin="${startpage}" end="${endpage }">

                                 <c:if test="${a==pageNum }">
                                    <li class="page-item"><a href="#" class="page-link">${a}</a></li>
                                 </c:if>
                                 <c:if test="${a!= pageNum }">
                                    <li class="page-item"><a
                                       href="customer-order.shop?userid=${sessionScope.loginUser.userid}&pageNum=${a}"
                                       class="page-link">${a}</a></li>
                                 </c:if>
                              </c:forEach>

                              <c:if test="${pageNum<maxpage }">
                                 <li class="page-item"><a
                                    href="customer-order.shop?userid=${sessionScope.loginUser.userid}&pageNum=${pageNum+1}"
                                    class="page-link">»</a></li>
                              </c:if>

                              <c:if test="${pageNum >= maxpage }">
                                 <li class="page-item"><a href="#" class="page-link">»</a></li>
                              </c:if>
                           </ul>
                        </nav>
                     </div>
                  </div>

               </div>
            
            </div>
          </div>
        </div>
      </div>
  </body>
</html>