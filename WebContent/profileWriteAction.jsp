<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="profile.Profile"%>
<%@ page import="profile.ProfileDAO"%>
<%@ page import="user.User" %>    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="profile" class="profile.Profile" scope="page" />
<jsp:setProperty name="profile" property="job" />
<jsp:setProperty name="profile" property="userPhone" />
<jsp:setProperty name="profile" property="sns" />
<jsp:setProperty name="profile" property="contents" />

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
			if (profile.getJob() == null || profile.getUserPhone() == null || profile.getSns() == null
					|| profile.getContents() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				ProfileDAO profileDAO = new ProfileDAO();
				int result = profileDAO.write(userID, profile.getJob(), profile.getUserPhone(), profile.getSns(), profile.getContents(),userSchoolSerialNumber, Year, userName);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('프로필 쓰기에 실패 했습니다.')");
					script.println("history.back()");
					script.println("</script>"); 
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href ='profilelist.jsp'");
					script.println("</script>");
				}
		}

		}
	%>
</body>
</html>