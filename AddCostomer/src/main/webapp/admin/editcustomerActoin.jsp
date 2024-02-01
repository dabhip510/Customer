<%@ page import="add.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminheadar.jsp" %>

<%
String customerId = request.getParameter("customerId");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String Street = request.getParameter("Street");
String Address = request.getParameter("Address");
String city = request.getParameter("City");
String state = request.getParameter("State");
String email = request.getParameter("email");
String phone = request.getParameter("Phone");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE customers SET firstName=?, lastName=?,Street=?,Address=?, City=?, State=?, email=?, Phone=? WHERE id=?");

    ps.setString(1, firstName);
    ps.setString(2, lastName);
    ps.setString(3, Street);
    ps.setString(4, Address);
    ps.setString(5, city);
    ps.setString(6, state);
    ps.setString(7, email);
    ps.setString(8,phone);
    ps.setString(9,customerId);

    int rowsUpdated = ps.executeUpdate();

    if (rowsUpdated > 0) {
        response.sendRedirect("customerlist.jsp?msg=done");
    } else {
        response.sendRedirect("customerlist.jsp?msg=wrong");
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace(); 
    response.sendRedirect("customerlist.jsp?msg=error");
}
%>
