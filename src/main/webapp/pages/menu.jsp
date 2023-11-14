<%@ page import="com.example.webzadacahamzaajdindise.models.MenuItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-3">
    <a class="btn-link" href="index.jsp">Go Back</a>
    <h2 class="mb-4">Menu</h2>
    <div class="row">
        <%
            List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
            if(menuItems != null && !menuItems.isEmpty()) {
                for (MenuItem menuItem : menuItems) {
        %>
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= menuItem.getName() %></h5>
                    <p class="card-text"><%= menuItem.getDescription() %></p>
                    <p class="card-text">Price: $<%= menuItem.getPrice() %></p>
                    <button class="btn btn-primary add-to-order" data-id="<%= menuItem.getId() %>" data-name="<%= menuItem.getName() %>" data-price="<%= menuItem.getPrice()%>">Add to Order</button>
                </div>
            </div>
        </div>
        <%
                }
            } else {
                %>
        <p>No menu items available.</p>
        <%}%>
    </div>

    <!-- Order Form -->
    <form action="${pageContext.request.contextPath}/order" method="post" id="orderForm">
        <h3 class="mt-4">Your Order</h3>
        <div class="form-group">

        <div id="orderItems"></div>
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text"  class="form-control" id="name" name="name" placeholder="Enter name" required>
            <label for="address">Address</label>
            <input type="text" name="address" class="form-control" id="address" placeholder="Enter address" required>
            <label for="total">Total:</label>
            <input name="total" type="number" readonly class="form-control" id="total" value="0">
            <input name="content" id="content" hidden="hidden">
        </div>
        <button type="submit" class="btn btn-success mt-2">Place Order</button>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.add-to-order').forEach(function(button) {
            button.addEventListener('click', function() {
                let id = this.getAttribute('data-id');
                let name = this.getAttribute('data-name');
                let price = this.getAttribute('data-price');
                let orderItemsDiv = document.getElementById('orderItems');
                let total = document.getElementById('total');
                let content = document.getElementById('content');
                let totalValue = parseFloat(total.value);
                total.value = totalValue + parseFloat(price);
                content.value += ' '+ name;
                content.value = content.value.trim();
                orderItemsDiv.innerHTML += '<input type="hidden" name="orderedItems" value="' + name + '"/> ' + name + '<br/>';
            });
        });
    });
</script>
</body>
</html>
