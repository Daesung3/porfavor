<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
<title>그때 그 시절..</title>
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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<a class="navbar-brand" href="main.jsp">그때 그 시절..</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="personalphoto.jsp">개인 사진</a></li>
				<li><a href="groupphoto.jsp">단체 사진</a></li>
				<li class="active"><a href="profilelist.jsp">프로필</a></li>
				<li><a href="bbs.jsp">방명록</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">LOGIN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">LogIn</a></li>
						<li><a href="join.jsp">SignIn</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
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
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table=striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">직업</th>
						<th style="background-color: #eeeeee; text-align: center;">연락처</th>
						<th style="background-color: #eeeeee; text-align: center;">SNS</th>
						<th style="background-color: #eeeeee; text-align: center;">한마디</th>
					</tr>
				</thead>
				<tbody>
				<%
					ProfileDAO profileDAO = new ProfileDAO();
					ArrayList<Profile> list = profileDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
				%>
					<tr>
						<td><%= list.get(i).getProfileID() %></td>
						<td><%= list.get(i).getUserID()%></td>
						<td><%= list.get(i).getJob() %></td>
						<td><%= list.get(i).getUserPhone() %></td>
						<td><%= list.get(i).getSns() %></td>
						<td><%= list.get(i).getContents() %></td>
					</tr>				
				<%
					}
				%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
					
				}if(profileDAO.nextPage(pageNumber+1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
			<% 					
				}
			%>
			<a href="profileWrite.jsp" class="btn btn-primary pull-right">프로필 쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 애니메이션을 위한 부트스트랩 -->
</body>
</html>