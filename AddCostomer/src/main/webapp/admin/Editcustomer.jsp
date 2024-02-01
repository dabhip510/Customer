<%@page import="add.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheadar.jsp"%>

<html>
<head>
    
    <title>Edit Customer</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        hr {
            border: 0.5px solid #ddd;
            margin: 20px 0;
        }

        .left-div,
        .right-div {
            width: 48%;
            display: inline-block;
            vertical-align: top;
        }

        .right-div {
            float: right;
        }
    </style>
</head>
<body>
    <h2>Edit Customer</h2>

    <%
    String customerId = request.getParameter("id");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE id=?");
        ps.setString(1, customerId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
    %>
  
        <form action="DeletecustomerAction.jsp" method="post">
            <input type="hidden" name="id" value='<%=rs.getString("id")%>'>
            <button type="submit" name="action" value="delete">Delete</button>
            
        </form>
  
    <form action="editcustomerActoin.jsp" method="post">

        <input type="hidden" name="customerId" value='<%=rs.getString("id")%>'>
        <div class="left-div">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" name="firstName" value='<%=rs.getString("firstName")%>'>

            <label for="Street">Street</label>
            <input type="text" id="Street" name="Street" value='<%=rs.getString("Street")%>'>

            <label for="City">City</label>
            <input type="text" id="city" name="City" value='<%=rs.getString("City")%>'>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value='<%=rs.getString("email")%>'>
        </div>

        <div class="right-div">
            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" name="lastName" value='<%=rs.getString("lastName")%>'>

            <label for="Address">Address</label>
            <input type="text" id="address" name="Address" value='<%=rs.getString("Address")%>'>

            <label for="State">State</label>
            <input type="text" id="state" name="State" value='<%=rs.getString("State")%>'>

            <label for="Phone">Phone</label>
            <input type="tel" id="phone" name="Phone" value='<%=rs.getString("Phone")%>'>
        </div>

        <hr>

        <button type="submit">Update</button>
    </form>
    
    <%
    }
    con.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>

    <!-- Add your scripts or additional content here -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous" type="text/javascript"></script>
</body>
<br>
<br>
<br>
</html>
