<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webzadacahamzaajdindise.models.User" %>
<%@ page import="com.example.webzadacahamzaajdindise.userLogic.CreateUserDAO" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.RequestDispatcher" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.example.webzadacahamzaajdindise.userLogic.CreateUserDAO" %>

<%
    // Fetch all users using the UserDAO
    CreateUserDAO createUserDAO = new CreateUserDAO();
    List<User> users = createUserDAO.getAllUsersExceptAdmin();

    // Set the users as a request attribute
    request.setAttribute("users", users);
%>

<html>
<head>
    <title>Create Task</title>
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
        <h2>Create Task</h2>
        <form action="${pageContext.request.contextPath}/tasks" method="post">
            <div class="form-group">
                <label for="inputDescription">Task Description:</label>
                <input type="text" class="form-control" id="inputDescription" name="description" required>
            </div>
            <div class="form-group">
                <label for="inputAssignee">Assign Task To:</label>
                <select class="form-control" id="inputAssignee" name="userId" required>
                    <% for (User user : users) { %>
                    <option value="<%= user.getId() %>"><%= user.getUsername() %></option>
                    <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Create Task</button>
        </form>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
