<%@ page import="add.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminheadar.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Mobile Shop</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<!-- bootstrap links -->
<link href="bootstrap.css" rel="stylesheet">

<style type="text/css">
body {
	background-color: black;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	color: white;
}

.nav-link {
	background-color: blue;
}

#navbar a {
	color: white;
	border-radius: 4px;
	height: 30px;
	text-align: center;
	padding: 5px 10px;
	margin-right: 10px;
}

#navbar .form-control {

	height: 30px;
	margin-right: 10px;
}

h2 {
	text-align: center;
	color: white;
	margin-top: 20px;
}
</style>
</head>

<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Successfully Updated!</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong! Try again!</h3>
	<%
	}
	%>
	<h2>Customer List</h2>

	<nav class="navbar navbar-expand-lg" id="navbar">
		<div class="container-fluid" style="border-bottom: 1px solid white;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				style="margin-bottom: 10px;">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="customer.jsp">Add
							Customer</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"style="
    background-color: #a1a1b3;">
							Search </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-color: black;">
							<li><a class="dropdown-item"
								href="customerlist.jsp?searchBy=firstName">First Name</a></li>
							<li><a class="dropdown-item"
								href="customerlist.jsp?searchBy=city">City</a></li>
							<li><a class="dropdown-item"
								href="customerlist.jsp?searchBy=email">Email</a></li>
							<li><a class="dropdown-item"
								href="customerlist.jsp?searchBy=phone">Phone</a></li>
						</ul></li>
					<form class="d-flex" id="search" action="customerlist.jsp"
						method="get">
						<input type="hidden" name="searchBy"
							value='<%=request.getParameter("searchBy")%>'> <input
							class="form-control me-2" type="search" name="searchTerm"
							placeholder="Search" aria-label="Search"
							value='<%=request.getParameter("searchTerm")%>'>
						<button class="btn btn-outline-success" type="submit"
							style="height: 30px; background-color: blue; color: white; margin-left: -13px;">
							<p style="margin-top: -5px;">Search</p>
						</button>
					</form>
				</ul>
			</div>
		</div>
	</nav>

	<table>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Action</th>
		</tr>
		<%
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();

			String searchBy = request.getParameter("searchBy");
			String searchTerm = request.getParameter("searchTerm");
			String query = "SELECT * FROM customers";
			if (searchBy != null && searchTerm != null && !searchTerm.isEmpty()) {
				query += " WHERE " + searchBy + " LIKE '%" + searchTerm + "%'";
			}

			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>

			<td><form action="DeletecustomerAction.jsp" method="post">
					<input type="hidden" name="id" value='<%=rs.getString("id")%>'>
					<button type="submit" name="action" value="delete"
						style="background-color: transparent; border: none;">
						<a href="DeleteCustomerServlet?id=7" class="delete-icon"><i
							class="fas fa-minus-circle"
							style="color: red; background-color: transparent; background-color: transparent; border: none;"></i></a>
					</button>
					<a href="Editcustomer.jsp?id=<%=rs.getString(1)%>"><i
						class="fas fa-pencil-alt"></i></a>
				</form></td>
		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous" type="text/javascript"></script>

</body>

</html>
