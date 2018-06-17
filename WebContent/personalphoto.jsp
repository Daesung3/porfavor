<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="info2.Info"%>
<%@ page import="info2.InfoDAO"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<!--반응형을 위한 메타 태그-->
<title>Graduate Album</title>
</head>
<body>
	<%
		String userID = null;
		String userSchoolSerialNumber = null;
		String Year = null;
		String userName = null;
		String userSchoolNumber = null;
		int pageNumber = 1;
		if (session.getAttribute("userID") != null) {
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
				<li class="active"><a href="personalphoto.jsp">PERSONAL
						PHOTO</a></li>
				<li><a href="groupphoto.jsp">GROUP PHOTO</a></li>
				<li><a href="profilelist.jsp">PROFILE</a></li>
				<li><a href="bbs.jsp">GUEST BOOK</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">LOGIN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LOG IN</a></li>
						<li><a href="signin.jsp">SIGN IN</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">LOGOUT<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">LOGOUT</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 애니메이션을 위한 부트스트랩 -->
	<br>
	<table class="table table=striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
		</thead>
		<tbody>
			<%
				InfoDAO InfoDAO = new InfoDAO();
				ArrayList<Info> list = InfoDAO.getList(userID);
				for (int i = 0; i < list.size(); i++) {
			%>
		<tr>
						<td><img src="<%= list.get(i).getPersonalPhoto() %>" class="img-rounded" style="height:200px; width:150px;"></td>
						<tr></tr>
						<td><%= list.get(i).getUserName()%></td>
					</tr>				
				<%
					}
				%>
				</tbody>
			</table>
	<br>
	<br>
	<div align='left'>
		<button type="button" class="btn btn-success">다음</button>
	</div>

</body>
</html>
