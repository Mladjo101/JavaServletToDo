<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
    body{
        color: black;
    }
    h1{
        font-family: sans-serif;
        font-size: 4rem!important;
        font-weight: 600!important;
    }
    p{
        font-size: 20px!important;
    }
    .container{
        padding-top: 100px;
        margin-left: 30%;
    }
    .dugme1{
        width: auto;
        padding: 5px 10px;
        border-radius: 50px;
        background-color: darkblue;
        color: white;
        font-size: 1rem;
        border: 1px darkblue solid;
        font-weight: bold;
        margin-bottom: 30px;
    }
    .dugme1:hover{
        background-color: transparent;
        color: Black;
    }
    .dugme2{
        font-weight: bold;
        width: auto;
        padding: 10px 20px;
        border-radius: 50px;
        border: 1px darkblue solid;
        background-color: transparent;
        color: black;
        font-size: 1rem;
    }
    .dugme2:hover{
        background-color: darkblue;
        color: white;
    }
    .form-control{
        display: block;
        width: 50%!important;
        height: calc(1.5em + 0.75rem + 2px);
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid black!important;
        border-radius: 0.25rem;
        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    }
    .background{
        background-repeat: no-repeat;
        background-size: cover;
        background: url("../blank-clipboard-with-grocery-cart.jpg");
        height: 1200px;
        width: 100%;
    }
    .mt-4{
        margin-top: 0px!important;
    }
    a {
        color: darkblue!important;
        text-decoration: underline!important;
        background-color: transparent!important;
    }
</style>
<body>
<div class="background">
<div class="container mt-4">
    <a href="http://localhost:8080/Gradle___com_example___webzadacahamzaajdindise_1_0_SNAPSHOT_war/"><button class="dugme1"> &#8592 Go Back</button></a>
    <h2 class="mb-3">Prijavite se</h2>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
        if(errorMessage != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= errorMessage %>
    </div>
    <% } %>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="username">Naziv:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Sifra:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="dugme2">Prijavite se</button>
    </form>
    <p class="mt-3">Nemate profil? <a href="${pageContext.request.contextPath}/register">Registrujte se ovdje</a></p>
</div>
</div>
<!-- Optional JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
