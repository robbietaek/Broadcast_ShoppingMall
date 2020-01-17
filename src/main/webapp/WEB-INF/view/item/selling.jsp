<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<title>판매 등록 물품 관리</title>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">판매 등록 물품 관리</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="index.shop">Home</a></li>
						<li class="breadcrumb-item active">Accordions</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="bar">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<!-- MENUS AND WIDGETS -->
					<div class="panel panel-default sidebar-menu with-icons">
						<div class="panel-heading">
							<h3 class="h4 panel-title">Menu</h3>
						</div>
						<div class="panel-body">
							<ul class="nav nav-pills flex-column text-sm">
								<li class="nav-item"><a href="sell.shop"
									class="nav-link">판매 등록</a></li>
								<li class="nav-item"><a href="selling.shop"
									class="nav-link">판매 등록 물품 관리</a></li>
								<li class="nav-item"><a href="takeback.shop"
									class="nav-link">반품 신청 목록 관리</a></li>
								<li class="nav-item"><a href="delivery.shop"
									class="nav-link">배송 관리</a></li>
								<li class="nav-item"><a href=".shop"
									class="nav-link">판매 통계</a></li>
								<li class="nav-item"><a href="qna.shop"
									class="nav-link">Q&A 관리</a></li>
								<li class="nav-item"><a href=".shop"
									class="nav-link">판매된 목록</a></li>
								<li class="nav-item"><a href=".shop"
									class="nav-link">반품/취소된 목록</a></li>
							</ul>
						</div>
					</div>
				</div>



				<div id="customer-orders" class="col-md-9">
					<p class="text-muted lead">
						궁금하신 점은 따로  <a
							href="contact.shop">문의</a>해주시고, 평일 AM 09 - PM 18 연락 가능합니다.
					</p>
					<div class="box mt-0 mb-lg-0">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문 날짜</th>
										<th>상품 총액</th>
										<th>상태</th>
										<th>상세보기</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${itemlist}" var="itemlist">
									<tr>
										<th>${itemlist.itemid}</th>
										<td>22/06/2013</td>
										<td>${itemlist.price}</td>
										<td><span class="badge badge-info">배송준비중</span></td>
										<td><a href="seller.shop?itemid=${itemlist.itemid}"
											class="btn btn-template-outlined btn-sm">View</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>