<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 / 로그인</title>
<script type="text/javascript">
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("pictureForm.shop", "", op);
	}
</script>
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
						<h2 class="text-uppercase">회원가입</h2>
						<p class="lead">아직 회원이 아니신가요?</p>
						<p>가입을 통해 합리적인 가격과 세련된 디자인의 상품들을 구경하세요! 가입까지 1분이면 됩니다! 가입 후에
							모든 페이지를 이용해보세요!</p>
						<p class="text-muted">
							기타 문의사항이 있다면 연락주세요.<a href="../shop/contact.shop">쪽지</a> 평일 AM 09
							- PM 18 문의 가능합니다.
						</p>
						<hr>
						<form:form modelAttribute="user" method="post"
							action="userEntry.shop">
							<spring:hasBindErrors name="user">
								<font color="red"> <c:forEach
										items="${errors.globalErrors}" var="error">
										<spring:message code="${error.code}" />
									</c:forEach>
								</font>
							</spring:hasBindErrors>
							<br>
							<br>
							<input type="hidden" name="picture" value="">
							<img src="" width="100" height="120" id="pic">
							<hr>
							<font size="1"> <a href="javascript:win_upload()">사진등록</a></font>


							<div class="form-group">
								<label for="name-login">아이디</label>
								<form:input path="userid" class="form-control"
									placeholder="3자 이상 10자 이하" />
								<font color="red"><form:errors path="userid" /></font>
							</div>

							<div class="form-group">
								<label for="password-login">비밀번호</label>
								<form:password path="pass" class="form-control" />
								<font color="red"><form:errors path="pass" /></font>
							</div>

							<div class="form-group">
								<label for="email-login">닉네임</label>
								<form:input path="nickname" class="form-control" />
								<font color="red"><form:errors path="nickname" /></font>
							</div>

							<div class="form-group">
								<label for="email-login">이름</label>
								<form:input path="name" class="form-control" />
								<font color="red"><form:errors path="name" /></font>
							</div>

							<div class="form-group">
								<label for="email-login">나이</label>
								<form:input path="age" class="form-control" />
								<font color="red"><form:errors path="age" /></font>
							</div>

							<div class="form-group">
								<label for="email-login">전화번호</label>
								<form:input path="tel" class="form-control"
									placeholder="010-1234-5678" />
								<font color="red"><form:errors path="tel" /></font>
							</div>

							<div class="form-group">
								<label for="email-login">주소</label>
								<form:input path="address" class="form-control" />
								<font color="red"><form:errors path="address" /></font>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="email-login">이메일</label>
										<form:input path="email" class="form-control"
											style="width:100%" />
										<font color="red"><form:errors path="email" /></font>
									</div>
								</div>
								<div class="col-sm-1">
									<div class="form-group">
										<label for="email-login">　</label>
										<input type="text" class="form-control" value="@" disabled="disabled">
									</div>
								</div>
								<div class="col-sm-5">
									<div class="form-group">
										<label for="email-login">　</label>
										<form:select path="email" class="form-control" 
												style="width: 100%">
											<option value="@naver.com">@naver.com<option>
											<option value="@hanmail.net">@hanmail.net</option>
											<option value="@gmail.com">@gmail.com</option>
											<option value="@yahoo.co.kr">@yahoo.co.kr</option>
											<option value="@nate.com">@nate.com</option>
											<option value="">직접 입력</option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-template-outlined">
									<i class="fa fa-user-md"></i> 가입하기
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>