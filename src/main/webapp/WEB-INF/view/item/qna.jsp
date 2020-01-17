<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>QNA</title>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">자주 묻는 질문</h1>
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



            <div class="col-md-9">
              <section>
                <p class="lead">자주 물으시는 질문과 그에 따르는 답변을 작성했습니다. 이곳에 원하시는 답변이 없다면 기타 문의를 통해 연락해주세요.</p>
                <div id="accordion" role="tablist">
                  <div class="card card-primary">
                    <div id="headingOne" role="tab" class="card-header">
                      <h5 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">1. 배송 관련</a></h5>
                    </div>
                    <div id="collapseOne" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                      <div class="card-body">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                        <ul>
                          <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                          <li>Aliquam tincidunt mauris eu risus.</li>
                          <li>Vestibulum auctor dapibus neque.</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="card card-primary">
                    <div id="headingTwo" role="tab" class="card-header">
                      <h5 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">2. 상품 관련</a></h5>
                    </div>
                    <div id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                      <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</div>
                    </div>
                  </div>
                  <div class="card card-primary">
                    <div id="headingThree" role="tab" class="card-header">
                      <h5 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed"> 3. 취소/반품</a></h5>
                    </div>
                    <div id="collapseThree" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                      <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</div>
                    </div>
                  </div>
                  <div class="card card-primary">
                    <div id="headingFour" role="tab" class="card-header">
                      <h5 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive" class="collapsed">  4. 쿠폰/공지사항</a></h5>
                    </div>
                    <div id="collapseFive" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                        <ul>
                          <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                          <li>Aliquam tincidunt mauris eu risus.</li>
                          <li>Vestibulum auctor dapibus neque.</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="card card-primary">
                    <div id="headingFive" role="tab" class="card-header">
                      <h5 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed"> 5. 그 외 문의사항</a></h5>
                    </div>
                    <div id="collapseThree" role="tabpanel" aria-labelledby="headingFive" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                        <ul>
                          <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                          <li>Aliquam tincidunt mauris eu risus.</li>
                          <li>Vestibulum auctor dapibus neque.</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <p class="text-muted">원하시는 질의응답이 없다면 이쪽으로  <a href="contact.shop">문의</a>해주시면 최선을 다해 도와드리겠습니다.</p>
              </section>
            </div>
				
			</div>
		</div>
	</section>
</body>
</html>