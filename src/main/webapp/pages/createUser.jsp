<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body{

            background-image: url('../blank-clipboard-with-grocery-cart.jpg'); /* Replace 'path/to/your/image.jpg' with the actual path to your image file */
            background-size: cover; /* Ensure the background image covers the entire viewport */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Do not repeat the background image */

        }
        .container {
            margin-top: 50px;
            padding-top: 50px;
        }

        .form-container {
            max-width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Create User</h2>
        <form action="${pageContext.request.contextPath}/createUser" method="post">
            <div class="form-group">
                <label for="inputEmail">Email:</label>
                <input type="email" class="form-control" id="inputEmail" name="email" required>
            </div>
            <div class="form-group">
                <label for="inputUsername">Username:</label>
                <input type="text" class="form-control" id="inputUsername" name="username" required>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password:</label>
                <input type="password" class="form-control" id="inputPassword" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Save User</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
