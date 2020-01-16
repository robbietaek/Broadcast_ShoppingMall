<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="heading-breadcrumbs">
		<div class="container">
			<div class="row d-flex align-items-center flex-wrap">
				<div class="col-md-7">
					<h1 class="h2">회원가입</h1>
				</div>
				<div class="col-md-5">
					<ul class="breadcrumb d-flex justify-content-end">
						<li class="breadcrumb-item"><a href="../shop/index.shop">Home</a></li>
						<li class="breadcrumb-item active">회원가입 / 로그인</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="box">
						<h2 class="text-uppercase">로그인</h2>
						<form:form modelAttribute="user" method="post"
							action="login.shop">
							<form:hidden path="name" class="form-control" value = "aa"/>
							<spring:hasBindErrors name="user">
								<font color="red"> <c:forEach
										items="${errors.globalErrors}" var="error">
										<spring:message code="${error.code}" />
									</c:forEach>
								</font>
							</spring:hasBindErrors>

							<div class="form-group">
								<form:input path="userid" class="form-control" placeholder="id"/>
								<font color="red"><form:errors path="userid" /></font>
							</div>
							<div class="form-group">
								<form:password path="pass" class="form-control" placeholder="password"/>
								<font color="red"><form:errors path="pass" /></font>
							</div>
							<p class="text-center">
								<button class="btn btn-template-outlined">
									<i class="fa fa-sign-in"></i> 로그인
								</button>
							</p>
						</form:form>
						<p class="text-center text-muted">아직 가입 안하셨나요?</p>
						<p class="text-center text-muted">
							<a href="../user/userEntry.shop"> <strong>등록하세요</strong></a> ! 단
							1분만 투자하시면 됩니다! 지금 가입하시면 할인 쿠폰 드려요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
