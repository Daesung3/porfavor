<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>    
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
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
				<li><a href="profilelist.jsp">PROFILE</a></li>
				<li class="active"><a href="bbs.jsp">GUEST BOOK</a></li>
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
			<table class="table table=striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber,userSchoolSerialNumber,Year);
					for(int i = 0; i < list.size(); i++) {
				%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href=view.jsp?bbsID=<%= list.get(i).getBbsID()%>><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) +  list.get(i).getBbsDate().substring(11, 13) + " 시 " + list.get(i).getBbsDate().substring(14, 16)+ " 분 " %></td>
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
					
				}if(bbsDAO.nextPage(pageNumber+1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
			<% 					
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>