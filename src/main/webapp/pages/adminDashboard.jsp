<%@ page import="com.example.webzadacahamzaajdindise.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webzadacahamzaajdindise.models.User" %>
<%@ page import="com.example.webzadacahamzaajdindise.userLogic.CreateUserDAO" %>
<%
    // Fetch all users using the UserDAO
    CreateUserDAO createUserDAO = new CreateUserDAO();
    List<User> users = createUserDAO.getAllUsersExceptAdmin();

    // Set the users as a request attribute
    request.setAttribute("users", users);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .admin-dashboard {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .admin-header {
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(8,4,64,1) 23%, rgba(0,138,255,1) 100%);
            color: white;
            padding: 15px;
            text-align: center;
        }

        .admin-header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-header h2 {
            margin: 0; /* Remove default margin */
        }

        .admin-sidebar {
            flex: 0 0 250px; /* Fixed width for the sidebar */
            background-color: #f8f9fa;
            padding: 20px;
        }

        .admin-content {
            flex: 1; /* Allow the content to grow and take remaining space */
            padding: 20px;
        }

        .logout-btn {
            color: #fff;
            background-color: #dc3545;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 10px;
        }
        .admin-content table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .admin-content th, .admin-content td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            width: 33%;
        }

        .admin-content th {
            background-color: darkblue;
            color: white;
        }

        .admin-content tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn{
            width:100%;
            margin-top:20px;
        }
        .create-btn{
            background-color: darkblue !important;
        }
        form .btn{
            margin-top: 0 !important;
        }



        /* Additional styling as needed */
    </style>
</head>
<body>
<div class="admin-dashboard">
    <div class="admin-header">
        <div class="admin-header-content">
            <h2>Admin Dashboard</h2>
            <div class="admin-header-right">
                <button class="logout-btn" onclick="redirectToLogout()">Log out</button>
            </div>
        </div>
    </div>

    <div class="d-flex flex-column flex-md-row">
        <!-- Left Sidebar with Buttons and Logout -->
        <div class="admin-sidebar">
            <a class="btn btn-primary mb-2 create-btn" href="${pageContext.request.contextPath}/pages/createUser.jsp">Create User</a>
            <a class="btn btn-primary create-btn" href="${pageContext.request.contextPath}/pages/createTask.jsp">Create Task</a>

        </div>

        <!-- Right Content with User Table -->
        <div class="admin-content">
            <!-- Table to display users -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <!-- Add more columns as needed -->
                </tr>
                </thead>
                <tbody>
                <% for (User user : users) { %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%=user.getEmail()%></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/deleteUser" method="post">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>

                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
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
</script>
</body>
</html>
