<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
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
						<li class="breadcrumb-item"><a
							href="../item/shop-category-left.shop">Ladies</a></li>
						<li class="breadcrumb-item"><a
							href="../item/shop-category-left.shop">Tops</a></li>
						<li class="breadcrumb-item active">White Blouse</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<div class="row bar">

				<c:set var="pictureUrl1" value="${item.pictureUrl1}" />
				<c:set var="pictureUrl2" value="${item.pictureUrl2}" />
				<c:set var="pictureUrl3" value="${item.pictureUrl3}" />
				<c:set var="pictureUrl4" value="${item.pictureUrl4}" />
				<c:set var="pictureUrl5" value="${item.pictureUrl5}" />



				<!-- LEFT COLUMN _________________________________________________________-->
				<div class="col-lg-12">
					<p class="lead">${item.subject}</p>
					<p class="goToDescription">
						<a href="#details" class="scroll-to text-uppercase">스크롤을 내려 상품
							상세 설명을 보세요.</a>
					</p>
					<div id="productMain" class="row">
						<div class="col-sm-6">
							<div data-slider-id="1" class="owl-carousel shop-detail-carousel">
								<c:if test="${!empty pictureUrl1}">
									<div>
										<img src="img/${item.pictureUrl1}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty pictureUrl2}">
									<div>
										<img src="img/${item.pictureUrl2}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty pictureUrl3}">
									<div>
										<img src="img/${item.pictureUrl3}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty pictureUrl4}">
									<div>
										<img src="img/${item.pictureUrl4}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty pictureUrl5}">
									<div>
										<img src="img/${item.pictureUrl5}" alt="" class="img-fluid">
									</div>
								</c:if>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="box">
								<form>
									<p class="price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원
									</p>
									<p class="text-center">
										<button type="submit" class="btn btn-template-outlined">
											<a href="../item/shop-basket.shop"><i
												class="fa fa-shopping-cart"></i> Add to cart</a>
										</button>
										<button type="submit" data-toggle="tooltip"
											data-placement="top" title="Add to wishlist"
											class="btn btn-default">
											<i class="fa fa-heart-o"></i>
										</button>
									</p>
								</form>
							</div>
							<div data-slider-id="1" class="owl-thumbs">
								<c:if test="${!empty pictureUrl1}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl1}" alt="" class="img-fluid">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl2}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl2}" alt="" class="img-fluid">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl3}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl3}" alt="" class="img-fluid">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl4}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl4}" alt="" class="img-fluid">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl5}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl5}" alt="" class="img-fluid">
									</button>
								</c:if>
							</div>
						</div>
					</div>
					<div id="details" class="box mb-4 mt-4">${item.description }
					</div>
					<div id="product-social" class="box social text-center mb-5 mt-5">
						<h4 class="heading-light">share</h4>
						<ul class="social list-inline">
							<li class="list-inline-item"><a href="#"
								data-animate-hover="pulse" class="external facebook"><i
									class="fa fa-facebook"></i></a></li>
							<li class="list-inline-item"><a href="#"
								data-animate-hover="pulse" class="external gplus"><i
									class="fa fa-google-plus"></i></a></li>
							<li class="list-inline-item"><a href="#"
								data-animate-hover="pulse" class="external twitter"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#"
								data-animate-hover="pulse" class="email"><i
									class="fa fa-envelope"></i></a></li>
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
								<div class="image">
									<a href="#"><img src="../shop/img/product2.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">기본 티</a>
									</h3>
									<p class="price">￦21000</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="product">
								<div class="image">
									<a href="#"><img src="../shop/img/product3.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">토끼 헤어밴드</a>
									</h3>
									<p class="price">￦12000</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="product">
								<div class="image">
									<a href="#"><img src="../shop/img/product1.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">퍼 코트</a>
									</h3>
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
								<div class="image">
									<a href="#"><img src="../shop/img/product3.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">레드 립스틱</a>
									</h3>
									<p class="price">￦32000</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="product">
								<div class="image">
									<a href="#"><img src="../shop/img/product1.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">블랙 가죽백</a>
									</h3>
									<p class="price">￦34000</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="product">
								<div class="image">
									<a href="#"><img src="../shop/img/product2.jpg" alt=""
										class="img-fluid image1"></a>
								</div>
								<div class="text">
									<h3 class="h5">
										<a href="../item/shop-detail.shop">기본티 </a>
									</h3>
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