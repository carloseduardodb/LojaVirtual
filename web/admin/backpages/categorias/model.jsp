<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.categorias.CategoriasDAO" %>

<%-- Incluo a paginação na model pra controlar as variaveis e enviar pra view --%>
<%@include file="paginacao.jsp"%>

<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 28/04/2020
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //declaro as variaveis a serem recebidas pelas acoes CRUD
    String id, acao, nome, slug, ativo, icone;
    acao = request.getParameter("acao");

    if (acao.equals("cadastrar")) {
        nome = request.getParameter("nome");
        slug = request.getParameter("slug");
        ativo = request.getParameter("ativo");
        icone = null; //request.getParameter("icone");

        Categoria categoria = new Categoria(nome, slug, ativo, icone);
        CategoriasDAO cdao = new CategoriasDAO();
        Boolean cadastro = cdao.create(categoria);
        response.sendRedirect("../../index.jsp?pagina=categorias&cadastrou=" + cadastro);

    } else if (acao.equals("apagar")){

        CategoriasDAO categoriadao = new CategoriasDAO();
        id = request.getParameter("id");
        response.sendRedirect("../../index.jsp?pagina=categorias&apagou="+categoriadao.delete(Integer.parseInt(id)));

    }else if(acao.equals("atualizar")){

        id = request.getParameter("id");
        nome = request.getParameter("nome");
        slug = request.getParameter("slug");
        ativo = request.getParameter("ativo");
        icone = null; //request.getParameter("icone");

        Categoria categoria = new Categoria(Integer.parseInt(id), nome, slug, ativo, icone);
        CategoriasDAO cdao = new CategoriasDAO();
        Boolean cadastro = cdao.update(categoria);
        response.sendRedirect("../../index.jsp?pagina=categorias&atualizou=" + cadastro);

    }else if(acao.equals("visualizar")){
        response.sendRedirect("../../index.jsp?pagina=categorias");
    }
%>