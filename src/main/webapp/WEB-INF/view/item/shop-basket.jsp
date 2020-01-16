<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>장바구니</title>
  </head>
  <body>
      <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">Shopping Cart</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="../shop/index.shop">Home</a></li>
                <li class="breadcrumb-item active">Shopping Cart</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="row bar">
            <div class="col-lg-12">
              <p class="text-muted lead">장바구니에 2개의 상품이 담겨져 있습니다.</p>
            </div>
            <div id="basket" class="col-lg-9">
              <div class="box mt-0 pb-0 no-horizontal-padding">
                <form method="get" action="../item/shop-checkout1.shop">
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th colspan="2">상품</th>
                          <th>수량</th>
                          <th>가격</th>
                          <th>할인</th>
                          <th colspan="2">총액</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><a href="../item/shop-detail.shop"><img src="../shop/img/detailsquare.jpg" alt="White Blouse Armani" class="img-fluid"></a></td>
                          <td><a href="../item/shop-detail.shop">블라우스 (white)</a></td>
                          <td>
                            <input type="number" value="2" class="form-control">
                          </td>
                          <td>￦25000</td>
                          <td>￦0</td>
                          <td>￦25000</td>
                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                        <tr>
                          <td><a href="../item/shop-detail.shop"><img src="../shop/img/basketsquare.jpg" alt="Black Blouse Armani" class="img-fluid"></a></td>
                          <td><a href="../item/shop-detail.shop">헤어 밴드</a></td>
                          <td>
                            <input type="number" value="1" class="form-control">
                          </td>
                          <td>￦40000</td>
                          <td>￦4000</td>
                          <td>￦36000</td>
                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
                        </tr>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="5">총액</th>
                          <th colspan="2">￦61000</th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <div class="box-footer d-flex justify-content-between align-items-center">
                    <div class="left-col"><a href="../item/shop-category-left.shop" class="btn btn-secondary mt-0"><i class="fa fa-chevron-left"></i> 쇼핑 계속하기</a></div>
                    <div class="right-col">
                      <button type="submit" class="btn btn-template-outlined">결제하기 <i class="fa fa-chevron-right"></i></button>
                    </div>
                  </div>
                </form>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="box text-uppercase mt-0 mb-2">
                    <h3>찜한 상품</h3>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product2.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">퍼 코트</a></h3>
                      <p class="price">￦55000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product3.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">청바지</a></h3>
                      <p class="price">￦31000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product1.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">운동화</a></h3>
                      <p class="price">￦42000</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <div id="order-summary" class="box mt-0 mb-4 p-0">
                <div class="box-header mt-0">
                  <h3>결제 내역</h3>
                </div>
                <p class="text-muted">배송은 주말과 공휴일을 제외한 3-4일 정도 소요될 수 있습니다.</p>
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>가격</td>
                        <th>￦65000</th>
                      </tr>
                      <tr>
                        <td>배송비</td>
                        <th>￦0</th>
                      </tr>
                      <tr>
                        <td>할인 가격</td>
                        <th>￦4000</th>
                      </tr>
                      <tr class="total">
                        <td>총 금액</td>
                        <th>￦61000</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="box box mt-0 mb-4 p-0">
                <div class="box-header mt-0">
                  <h4>쿠폰 등록</h4>
                </div>
                <p class="text-muted">쿠폰이 있다면 아래에 코드를 등록해주시기 바랍니다.</p>
                <form>
                  <div class="input-group">
                    <input type="text" class="form-control"><span class="input-group-btn">
                      <button type="button" class="btn btn-template-main"><i class="fa fa-gift"></i></button></span>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>
</html>