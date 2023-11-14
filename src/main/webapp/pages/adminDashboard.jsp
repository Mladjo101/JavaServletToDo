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
    <button class="btn-link" href="index.jsp">Go Back</button>
    <h2 class="mb-4">Admin Dashboard</h2>

    <!-- Display list of orders -->
    <h3>Orders</h3>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Details</th>
                <!-- Add more columns as needed -->
            </tr>
            </thead>
            <tbody>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                if (orders != null) {
                    for (Order order : orders) {
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getName() %></td>
                <td><%= order.getAddress() %></td>
                <td><%= order.getTotal() %></td>
                <td><%= order.getContent() %></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <!-- Form for creating new menu items -->
    <h3>Create New Menu Item</h3>
    <form action="${pageContext.request.contextPath}/admin" method="post">
        <div class="form-group">
            <label for="itemName">Item Name:</label>
            <input type="text" class="form-control" id="itemName" name="name" required>
        </div>
        <div class="form-group">
            <label for="itemPrice">Price:</label>
            <input type="number" step="0.01" class="form-control" id="itemPrice" name="price" required>
        </div>
        <div class="form-group">
            <label for="itemDescription">Description:</label>
            <textarea class="form-control" id="itemDescription" name="description"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Add Item</button>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
