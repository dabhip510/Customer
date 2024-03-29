<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        #container {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            width: 300px;
        }

        .signup {
            padding: 20px;
        }

        .main h1 {
            color: #333;
            text-align: center;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
        }

        .error-message {
            color: #FF0000;
        }

        .input-box {
            margin-bottom: 15px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 6px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <div id='container'>
        <div class='signup'>
            <form action="loginAction.jsp" method="post">
                <div class="log">
                    <div class="main">
                        <h1>Login</h1>
                        <div class="message" id="messageDiv">
                            <p class="error-message" id="errorMessage"></p>
                        </div>
                        <div class="input-box">
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="input-box">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" class="btn">Login</button>
                    </div>
                </div>
            </form>
            <script>
                var msg = '<%= request.getParameter("msg") %>';

                if (msg === 'notexist') {
                    document.getElementById('errorMessage').innerText = 'Incorrect Username or Password';
                    document.getElementById('messageDiv').style.display = 'block';
                }
            </script>
        </div>
    </div>
</body>

</html>

