<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 01/05/2020
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teste Parameter</title>
</head>
<body>
<% List<Categoria> lstcat = (List<Categoria>) session.getAttribute("listacategoria"); %>
<label>
    <%=lstcat.get(1).getAtivo()%>
</label>
</body>
</html>
