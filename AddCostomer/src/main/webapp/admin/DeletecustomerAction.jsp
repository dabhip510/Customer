<%@page import="add.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE id=?");
    ps.setString(1, id);

    int deletedRows = ps.executeUpdate();
    con.close();

    if (deletedRows > 0) {
        response.sendRedirect("customerlist.jsp?msg=done");
    } else {
        response.sendRedirect("customerlist.jsp?msg=wrong");
    }
} catch (Exception e) {
    e.printStackTrace(); 
    response.sendRedirect("customerlist.jsp?msg=wrong");
}
%>
