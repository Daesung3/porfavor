<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Graduate Album</title>
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
			<a class="navbar-brand" href="main.jsp">Graduate Album</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">MAIN</a></li>
				<li><a href="personalphoto.jsp">PERSONAL PHOTO</a></li>
				<li><a href="groupphoto.jsp">GROUP PHOTO</a></li>
				<li><a href="profilelist.jsp">PROFILE</a></li>
				<li><a href="bbs.jsp">GUEST BOOK</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">LOGIN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">LOG IN</a></li>
						<li><a href="signin.jsp">SIGN IN</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
		<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">Graduate Album</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PASSWORD"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userPostion" autocomplete="off" value="Graduate" checked>Graduate
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userPostion" autocomplete="off" value="Manager" checked>Manager
							</label>
						</div>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="Log In"> 
				</form>
					<div class="signInButton" style="margin-top: 10px;"><a href='signin.jsp'>
					<input type="submit"
						class="btn btn-primary form-control" value="Sing In"
						onclick="location.href='signin.jsp'"></a>
					</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>