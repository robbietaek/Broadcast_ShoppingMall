<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>판매 등록</title>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">판매 등록</h1>
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
									<li class="nav-item"><a href="seller.shop"
									class="nav-link">판매 등록</a></li>
								<li class="nav-item"><a href="selled.shop"
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
				
				
				<div id="blog-post" class="col-md-9">
					<div id="comment-form">
						<h4 class="text-uppercase">상품등록하기</h4>
						<form:form modelAttribute="sellerpage" action="register.shop" enctype="multipart/form-data">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="name">상품제목 
											<span class="required text-primary">*</span>
										</label>
										<input name="subject" type="text" class="form-control">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<label for="email">카테고리
											<span class="required text-primary">*</span>
										</label>
										<input name="tema" type="text" class="form-control">
									</div>
								</div>
							</div>
														
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label for="email">아이템 명 / 가격 (추가하기 구현해야함) 
											<span class="required text-primary">*</span>
										</label> 
										<input name="itemname" type="text" class="form-control">
										<input name="price" type="text" class="form-control">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-5">
									<div class="form-group">
										<label for="email">슬라이드 사진 (최대 5장)
											<span class="required text-primary">*</span>
										</label><br> 
										<input type="file" name="picture1"><br>
										<input type="file" name="picture2"><br>
										<input type="file" name="picture3"><br>
										<input type="file" name="picture4"><br>
										<input type="file" name="picture5"><br>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-5">
									<div class="form-group">
										<label for="email">VOD 
											<span class="required text-primary">*</span>
										</label><br> 
										<input type="file" name="vod"/>
									</div>
								</div>
							</div>
														
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="comment">세부 설명 
											<span class="required text-primary">*</span>
										</label>
										<textarea name="description" cols="50" rows="13" class="form-control"></textarea>
									</div>
								</div>
							</div>
							<script>CKEDITOR.replace("comment",{
								filebrowserImageUploadUrl : "imgupload.shop"
								});
							</script>
							
							<div class="row">
								<div class="col-sm-12 text-right">
									<button class="btn btn-template-outlined">
										<i class="fa fa-comment-o"></i> 상품등록하기
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
				
				
			</div>
		</div>
	</section>
</body>
</html>