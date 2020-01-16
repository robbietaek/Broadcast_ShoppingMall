<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><decorator:title /></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="../shop/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="../shop/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
	href="../shop/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
	href="../shop/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="../shop/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="../shop/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="../shop/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="../shop/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="../shop/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="../shop/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../shop/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../shop/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../shop/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../shop/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../shop/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../shop/img/apple-touch-icon-152x152.png">

<script src="../shop/vendor/jquery/jquery.min.js"></script>
<script src="../shop/vendor/popper.js/umd/popper.min.js"></script>
<script src="../shop/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../shop/vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="../shop/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="../shop/vendor/jquery.counterup/jquery.counterup.min.js"></script>
<script src="../shop/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="../shop/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
<script src="../shop/js/jquery.parallax-1.1.3.js"></script>
<script src="../shop/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="../shop/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
<script src="../shop/js/front.js"></script>
<decorator:head />
</head>

<body>
	<div id="all">
		<!-- Top bar-->
		<div class="top-bar">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-md-6 d-md-block d-none">
						<p>1인 크리에이터 쇼핑몰</p>
					</div>
					<div class="col-md-6">
						<div class="d-flex justify-content-md-end justify-content-between">
							<ul class="list-inline contact-info d-block d-md-none">
								<li class="list-inline-item"><a href="#"> <i
										class="fa fa-phone"></i></a></li>
								<li class="list-inline-item"><a href="#"> <i
										class="fa fa-envelope"></i></a></li>
							</ul>
							<div class="login">

								<c:if test="${empty sessionScope.loginUser}">
									<a href="../user/login.shop" class="login-btn"><i
										class="fa fa-sign-in"></i> <span
										class="d-none d-md-inline-block">로그인</span></a>

									<a href="../user/userEntry.shop" class="signup-btn"> <i
										class="fa fa-user"></i> <span class="d-none d-md-inline-block">회원가입</span></a>
								</c:if>
								<c:if test="${!empty sessionScope.loginUser}">
									<a href="../shop/mypage.shop?userid=${sessionScope.loginUser.userid}" class="signup-btn"> <i
										class="fa fa-user"></i> <span class="d-none d-md-inline-block">Mypage</span></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Top bar end-->

		<!-- Navbar Start-->
		<header class="nav-holder make-sticky">
			<div id="navbar" role="navigation" class="navbar navbar-expand-lg">
				<div class="container">
					<a href="../shop/index.shop" class="navbar-brand home">
						<img src="img/logo.png" alt="Universal logo"
							class="d-none d-md-inline-block">
						<img src="img/logo-small.png" alt="Universal logo"
							class="d-inline-block d-md-none">
						<span class="sr-only">Universal - go to homepage</span></a>
					<button type="button" data-toggle="collapse"
							data-target="#navigation"
							class="navbar-toggler btn-template-outlined">
						<span class="sr-only">Toggle navigation</span>
						<i class="fa fa-align-justify"></i>
					</button>
					<div id="navigation" class="navbar-collapse collapse">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item dropdown active">
								<a href="../shop/index.shop">홈 
									<b class="caret"></b></a></li>
									
							<li class="nav-item dropdown menu-large">
								<a href="#" data-toggle="dropdown" 
									class="dropdown-toggle">카테고리 
									<b class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-lg-3 col-md-6">
												<h5>Men</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">T-shirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Shirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Pants</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Accessories</a></li>
												</ul>
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Ladies</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">T-shirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Skirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Pants</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Accessories</a></li>
												</ul>
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Kids</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">T-shirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Pants</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Skirts</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">Accessories</a></li>
												</ul>
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>Brands</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">NIKE</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">ADIDAS</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">UMBRO</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">PUMA</a></li>
													<li class="nav-item">
														<a href="../item/shop-category-left.shop" 
															class="nav-link">MAHAGRID</a></li>
													<li class="nav-item">
														<a href="../shop-category-left.shop" 
															class="nav-link">NORTHFACE</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</li>
							
							<li class="nav-item dropdown menu-large">
								<a href="#" data-toggle="dropdown" 
									class="dropdown-toggle">VOD
									<b class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-lg-6">
												<img src="img/template-easy-customize.png" alt=""
													class="img-fluid d-none d-lg-block">
											</div>
											<div class="col-lg-3 col-md-6">
												<h5>ETC</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../broadcast/vodreplay.shop" class="nav-link">최신 VOD</a></li>
													<li class="nav-item">
														<a href="../broadcast/vodreplay.shop"
															class="nav-link">인기 VOD</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</li>							
							<!-- ========== FULL WIDTH MEGAMENU ==================-->
							<li class="nav-item dropdown menu-large">
								<a href="#" data-toggle="dropdown" 
									data-hover="dropdown" data-delay="200"
									class="dropdown-toggle">소통
									<b class="caret"></b></a>
								<ul class="dropdown-menu megamenu">
									<li>
										<div class="row">
											<div class="col-lg-6">
												<img
													src="https://cdn.pixabay.com/photo/2016/11/03/18/19/social-media-1795578_1280.jpg"
													alt="" class="img-fluid d-none d-lg-block">
											</div>
											<div class="col-md-6 col-lg-3">
												<h5>공지사항</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../border/list.shop?tema=1" 
															class="nav-link">
															공지사항</a></li>
												</ul>
											</div>
											<div class="col-md-6 col-lg-3">
												<h5>게시판</h5>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../border/list.shop?tema=2" 
															class="nav-link">
														건의사항</a></li>
												</ul>
												<ul class="list-unstyled mb-3">
													<li class="nav-item">
														<a href="../border/list.shop?tema=3" 
															class="nav-link">
														자유게시판</a></li>
												</ul>
											</div>
											<div class="col-md-6 col-lg-3"></div>
											<div class="col-md-6 col-lg-3"></div>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<div id="search" class="collapse clearfix">
						<form role="search" class="navbar-form">
							<div class="input-group">
								<input type="text" placeholder="Search" 
									class="form-control">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>
		<!-- Navbar End-->

		<decorator:body />

		<!-- GET IT-->
		<!-- FOOTER -->
		<footer class="main-footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<h4 class="h6">About Us</h4>
						<p>Pellentesque habitant morbi tristique senectus et netus et
							malesuada fames ac turpis egestas.</p>
						<hr>
						<h4 class="h6">Join Our Monthly Newsletter</h4>
						<form>
							<div class="input-group">
								<input type="text" class="form-control">
								<div class="input-group-append">
									<button type="button" class="btn btn-secondary">
										<i class="fa fa-send"></i>
									</button>
								</div>
							</div>
						</form>
						<hr class="d-block d-lg-none">
					</div>
					<div class="col-lg-3">
						<h4 class="h6">Blog</h4>
						<ul class="list-unstyled footer-blog-list">
							<li class="d-flex align-items-center">
								<div class="image">
									<img src="img/detailsquare.jpg" alt="..." 
										class="img-fluid">
								</div>
								<div class="text">
									<h5 class="mb-0">
										<a href="post.shop">Blog post name</a>
									</h5>
								</div>
							</li>
							<li class="d-flex align-items-center">
								<div class="image">
									<img src="img/detailsquare.jpg" alt="..." 
										class="img-fluid">
								</div>
								<div class="text">
									<h5 class="mb-0">
										<a href="post.shop">Blog post name</a>
									</h5>
								</div>
							</li>
							<li class="d-flex align-items-center">
								<div class="image">
									<img src="img/detailsquare.jpg" alt="..." 
										class="img-fluid">
								</div>
								<div class="text">
									<h5 class="mb-0">
										<a href="post.shop">Very very long blog post name</a>
									</h5>
								</div>
							</li>
						</ul>
						<hr class="d-block d-lg-none">
					</div>
					<div class="col-lg-3">
						<h4 class="h6">Contact</h4>
						<p class="text-uppercase">
							<strong>Universal Ltd.</strong>
							<br>13/25 New Avenue <br>Newtown upon River
							<br>45Y 73J <br>England 
							<br> <strong>Great Britain</strong>
						</p>
						<a href="../shop/contact.shop" class="btn btn-template-main">
							Go to contact page</a>
						<hr class="d-block d-lg-none">
					</div>
					<div class="col-lg-3">
						<ul class="list-inline photo-stream">
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare.jpg" alt="..." 
										class="img-fluid"></a></li>
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare2.jpg" alt="..." 
										class="img-fluid"></a></li>
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare3.jpg" alt="..." 
										class="img-fluid"></a></li>
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare3.jpg" alt="..." 
										class="img-fluid"></a></li>
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare.jpg" alt="..." 
										class="img-fluid"></a></li>
							<li class="list-inline-item">
								<a href="#">
									<img src="img/detailsquare2.jpg" alt="..." 
										class="img-fluid"></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copyrights">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 text-center-md">
							<p>&copy; 2020. GOODEE / 김경택 양영원 조형도 최보예</p>
						</div>
						<div class="col-lg-8 text-right text-center-md">
							<p>Template design is good</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>