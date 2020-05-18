<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.util.List" %>
<%


%>
<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 27/04/2020
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%
    String pagina = ""+request.getParameter("pagina");
%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<%@include file="frontpages/navbar/navbar.jsp"%>
<% if(pagina.equals("home") || pagina.equals("null")){%>

<%@include file="frontpages/destaquecategoria/destaquecategoria.jsp"%>
<%@include file="frontpages/novosprodutos/novosprodutos.jsp"%>
<%@include file="frontpages/promocao/promocao.jsp"%>
<%@include file="frontpages/maisvendidosall/maisvendidosall.jsp"%>

<%}else if(pagina.equals("produto")){%>

<%@include file="frontpages/produto/produto.jsp"%>
<div style="height: 25px;"></div>
<%@include file="frontpages/produtossemelhantes/produtossemelhantes.jsp"%>

<%}else if(pagina.equals("checkout")){%>

<%@include file="frontpages/checkout/checkout.jsp"%>

<%} else if(pagina.equals("store")){%>

<%@include file="frontpages/store/store.jsp"%>

<%} else if(pagina.equals("login")){%>

<%@include file="frontpages/login/login.jsp"%>

<%}else if(pagina.equals("cadastro")){%>

<%@include file="frontpages/cadastro/cadastro.jsp"%>

<%}%>
<%if(!pagina.equals("cadastro")){%>
<%@include file="frontpages/recebanovasofertas/recebanovasofertas.jsp"%>
<%}%>
<%@include file="frontpages/footer/footer.jsp"%>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>