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
					<h1 class="h2">${item.itemname}</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a
							href="../shop/index.shop?userid=${param.userid}">Home</a></li>
						<li class="breadcrumb-item"><a
							href="category.shop?userid=${param.userid}&tema=${param.tema}">Shopping</a></li>
						<li class="breadcrumb-item active">${item.itemname}</li>
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
				<div class="sizes">
				<h1>${item.subject }</h1>
				</div>
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
									<div class="sizes">
										<h1>${item.itemname }</h1>
									</div>
									<p class="price">
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.price}" />
										원
									</p>
									<p class="text-center">
										<button type="submit" class="btn btn-template-outlined">
											<a href="../item/shop-basket.shop"><i
												class="fa fa-shopping-cart"></i> 구매하기</a>
										</button>
										<button type="submit" data-toggle="tooltip"
											data-placement="top" title="Add to wishlist"
											class="btn btn-default">
											<i class="fa fa-heart-o"></i>
										</button>
									</p>
									<div id="details" class="box mb-4 mt-4 text-right">
										<p></p>
										<h4>${item.delivery }</h4><h5>배송료 : <fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.deliverycost}" />원</h5>
									</div>
								</form>
							</div>
							<div data-slider-id="1" class="owl-thumbs">
								<c:if test="${!empty pictureUrl1}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl1}" alt="" class="img-fluid" style = "width : 200; height : 200">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl2}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl2}" alt="" class="img-fluid" style = "width : 200; height : 200">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl3}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl3}" alt="" class="img-fluid" style = "width : 200; height : 200">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl4}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl4}" alt="" class="img-fluid" style = "width : 200; height : 200">
									</button>
								</c:if>
								<c:if test="${!empty pictureUrl5}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl5}" alt="" class="img-fluid" style = "width : 200; height : 200">
									</button>
								</c:if>
							</div>
						</div>
					</div>
					<div id="details" class="box mb-4 mt-4">${item.description }
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>