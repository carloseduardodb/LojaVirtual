<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 27/04/2020
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ include file="rotas.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="description" content="Adicione remova e atualize dados de seus produtos, categorias e subcategorias">
    <title>Painel Administrativo - <%=pagina%>
    </title>
    <%@include file="frontpages/navbar/importacoes.html" %>
    <%
        if (pagina.equals("inicio")) {
    %>
    <%@include file="frontpages/inicio/importacoes.html" %>
    <%
    } else if (pagina.equals("categorias")) {
    %>
    <%@include file="frontpages/categorias/importacoes.html" %>
    <%
    } else if (pagina.equals("subcategorias")) {
    %>
    <%@include file="frontpages/subcategorias/importacoes.html" %>
    <%
    }else if (pagina.equals("fabricantes")) {
    %>
    <%@include file="frontpages/fabricantes/importacoes.html" %>
    <%
    }  else if (pagina.equals("produtos")) {
    %>
    <%@include file="frontpages/produtos/importacoes.html" %>
    <%
    } else if (pagina.equals("produtoscadatu")) {
    %>
    <%@include file="frontpages/produtos/importacoescadatu.html" %>
    <%
    } else {
    %>
    <%@include file="frontpages/inicio/importacoes.html" %>
    <%
        }
    %>
    <%@include file="frontpages/rodape/importacoes.html" %>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>

</head>
<body>
<%@include file="frontpages/navbar/navbar.jsp" %>
<%
    if (pagina.equals("inicio")) {
%>
<%@include file="frontpages/inicio/inicio.jsp" %>
<%
} else if (pagina.equals("categorias")) {
%>
<%@include file="frontpages/categorias/categorias.jsp" %>
<%
} else if (pagina.equals("subcategorias")) {
%>
<%@include file="frontpages/subcategorias/subcategorias.jsp" %>
<%
} else if (pagina.equals("produtos")) {
%>
<%@include file="frontpages/produtos/produtos.jsp" %>
<%
} else if (pagina.equals("fabricantes")) {
%>
<%@include file="frontpages/fabricantes/fabricantes.jsp" %>
<%
} else if (pagina.equals("produtoscadatu")) {
%>
<%@include file="frontpages/produtos/cadatuprodutos.jsp" %>
<%
} else {
%>
<%@include file="frontpages/inicio/inicio.jsp" %>
<%
    }
%>
<%@include file="frontpages/rodape/rodape.jsp" %>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
</body>

</html>
