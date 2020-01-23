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

				<!-- LEFT COLUMN _________________________________________________________-->
				<div class="col-lg-12">
					<div class="sizes">
						<h1>${item.subject }</h1>
						<li class="breadcrumb-item active">${item.itemname}</li>
					</div>
					<p class="goToDescription">
						<a href="#details" class="scroll-to text-uppercase">스크롤을 내려 상품
							상세 설명을 보세요.</a>
					</p>
					<div id="productMain" class="row">
						<div class="col-sm-6">
							<div data-slider-id="1" class="owl-carousel shop-detail-carousel">
								<c:if test="${!empty item.pictureUrl1}">
									<div>
										<img src="img/${item.pictureUrl1}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty item.pictureUrl2}">
									<div>
										<img src="img/${item.pictureUrl2}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty item.pictureUrl3}">
									<div>
										<img src="img/${item.pictureUrl3}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty item.pictureUrl4}">
									<div>
										<img src="img/${item.pictureUrl4}" alt="" class="img-fluid">
									</div>
								</c:if>
								<c:if test="${!empty item.pictureUrl5}">
									<div>
										<img src="img/${item.pictureUrl5}" alt="" class="img-fluid">
									</div>
								</c:if>
							</div>
						</div>
						<div class="col-sm-6">
								<form>
									<div class="sizes">
										<h1>${item.itemname }
											<button type="submit" data-toggle="tooltip"
												data-placement="top" title="Add to wishlist"
												class="btn btn-default">
												<i class="fa fa-heart-o"></i>
											</button>
										</h1>
									</div>
									<p class="price">
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.price}" />
										원
									</p>
									<div class="text-right">
										<h4>${item.delivery }[2~3일뒤도착예정]</h4>
										<h5>
											배송료 :
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${item.deliverycost}" />
											원
										</h5>
									</div>
									<div id="details" class="box mb-4 mt-4 text-right">
										<button type="submit" class="btn btn-template-outlined">
											<a href="../item/shop-basket.shop"><i
												class="fa fa-shopping-cart"></i> 구매하기</a>
										</button>
									</div>
								</form>
							<div data-slider-id="1" class="owl-thumbs">
								<c:if test="${!empty item.pictureUrl1}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl1}" alt="" class="img-fluid"
											style="width: 85px; height: 85px">
									</button>
								</c:if>
								<c:if test="${!empty item.pictureUrl2}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl2}" alt="" class="img-fluid"
											style="width: 85px; height: 85px">
									</button>
								</c:if>
								<c:if test="${!empty item.pictureUrl3}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl3}" alt="" class="img-fluid"
											style="width: 85px; height: 85px">
									</button>
								</c:if>
								<c:if test="${!empty item.pictureUrl4}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl4}" alt="" class="img-fluid"
											style="width: 85px; height: 85px">
									</button>
								</c:if>
								<c:if test="${!empty item.pictureUrl5}">
									<button class="owl-thumb-item">
										<img src="img/${item.pictureUrl5}" alt="" class="img-fluid"
											style="width: 85px; height: 85px">
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