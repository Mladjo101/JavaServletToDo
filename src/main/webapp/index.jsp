<!DOCTYPE html>
<html>
<head>
    <title>ToDo Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body{
            color: black;
            display:flex;
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
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        /*padding-top: 500px;*/
        /*padding-bottom: 500px;*/
        height:100vh;
    }
    .background{
        background-repeat: no-repeat;
        background-size: cover;
        background: url("blank-clipboard-with-grocery-cart.jpg");
        height: 100%;
        width: 100%;
    }
    .dugme1{
        width: auto;
        padding: 10px 20px;
        border-radius: 50px;
        background-color: darkblue;
        color: white;
        font-size: 1rem;
        border: 1px darkblue solid;
        font-weight: bold;
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
        .dugme-wrapper{
            display: flex;
            flex-direction: row;
            gap: 30px;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="background">
    <div class="container">
    <h1>Dobrodosli u nasu to-do aplikaciju</h1>
    <p>Nadamo se da cete uzivati. Da bi sacuvali svoju listu morate se ulogavati.</p>
        <div class="dugme-wrapper">
        <a href="pages/login.jsp"><button class="dugme1">Prijava</button></a>
        <a href="/registracija.jsp"><button class="dugme2">Registracija</button></a>
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
