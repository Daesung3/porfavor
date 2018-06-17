<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="profile.ProfileDAO"%>
<%@ page import="profile.Profile"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<!--반응형을 위한 메타 태그-->
<title>Graduate Album</title>
<style type="text/css">
	a, a:hover {
		<!--color: #000000;-->
		text-decoration: none;
	}
</style>
</head>
<body>
<%
		String userID = null;
		String userSchoolSerialNumber = null;
		String Year = null;
		String userName = null;
		String userSchoolNumber = null;
		int pageNumber = 1;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			User user = new UserDAO().getUser(userID);
			userName = user.getUserName();
			userSchoolSerialNumber = user.getUserSchoolSerialNumber();
			Year = user.getYear();
			userSchoolNumber = user.getUserSchoolNumber();
			
		}
	%>
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
				<li class="active"><a href="profilelist.jsp">PROFILE</a></li>
				<li><a href="bbs.jsp">GUEST BOOK</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">LOGIN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LOG IN</a></li>
						<li><a href="signin.jsp">SIGN IN</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
					
			%>
						<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">LOGOUT<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
					</ul>
				</li>
			</ul>
			<%
				} 
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="profileWriteAction.jsp">
			<table class="table table=striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">직업</th>
						<th style="background-color: #eeeeee; text-align: center;">연락처</th>
						<th style="background-color: #eeeeee; text-align: center;">FacebookID</th>
						<th style="background-color: #eeeeee; text-align: center;">한마디</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="직업" name="job" maxlength="20"></td>
						<td><input type="text" class="form-control" placeholder="연락처" name="userPhone" maxlength="20"></td>
						<td><input type="text" class="form-control" placeholder="FacebookID" name="sns" maxlength="30"></td>
						<td><input type="text" class="form-control" placeholder="나의 한마디" name="contents" maxlength="50"></td>
					</tr>				
				</tbody>
			</table>
			<input type="submit" href="write.jsp" class="btn btn-primary pull-right" value="프로필 쓰기">
		</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 애니메이션을 위한 부트스트랩 -->
</body>
</html>