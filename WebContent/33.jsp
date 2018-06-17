<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<!--반응형을 위한 메타 태그-->
<title>그때 그 시절..</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">그때 그 시절..</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="personalphoto.jsp">개인 사진</a></li>
				<li><a href="groupphoto.jsp">단체 사진</a></li>
				<li><a href="profilelist.jsp">프로필</a></li>
				<li><a href="bbs.jsp">방명록</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="login.jsp">회원가입</a></li>
					</ul>
					</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="signInAction.jsp">
					<h3 style="text-align: center;">Sign In</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일 주소" name="userEmail" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="휴대폰 번호" name="userPhone" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="학교 고유번호" name="userSchoolSerialNumber" maxlength="20">
					</div>
					<div class="linktag" style="text-align:center">
					<a href="https://www.meatwatch.go.kr/biz/bm/sel/schoolListPopup.do" target="_blank"> 학교 고유번호 찾기</a>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="3학년 학번 ex)30805" name="userSchoolNumber" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="졸업 연도" name="year" maxlength="50">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">			
				</form>
			</div>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 애니메이션을 위한 부트스트랩 -->
</body>
</html>