<%
String email=request.getParameter("email");
String password=request.getParameter("password");

if("test@sunbasedata.com".equals(email) && "Test@123".equals(password)) {
    session.setAttribute("email", email);
    response.sendRedirect("admin/adminHome.jsp");
    
} else {
  
	response.sendRedirect("login.jsp?msg=notexist");
	}
%>
