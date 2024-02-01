<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adminHeader.css">
    <style>
        body {
    margin: 0;
    padding: 0;
}

.admin-header {
    background-color: #333;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo img {
    height: 40px;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
}

.user-info {
    display: flex;
    align-items: center;
}

.user-info span {
    margin-right: 10px;
}

.user-info a {
    color: #FFD700;
    text-decoration: none;
}

    </style>
</head>
<body>
    
    <header class="admin-header">
        <div class="logo">
            <img src="logo.png" alt="Logo">
        </div>
        <nav class="nav-links">
            <a href="#">Dashboard</a>
            <a href="customerlist.jsp">Customers</a>
            <a href="#">Products</a>
            <a href="#">Orders</a>
            <a href="#">Settings</a>
        </nav>
        <div class="user-info">
            <span>Welcome, Admin</span>
            <a href="../logout.jsp">Logout</a>
        </div>
    </header>
</body>
</html>
