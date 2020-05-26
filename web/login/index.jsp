<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 27/04/2020
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Painel Administrativo - Login</title>
    <link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Admin Login By Zaki" >
    <meta name="description" content="Admin Login By Zaki" >
    <title>Administrativo Loja Virtual - Login </title>
    <script src="https://use.fontawesome.com/fbf13eceb7.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css" >
</head>
<body>
<br>
<div class="biggest">
    <!-- Start Navigation here-->

    <div class="nav">
        <ul>

            <li><img src="img/logo-empresa-desenvolvimento.svg" width="70" height="70" /></li>
            <li class="move1"><a class="login1" href="#"><i class="fa fa-user-o" aria-hidden="true"></i> Login</a></li>
            <hr/>
        </ul>

        <!-- Start Introduction here-->
        <div class="intro">
            <div class="par">
                <h3>Bem Vindo ao Painel Administrativo</h3>
                <span>Loja Virtual <br>by CDC - Creative Design Code</span>
                <br><br><span><strong style="color: yellow">Alerta</strong>
                  <br>Qualquer tentativa não autorizada de login
                  <br>será considerada invasão e tomaremos as
                  <br>medidas judiciais cabíveis!</span>
                <div class="social">
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <!-- End Introduction here-->
    </div>
    <!-- End Navigation here-->

    <!-- Start Login Form here-->
    <div class="container">
        <div class="logged">
            <div class="login">
                <p><span>Login</span> Entre na sua conta <br>para administrar a Loja Virtual.</p><br>
                <form method="post" action="backpages/controller.jsp">
                    <input type="email" name="email" placeholder="carlos@gmail.com" value="" />
                    <input type="password" name="senha" placeholder="SENHA" />
                    <!--<span><input type="submit" value=""><i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></span>-->
                    <button><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                </form><br>
                <p>Não é o administrador?<span><a class="sign-up" href="#" > Volte para a Loja Virtual</a></span></p>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src="js/jquery-1.12.4.min.js"></script>
<script type='text/javascript' src="js/app.js"></script>
</body>
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script><script  src="./script.js"></script>

</body>
</html>
