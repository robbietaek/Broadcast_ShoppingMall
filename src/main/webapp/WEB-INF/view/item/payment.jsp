<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>		
<!DOCTYPE html>
<html>
<head>
<title>반려내역</title>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">반려내역 리스트</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="../shop/index.shop?userid=${sessionScope.loginUser.userid }">Home</a></li>
						<li class="breadcrumb-item active">반려내역 리스트</li>
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
								<li class="nav-item"><a
									href="customer-order.shop?userid=${sessionScope.loginUser.userid}"
									class="nav-link"><i class="fa fa-list"></i> 주문 내역</a></li>
								<li class="nav-item"><a
									href="customer-wishlist.shop?userid=${sessionScope.loginUser.userid}"
									class="nav-link"><i class="fa fa-heart"></i> 찜한 상품</a></li>
								<li class="nav-item"><a
									href="payment.shop?userid=${sessionScope.loginUser.userid}"
									class="nav-link active"><i class="fa fa-list"></i> 반려 내역</a></li>
								<li class="nav-item"><a
									href="deliverysearch.shop?userid=${sessionScope.loginUser.userid}"
									class="nav-link"><i class="fa fa-sign-out"></i> 배송조회</a></li>
							</ul>
						</div>
					</div>
				</div>



				<div id="customer-orders" class="col-md-9">
					<p class="text-muted lead">
						궁금하신 점은 따로 <a href="contact.shop">문의</a>해주시고, 평일 AM 09 - PM 18 연락
						가능합니다.
					</p>

					<div class="d-flex justify-content-end">
						<div class="col-sm-5 text-right">
							<form action="sellingcomplete.shop" method="post" name="searchform">
								<div class="input-group">
									<input type="hidden" name="pageNum" value="1"> <select
										name="searchtype" style="width: 100px">
										<option value="">검색</option>
										<option value="saleid">판매번호</option>
										<option value="itemname">물품명</option>
										<option value="tema">카테고리</option>
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

					<div class="box mt-0 mb-lg-0">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>판매번호</th>
										<th>아이템번호</th>
										<th>카테고리</th>
										<th>물품명</th>
										<th>구매일자</th>
										<th>조회/변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${itemList}" var="i">
										<tr>
											<th>${i.saleid}</th>
											<td>${i.itemid}</td>
											<td>${fn:substring(i.tema,0,5)}</td>
											<td>${fn:substring(i.itemname,0,10)}</td>
											<td><fmt:formatDate value="${i.date}"
													pattern="yyyy년MM월dd일 HH시mm분ss초" /></td>
											<td><a href="takebackeddetail.shop?buyerid=${i.buyerid}&userid=${i.userid}&itemid=${i.itemid}&saleid=${i.saleid}"
												class="btn btn-template-outlined btn-sm">사유 조회</a> 
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="d-flex justify-content-center">
								<nav aria-label="Page navigation example">
									<ul class="pagination">


										<c:if test="${pageNum >1 }">
											<li class="page-item"><a
												href="selling.shop?userid=${sessionScope.loginUser.userid}&pageNum=${pageNum-1}"
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
													href="selling.shop?userid=${sessionScope.loginUser.userid}&pageNum=${a}"
													class="page-link">${a}</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${pageNum<maxpage }">
											<li class="page-item"><a
												href="selling.shop?userid=${sessionScope.loginUser.userid}&pageNum=${pageNum+1}"
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
	</section></body>
</body>
</html>