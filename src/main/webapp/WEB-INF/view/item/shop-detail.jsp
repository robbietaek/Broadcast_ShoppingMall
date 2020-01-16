<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>상품 상세 보기</title>
  </head>
  <body>
      <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">White Blouse</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="../shop/index.shop">Home</a></li>
                <li class="breadcrumb-item"><a href="../item/shop-category-left.shop">Ladies</a></li>
                <li class="breadcrumb-item"><a href="../item/shop-category-left.shop">Tops</a></li>
                <li class="breadcrumb-item active">White Blouse</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="row bar">
          
            <!-- LEFT COLUMN _________________________________________________________-->
            <div class="col-lg-12">
              <p class="lead">ARMANI에서 나온 흰색의 블라우스입니다. 아주 하늘하늘하고 예뻐요~</p>
              <p class="goToDescription"><a href="#details" class="scroll-to text-uppercase">스크롤을 내려 상품 상세 설명을 보세요.</a></p>
              <div id="productMain" class="row">
                <div class="col-sm-6">
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                    <div> <img src="../shop/img/detailbig1.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="../shop/img/detailbig2.jpg" alt="" class="img-fluid"></div>
                    <div> <img src="../shop/img/detailbig3.jpg" alt="" class="img-fluid"></div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="box">
                    <form>
                      <div class="sizes">
                        <h3>옵션-사이즈</h3>
                        <select class="bs-select">
                          <option value="small">Small</option>
                          <option value="medium">Medium</option>
                          <option value="large">Large</option>
                          <option value="x-large">X Large</option>
                        </select>
                      </div>
                      <p class="price">￦35000</p>
                      <p class="text-center">
                        <button type="submit" class="btn btn-template-outlined"><a href="../item/shop-basket.shop"><i class="fa fa-shopping-cart"></i> Add to cart</a></button>
                        <button type="submit" data-toggle="tooltip" data-placement="top" title="Add to wishlist" class="btn btn-default"><i class="fa fa-heart-o"></i></button>
                      </p>
                    </form>
                  </div>
                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="../shop/img/detailsquare.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="../shop/img/detailsquare2.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="../shop/img/detailsquare3.jpg" alt="" class="img-fluid"></button>
                  </div>
                </div>
              </div>
              <div id="details" class="box mb-4 mt-4">
                <p></p>
                <h4>제품 상세 설명</h4>
                <p>하얀 레이스, 라운드넥, 소매가 다소 짧음</p>
                <h4>재질 & 보관 방법</h4>
                <ul>
                  <li>폴리에스터</li>
                  <li>세탁 가능</li>
                </ul>
                <h4>사이즈와 핏</h4>
                <ul>
                  <li>적당한 픽</li>
                  <li>모델 사이즈 : 160cm, 몸무게 : 48kg, 신발 : 240, 사이즈는 s 착용중입니다.</li>
                </ul>
                <blockquote class="blockquote">
                  <p class="mb-0"><em>요즘 유행인 소재에 핏이 너무 예뻐요. 모델분도 소장하고 있는 제품이랍니다~</em></p>
                </blockquote>
              </div>
              <div id="product-social" class="box social text-center mb-5 mt-5">
                <h4 class="heading-light">share</h4>
                <ul class="social list-inline">
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="box text-uppercase mt-0 mb-small">
                    <h3>함께 보면 좋은 상품</h3>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product2.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">기본 티</a></h3>
                      <p class="price">￦21000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product3.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">토끼 헤어밴드</a></h3>
                      <p class="price">￦12000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product1.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">퍼 코트</a></h3>
                      <p class="price">￦85000</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="box text-uppercase mt-0 mb-small">
                    <h3>최근 본 상품</h3>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product3.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">레드 립스틱</a></h3>
                      <p class="price">￦32000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product1.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">블랙 가죽백</a></h3>
                      <p class="price">￦34000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6">
                  <div class="product">
                    <div class="image"><a href="#"><img src="../shop/img/product2.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">기본티 </a></h3>
                      <p class="price">￦21000</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>
</html>