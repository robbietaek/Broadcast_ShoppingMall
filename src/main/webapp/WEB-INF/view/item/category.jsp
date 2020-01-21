<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp" %>	
<!DOCTYPE html>
<html>
  <head>
    <title>카테고리</title>
  </head>
  <body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<c:if test="${param.tema == clothes}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Clothes</h4>
					</div>
				</c:if>
				<c:if test="${param.tema == food}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Food</h4>
					</div>
				</c:if>
				<c:if test="${param.tema == toy}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Toy</h4>
					</div>
				</c:if>
				<c:if test="${param.tema == music}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Music</h4>
					</div>
				</c:if>
				<c:if test="${param.tema == beauty}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Beauty</h4>
					</div>
				</c:if>
				<c:if test="${param.tema == sports}">
					<div class="col-md-7">
						<h1 class="h2">카테고리</h1>
						<h4>Sports</h4>
					</div>
				</c:if>										
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="index.shop">Home</a></li>
						<li class="breadcrumb-item active">Category</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
      <div id="content">
        <div class="container">
          <div class="row bar">
            <div class="col-md-3">
              <!-- MENUS AND FILTERS-->
              <div class="panel panel-default sidebar-menu">
                <div class="panel-heading">
                  <h3 class="h4 panel-title">Categories</h3>
                </div>
                <div class="panel-body">
                  <ul class="nav nav-pills flex-column text-sm category-menu">
                    <li class="nav-item"><a href="category.shop?tema=clothes" class="nav-link d-flex align-items-center justify-content-between"><span>Clothes</span><span class="badge badge-secondary">42</span></a>
                    </li>
                    <li class="nav-item"><a href="category.shop?tema=food" class="nav-link d-flex align-items-center justify-content-between"><span>Food </span><span class="badge badge-light">123</span></a>
                    </li>
                    <li class="nav-item"><a href="category.shop?tema=toy" class="nav-link d-flex align-items-center justify-content-between"><span>Toy  </span><span class="badge badge-secondary">11</span></a>
                    </li>
                    <li class="nav-item"><a href="category.shop?tema=music" class="nav-link d-flex align-items-center justify-content-between"><span>Music  </span><span class="badge badge-secondary">11</span></a>
                    </li>
                    <li class="nav-item"><a href="category.shop?tema=beauty" class="nav-link d-flex align-items-center justify-content-between"><span>Beauty  </span><span class="badge badge-secondary">11</span></a>
                    </li>
                    <li class="nav-item"><a href="category.shop?tema=sports" class="nav-link d-flex align-items-center justify-content-between"><span>Sports  </span><span class="badge badge-secondary">11</span></a>
                    </li>                                                            
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-9">
              <p class="text-muted lead"></p>
              <div class="row products products-big">
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product1.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">금발은 너무해</a></h3>
                      <p class="price">￦100000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product2.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">블라우스(흰색)</a></h3>
                      <p class="price">
                        <del>￦50000</del> ￦35000
                      </p>
                    </div>
                    <div class="ribbon-holder">
                      <div class="ribbon sale">SALE</div>
                      <div class="ribbon new">NEW</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product3.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">블라우스(블랙)</a></h3>
                      <p class="price">￦35000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product4.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">조거팬츠</a></h3>
                      <p class="price">￦29000</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product3.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">폴리스 후드집업</a></h3>
                      <p class="price">
                        <del>￦68000</del> ￦34000
                      </p>
                    </div>
                    <div class="ribbon-holder">
                      <div class="ribbon sale">SALE</div>
                      <div class="ribbon new">NEW</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <div class="product">
                    <div class="image"><a href="../item/shop-detail.shop"><img src="../shop/img/product4.jpg" alt="" class="img-fluid image1"></a></div>
                    <div class="text">
                      <h3 class="h5"><a href="../item/shop-detail.shop">스웨이드 롱부츠</a></h3>
                      <p class="price">￦43000</p>
                    </div>
                    <div class="ribbon-holder">
                      <div class="ribbon new">NEW</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 banner mb-small"><a href="#"><img src="../shop/img/banner2.jpg" alt="" class="img-fluid"></a></div>
              </div>
              <div class="pages">
                <p class="loadMore text-center"><a href="#" class="btn btn-template-outlined"><i class="fa fa-chevron-down"></i> Load more</a></p>
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                  <ul class="pagination">
                    <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-double-left"></i></a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>
</html>