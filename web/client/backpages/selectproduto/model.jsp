<%@ page import="crudadmin.produtos.ProdutosDAO" %>
<%@ page import="crudadmin.produtos.Produto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("produtoselecionado");
    if(request.getParameterMap().containsKey("idproduto")){
        ProdutosDAO produtosdao = new ProdutosDAO();
        List<Produto> produto = produtosdao.read("SELECT * FROM produto WHERE id_produto="+request.getParameter("idproduto"));
        session.setAttribute("produtoselecionado", produto);
        response.sendRedirect("../../index.jsp?pagina=produto");
    }
%>
