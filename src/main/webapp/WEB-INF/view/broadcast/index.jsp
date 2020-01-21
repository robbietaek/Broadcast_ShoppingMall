<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template-->
<link href="../broadcast/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../broadcastcss/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<section
						style="background: url('../shop/img/photogrid.jpg') center center repeat; background-size: cover;"
						class="relative-positioned">
						<!-- Carousel Start-->
						<div class="home-carousel">
							<div class="dark-mask mask-primary"></div>
							<div class="container">
								<div class="homepage owl-carousel">
									<div class="item">
										<div class="row">
											<div class="col-md-5 text-right">
												<p>
													<img src="../shop/img/logo.png" alt="" class="ml-auto">
												</p>
												<h1>NIKE</h1>
												<p>
													Newer 신상품<br>가벼운 착용감. 세련된 디자인.<br> 다양한 색상. 합리적인
													가격.
												</p>
											</div>
											<div class="col-md-7">
												<img
													src="https://cdn.pixabay.com/photo/2015/07/27/18/53/jump-863058_1280.jpg"
													alt="" class="img-fluid">
											</div>
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-md-7 text-center">
												<img
													src="https://cdn.pixabay.com/photo/2018/03/26/19/49/food-3263812_1280.jpg"
													alt="" class="img-fluid">
											</div>
											<div class="col-md-5">
												<h2>ADIDAS</h2>
												<ul class="list-unstyled">
													<li>We love soccer!</li>
													<li>Together for a long time!</li>
													<li>Google maps, Forms, Megamenu, CSS3 Animations and
														much more</li>
													<li>+ 11 extra pages showing template features</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-md-5 text-right">
												<h1>CONVERSE</h1>
												<ul class="list-unstyled">
													<li>Clean and elegant design</li>
													<li>Easily matched with all clothing!</li>
													<li>Easily readable Roboto font and awesome icons</li>
													<li>7 preprepared colour variations</li>
												</ul>
											</div>
											<div class="col-md-7">
												<img
													src="https://cdn.pixabay.com/photo/2015/09/05/22/28/converse-925773_1280.jpg"
													alt="" class="img-fluid">
											</div>
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-md-7">
												<img
													src="https://cdn.pixabay.com/photo/2016/11/03/18/19/social-media-1795578_1280.jpg"
													alt="" class="img-fluid">
											</div>
											<div class="col-md-5">
												<h1>Let's share!</h1>
												<ul class="list-unstyled">
													<li>7 preprepared colour variations.</li>
													<li>Easily to change fonts</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Carousel End-->
					</section>
				</div>
			</div>
			<br>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="d-flex justify-content-end">
						<div class="col-sm-5 text-right">
							<form action="category.shop?tema=${param.tema}" method="post"
								name="searchform">
								<div class="input-group">
									<input type="hidden" name="pageNum" value="1"> <select
										name="searchtype" style="width: 100px">
										<option value="">검색</option>
										<option value="itemname">물품명</option>
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
					<br>

					<p class="text-muted lead"></p>
					<div class="row products products-big">

						<c:forEach items="${userList}" var="u">
							<div class="col-lg-2 col-md-6">
								<div class="product">
									<div class="image">
										<a href="../shop/index.shop?userid=${u.userid}"><img
											src="../user/pic/${u.profileUrl}" alt=""
											class="img-fluid image1"></a>
									</div>
									<div class="text">
										<h3 class="h5">
											<a href="../shop/index.shop?userid=${u.userid}">${u.name}</a>
										</h3>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="pages">
						<div class="d-flex justify-content-center">
							<nav aria-label="Page navigation example">
								<ul class="pagination">

									<c:if test="${pageNum >1 }">
										<li class="page-item"><a
											href="index.shop?tema=${param.tema}&pageNum=${pageNum-1}"
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
												href="index.shop?tema=${param.tema}&pageNum=${a}"
												class="page-link">${a}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${pageNum<maxpage }">
										<li class="page-item"><a
											href="index.shop?tema=${param.tema}&pageNum=${pageNum+1}"
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