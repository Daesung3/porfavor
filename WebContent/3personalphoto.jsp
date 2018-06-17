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
<title>그때 그 시절..</title>
<style type="text/css">
a, a:hover {<!--
	color: #000000; -->
	text-decoration: none;
}
</style>
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
				<li class="active"><a href="personalphoto.jsp">개인 사진</a></li>
				<li><a href="groupphoto.jsp">단체 사진</a></li>
				<li><a href="profilelist.jsp">프로필</a></li>
				<li><a href="BSS.jsp">방명록</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">LOGIN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LogIn</a></li>
						<li><a href="signIn.jsp">SignIn</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="personalphoto.jsp">개인 사진</a></li>
						<li><a href="groupphoto.jsp">단체 사진</a></li>
						<li><a href="profilelist.jsp">프로필</a></li>
						<li><a href="BSS.jsp">방명록</a></li>
						<li><a href="logoutAction.jsp">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 애니메이션을 위한 부트스트랩 -->
	<button type="button" class="btn btn-info">3-1</button>
	<button type="button" class="btn btn-info">3-2</button>
	<button type="button" class="btn btn-info">3-3</button>
	<button type="button" class="btn btn-info">3-4</button>
	<button type="button" class="btn btn-info">3-5</button>
	<br>
			<table class="table table=striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
					</tr>
				</thead>
				<tbody>
				<%
					String userID = "null";
					userID = (String) session.getAttribute("userID");
					System.out.println(userID);
					InfoDAO InfoDAO = new InfoDAO();
					ArrayList<Info> list = InfoDAO.getList(userID);
					for(int i = 0; i < list.size(); i++) {
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