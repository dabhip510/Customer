<%@ page import="add.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminheadar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Customer</title>
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
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Added Successfully!</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong! Try Again!</h3>
	<%
	}
	%>

   <%
        int id = 1;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select max(id) from customers");
            while (rs.next()) {
                id = rs.getInt(1);
                id = id + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
	<form action="customerAction.jsp" method="post">


<h3 style="color: yellow;">Product ID: <%= id %></h3>
        <input type="hidden" name="id" value="<%= id %>">
		<div class="left-div">
			<h3>Enter Name</h3>
			<input type="text" id="firstName" name="firstName"><br>
			<hr>
		</div>

		<div class="right-div">
			<h3>LastName</h3>
			<input type="text" id="lastName" name="lastName"><br>
			<hr>
		</div>
		<div class="left-div">
			<h3>Street</h3>
			<input type="text" id="Street" name="Street"><br>
			<hr>
		</div>
		<div class="right-div">
			<h3>Address</h3>
			<input type="text" id="address" name="Address"><br>
			<hr>
		</div>

		<div class="left-div">
			<h3>City</h3>
			<input type="text" id="city" name="City"><br>
			<hr>
		</div>
		<div class="right-div">
			<h3>State</h3>
			<input type="text" id="state" name="State"><br>
			<hr>
		</div>
		<div class="left-div">
			<h3>email</h3>
			<input type="email" id="email" name="email"><br>
			<hr>
		</div>
		<div class="right-div">
			<h3>Phone</h3>
			<input type="tel" id="phone" name="Phone"><br>
			<hr>
		</div>

		<button class="SubmitS">Submit</button>
	</form>
</body>

</html>