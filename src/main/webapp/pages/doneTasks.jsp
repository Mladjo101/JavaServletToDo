<%--
  Created by IntelliJ IDEA.
  User: oamci
  Date: 19/11/2023
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<%@ page import="com.example.webzadacahamzaajdindise.models.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webzadacahamzaajdindise.task.TaskDAO" %>
<%@ page pageEncoding="UTF-8" %>
<%
    HttpSession sessioon = request.getSession();
    int userId = (int) sessioon.getAttribute("userId");
    TaskDAO taskDAO = new TaskDAO();
    List<Task> tasks = taskDAO.getDoneTasksByUserId(userId);

    // Set the users as a request attribute
    request.setAttribute("tasks", tasks);
%>
<!DOCTYPE html>
<html>
<head>
    <title>ToDo List </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body{

            background-image: url(https://img.freepik.com/free-photo/blank-clipboard-with-grocery-cart_23-2147957767.jpg?w=740&t=st=1700405642~exp=1700406242~hmac=f4e353de8e97ee1aabdaa7869fb7d1f4c9a19a5e6c8e0c7abdd480a5cd41344b); /* Replace 'path/to/your/image.jpg' with the actual path to your image file */
            background-size: cover; /* Ensure the background image covers the entire viewport */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Do not repeat the background image */
            width: 100%;
            height: 100vh;


        }
        .card {
            width: 18rem;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            border-radius: 0.5rem;
            background: #606c88;
            background: -webkit-linear-gradient(to right, #3f4c6b, #606c88);
            background: linear-gradient(to right top, #3f4c6b, #606c88);
            padding: 1rem;

            box-shadow: 0px 87px 78px -39px rgba(0,0,0,0.4);
            color: white;
            font-size: 20px;
        }

        .checkmark {
            color: green;
        }
        header {
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(8,4,64,1) 23%, rgba(0,138,255,1) 100%);
            color: white;
            padding: 15px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout-btn {
            color: #fff;
            background-color: #dc3545;
            border: none;
            padding: 5px 10px;
            margin: 0;
            cursor: pointer;
            border-radius: 10px;

        }
        .done-btn{

            color: #fff;
            background-color: #0f700d;
            border: none;
            padding: 5px 10px;

            cursor: pointer;
            border-radius: 10px;
            margin-right: 10px;


        }
        .container{
            display:flex;
        }
        .row{
            justify-content: center;
        }
    </style>
</head>
<body>
<header>

    <h2>Done task List</h2>
    <div class="button-group">
        <button class="done-btn" onclick="redirectToToDoList()">ToDo list</button>


        <button class="logout-btn" onclick="redirectToLogout()">Log out</button>
    </div>
</header>
<div class="container mt-4">


    <!-- Display list of tasks as cards -->
    <div class="col" style="justify-content: center">
        <% if(tasks.isEmpty()){%>
        <p class="row">Nema zavrsenih taskova trenutno!</p>
        <%}%>
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
<script>
    function redirectToLogout() {
        // Perform any additional cleanup or actions if needed
        window.location.href = "${pageContext.request.contextPath}/pages/login.jsp";
    }
    function redirectToToDoList() {
        // Perform any additional cleanup or actions if needed
        window.location.href = "${pageContext.request.contextPath}/pages/userDashboard.jsp";
    }
</script>
</body>
</html>
