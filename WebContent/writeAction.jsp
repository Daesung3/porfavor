<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>    
<%@ page import="user.UserDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--반응형을 위한 메타 태그-->
<title>그때 그 시절..</title>
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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')"); // 비밀번호 틀리다고알람!
			script.println("location.href = 'login.jsp'"); // 이전 페이지로 사용자를 돌려보냄 
			script.println("</script>");
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				System.out.println(userID);
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(),userSchoolSerialNumber,Year);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다..')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href ='bbs.jsp'");
					script.println("</script>");
				}

			}
		}
	%>
</body>
</html>