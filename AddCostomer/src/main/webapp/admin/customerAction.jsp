<%@page import="add.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String Street = request.getParameter("Street");
String Address = request.getParameter("Address");
String City = request.getParameter("City");
String State = request.getParameter("State");
String email = request.getParameter("email");
String Phone = request.getParameter("Phone");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO customers (firstName, lastName, Street, Address, City, State, email, Phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    
    ps.setString(1, firstName);
    ps.setString(2, lastName);
    ps.setString(3, Street);
    ps.setString(4, Address);
    ps.setString(5, City);
    ps.setString(6, State);
    ps.setString(7, email);
    ps.setString(8, Phone);
    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        response.sendRedirect("customer.jsp?msg=done");
    } else {
        response.sendRedirect("customer.jsp?msg=wrong");
    }
} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("customer.jsp?msg=wrong");
}
%>
