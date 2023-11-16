<%@ page import="com.example.webzadacahamzaajdindise.models.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webzadacahamzaajdindise.task.TaskDAO" %>
<%@ page pageEncoding="UTF-8" %>
<%
    HttpSession sessioon = request.getSession();
    int userId = (int) sessioon.getAttribute("userId");
    TaskDAO taskDAO = new TaskDAO();
    List<Task> tasks = taskDAO.getTasksByUserId(userId);

    // Set the users as a request attribute
    request.setAttribute("tasks", tasks);
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .card {
            width: 18rem;
            margin-bottom: 20px;
            background-color: cadetblue;
            color: white;
            font-size: 20px;
        }

        .checkmark {
            color: green;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <button class="btn-link" href="pages/login.jsp">Log out</button>
    <h2 class="mb-4">User Dashboard</h2>

    <!-- Display list of tasks as cards -->
    <div class="col" style="justify-content: center">
        <% for (Task task : tasks) { %>
        <div class="row">
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/deleteTask" method="post">
                    <input type="hidden" name="taskId" value="<%= task.getId() %>">
                    <div class="row">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text"><%= task.getDescription() %></p>
                                <!-- Add more details if needed -->

                                <!-- Checkmark icon as a button -->

                            </div>
                        </div>
                        <button type="submit" class="fas fa-check checkmark" style="border: none; background-color: transparent;"></button>
                    </div>
                </form>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
