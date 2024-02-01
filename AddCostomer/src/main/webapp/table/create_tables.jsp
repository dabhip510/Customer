<%@page import="add.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try {
    Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        String q1 ="CREATE TABLE customers (id INT AUTO_INCREMENT PRIMARY KEY, firstName VARCHAR(50) , lastName VARCHAR(50), Street VARCHAR(50),  Address VARCHAR(100), City VARCHAR(50), State VARCHAR(50), email VARCHAR(100), Phone VARCHAR(15))";

        
         System.out.println("create table customers");
        
         st.execute(q1);
        
        System.out.println("Table created");
        con.close();
 
}
catch(Exception e)
{
    e.printStackTrace();
}
%>
