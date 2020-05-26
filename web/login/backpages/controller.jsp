<%@ page import="java.security.MessageDigest" %>
<%@ page import="crudlogin.LoginRead" %>
<%@ page import="crudlogin.Login" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 25/05/2020
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    MessageDigest algorithmadmin = MessageDigest.getInstance("SHA-256");

    byte messageDigestadmin[] = algorithmadmin.digest(senha.getBytes("UTF-8"));
    StringBuilder hexStringadmin = new StringBuilder();

    for (byte a : messageDigestadmin) {
        hexStringadmin.append(String.format("%02X", 0xFF & a));
    }

    senha = hexStringadmin.toString();

    LoginRead loginRead = new LoginRead();
    List<Login> autentica = loginRead.read(email, senha);
    if(!autentica.isEmpty()){
        session.setAttribute("administrador", autentica);
        response.sendRedirect("../../admin/index.jsp?autentica=true");
    }else{
        response.sendRedirect("../index.jsp?autentica=false");
    }
%>