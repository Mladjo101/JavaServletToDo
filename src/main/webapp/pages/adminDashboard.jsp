<%@ page import="com.example.webzadacahamzaajdindise.models.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <button  class="btn-link" href="pages/login.jsp">Log out</button>
    <h2 class="mb-4">Admin Dashboard</h2>

    <!-- Display list of orders -->
    <div class="mx-auto">
        <a class="btn btn-primary mx-2" href="pages/createUser.jsp">Create User</a>
        <a class="btn btn-primary mx-2" href="pages/createTask.jsp">Create Task</a>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
