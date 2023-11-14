<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Our Food Ordering System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .navbar-custom {
            background-color: cornflowerblue; /* You can change this color to suit your branding */
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-nav .nav-link {
            color: white;
        }
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="#">Food Ordering System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="pages/login.jsp">Admin Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="menu">View Menu</a>
                </li>
                <!-- Add more navigation links as necessary -->
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center">
    <h1>Welcome to Our Food Ordering System</h1>
    <p class="lead">Enjoy our delicious menu and quick service</p>
</div>

<!-- Optional JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
