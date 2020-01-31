<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 상세 보기</title>

<script>
	$(document)
			.ready(
					function() {
						$("#btnRecommend")
								.on(
										'click',
										function() {
											if ($(this).prop('checked')) {
												$
														.ajax(
																"jjiminsert.shop?userid=${param.userid}&tema=${param.tema}&itemid=${param.itemid}",
																{
																	success : function(
																			data) {//콜백함수
																	},
																	error : function(
																			e) {
																	}
																})
												$(this)
														.parent()
														.attr('class',
																'btn btn-default fa fa-heart')
												cnt++;
											} else {
												$
														.ajax(
																"jjimdelete.shop?userid=${param.userid}&tema=${param.tema}&itemid=${param.itemid}",
																{
																	success : function(
																			data) {//콜백함수
																	},
																	error : function(
																			e) {
																	}
																})
												$(this)
														.parent()
														.attr('class',
																'btn btn-default fa fa-heart-o')
												cnt--;
											}
										});
					});
</script>


<script>
	$(document).ready(function() {
		$("#reviewview").hide();
		$("#QAview").hide();
		$("#detailactive").attr('class', '_detail active');

		$("#detail").click(function() {
			$("#detailview").show();
			$("#reviewview").hide();
			$("#QAview").hide();

			$("#detailactive").attr('class', '_detail active');
			$("#reviewactive").attr('class', '_review');
			$("#QAactive").attr('class', '_qna rignt_margin');
		});

		$("#review").click(function() {
			$("#detailview").hide();
			$("#reviewview").show();
			$("#QAview").hide();

			$("#detailactive").attr('class', '_detail');
			$("#reviewactive").attr('class', '_review active');
			$("#QAactive").attr('class', '_qna rignt_margin');
		});

		$("#QA").click(function() {
			$("#detailview").hide();
			$("#reviewview").hide();
			$("#QAview").show();

			$("#detailactive").attr('class', '_detail');
			$("#reviewactive").attr('class', '_review');
			$("#QAactive").attr('class', '_qna active rignt_margin');
		});
	});
</script>

<script>

function countup(){
	var cnt = $('#quantity').val()
	result = (Number(cnt)+1);
	$('#quantity').val(result)
}

function countdown(){
	var cnt = $('#quantity').val()
	result = (Number(cnt)-1);
	$('#quantity').val(result)
}

</script>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7"></div>
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
					<form:form modelAttribute="itemmanagement"
						action="sellingdetail.shop">
						<div class="row">
							<div class="col-sm-6">
								<div data-slider-id="1"
									class="owl-carousel shop-detail-carousel">
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
							<div class="col-sm-6">

								<div class="sizes" id="productMain">
									<h3 class="text-left" style="color: #2e2e2e;">
										&nbsp;&nbsp;&nbsp;${item.itemname}
										<c:if test="${!empty sessionScope.loginUser }">
											<label
												<c:if test="${jjimcount>0}">class="btn btn-default fa fa-heart"</c:if>
												<c:if test="${jjimcount==0}">class="btn btn-default fa fa-heart-o"</c:if>
												style="border: white; background-color: white; color: red; font-size: 100%;"
												class="text-right"> <input type="checkbox"
												data-toggle="tooltip" data-placement="top" title="찜하기"
												id="btnRecommend"
												<c:if test="${jjimcount>0}">checked="checked"</c:if>>
											</label>
										</c:if>
									</h3>
									<h4 class="text-left" style="color: #2e2e2e;">
										&nbsp;&nbsp;&nbsp;
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.price}" />
										원
									</h4>
								</div>

								<div id="details" class="box mb-7 mt-4 text-left">

									<div class="text-left">
										<h7 style="color: black;">방송 링크 </h7>
										&nbsp;&nbsp;&nbsp;
										<h7 style="color: grey;">${item.vod}</h7>
										<br>
										<h7 style="color: black;">배송 방법 </h7>
										&nbsp;&nbsp;&nbsp;
										<h7 style="color: grey;"> ${item.delivery}</h7>
										<br>
										<h7 style="color: black;">배송비 &nbsp;&nbsp;&nbsp; <a
											style="color: grey;"> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${item.deliverycost}" />원
										</a> <br>
										<h7 style="color: black; font: text-bold;">배송 안내 </h7>&nbsp;&nbsp;&nbsp;
										<h7 style="color: grey;"> <br>
										배송기간 : 2~10일 이내 (주말 및 공휴일 배송일에서 제외) <br>
										* 추가 배송비 : 제주 및 도서 산간 지역은 추가 배송비가 있습니다. <form:hidden
											path="itemid" value="${param.itemid }" /> <br>

										<div class="goods_payment" id="prod_selected_options">
											<div class="opt_block no-border order_quantity_area"
												style="height: auto;">
												<div class="area_tit holder">
													<span class="option_title inline-blocked"
														style="margin-bottom: 7px">수량</span>
												</div>
												<div class="area_count holder">
													<div class="option_btn_wrap" style="top: 0;">
														<div class="option_btn_tools" style="float: none;">

															<a href="javascript:countdown()"> <i
																class="fa fa-minus" aria-hidden="true"></i> <span
																class="sr-only">minus</span>
															</a> <input type="text" title="number" value="1"
																id ="quantity" name="quantity" class="form-control _order_count_mobile">

															<a href="javascript:countup();"> <i class="fa fa-plus"
																aria-hidden="true"></i> <span class="sr-only">plus</span>
															</a>
														</div>
														<div
															class="area_price absolute absolute_right absolute_middle">
															<span><fmt:formatNumber type="number"
																	maxFractionDigits="3" value="${item.price}" />원</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<br>

										<div class="opt_block total bottom">
											<p class="no-margin text-right" style="height: 50px;">
												<span class="body_font_color_70"> 총 상품금액(개)</span> <span
													class="total_price text-right"> <a
													style="color: grey;"> <fmt:formatNumber type="number"
															maxFractionDigits="3"
															value="${item.price*param.quantity+item.deliverycost}" />원
												</a>
												</span>
											</p>
										</div>

										<button type="submit" class="btn btn-template-outlined"
											style="width: 100%; height: 80px; font-size: 1.0rem">
											<i class="fa fa-shopping-cart"></i> BUY IT NOW!
										</button>
									</div>

								</div>
							</div>
						</div>
					</form:form>

					<div class="categorize review-box">
						<div class="_detail_detail_wrap fr-view" id="fixed_tab">
							<div class="detail_detail_wrap button_tab">
								<a class="prod_detail_detail _prod_detail_tab_target is_targer"
									name="prod_detail_detail"></a>
								<div class="_prod_detail_tab_fixed site_prod_nav_wrap"
									style="z-index: auto; position: static; top: auto;">
									<ul class="site_nav site_prod_nav" style="border:;">

										<li class="after_line holder table-cell" id="detail"><a class="_detail" id="detailactive">상세정보</a></li>

										<li class="after_line holder right_margin table-cell"
											id="review"><a class="_review"  id="reviewactive" style="color: #212121">구매평
												<span class="badge _review_count_text">12</span>
										</a></li>

										<li class="table-cell" id="QA"><a class="_qna"  id="QAactive">Q&A <span
												class="badge _qna_count_text">2</span>
										</a></li>
									</ul>
								</div>
								<div class="spacer"
									style="display: none; width: 1221px; height: 42px; float: none;"></div>
							</div>
						</div>



						<div id="detailview" class="box mb-4 mt-4">
							${item.description}</div>




						<div id="reviewview" class="box mb-4 mt-4">리뷰칸</div>

						<div id="QAview" class="box mb-4 mt-4">Q&A칸</div>


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