<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    	<a href="../buyerpage/customer-order.shop" 
                    		class="nav-link active">
                    		<i class="fa fa-list"></i> 주문 내역</a></li>
                    <li class="nav-item">
                    	<a href="../buyerpage/customer-wishlist.shop" 
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
              <p class="lead">주문번호 #1735 는 현재 <strong>22/06/2013</strong> 주문하셨고 <strong>준비중</strong>입니다.</p>
              <p class="lead text-muted">기타 궁금한 점이 있으시다면 <a href="../shop/contact.shop">문의</a>해주시고, 평일 AM 09 - PM 18 연락 가능합니다.</p>
              <div class="box">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th colspan="2" class="border-top-0">상품</th>
                        <th class="border-top-0">수량</th>
                        <th class="border-top-0">가격</th>
                        <th class="border-top-0">할인</th>
                        <th class="border-top-0">총액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a href="../item/shop-detail.shop"><img src="../shop/img/detailsquare.jpg" alt="White Blouse Armani" class="img-fluid"></a></td>
                        <td><a href="../item/shop-detail.shop">가죽 로퍼(브라운)</a></td>
                        <td>2</td>
                        <td>￦</td>
                        <td>￦</td>
                        <td>￦</td>
                      </tr>
                      <tr>
                        <td><a href="../item/shop-detail.shop"><img src="../shop/img/basketsquare.jpg" alt="Black Blouse Armani" class="img-fluid"></a></td>
                        <td><a href="../item/shop-detail.shop">퀴디치컵</a></td>
                        <td>1</td>
                        <td>￦</td>
                        <td>￦</td>
                        <td>￦</td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th colspan="5" class="text-right">가격</th>
                        <th>￦</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">배송비</th>
                        <th>￦</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">할인 가격</th>
                        <th>￦</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">총액</th>
                        <th>￦</th>
                      </tr>
                    </tfoot>
                  </table>
                </div>
                <div class="row addresses">
                  <div class="col-md-6 text-right">
                    <h3 class="text-uppercase">Invoice address</h3>
                    <p>John Brown<br>					    13/25 New Avenue<br>					    New Heaven<br>					    45Y 73J<br>					    England<br>					    Great Britain</p>
                  </div>
                  <div class="col-md-6 text-right">
                    <h3 class="text-uppercase">Shipping address</h3>
                    <p>John Brown<br>					    13/25 New Avenue<br>					    New Heaven<br>					    45Y 73J<br>					    England<br>					    Great Britain</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>
</html>