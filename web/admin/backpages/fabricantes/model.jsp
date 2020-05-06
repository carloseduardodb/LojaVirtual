<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="crudadmin.fabricante.FabricanteDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 05/05/2020
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="paginacao.jsp"%>
<%
    //declaro as variaveis a serem recebidas pelas acoes CRUD
    String acao, id_fabricante, fabricante, ativo_fabricante;
    acao = request.getParameter("acao");

    if (acao.equals("cadastrar")) {
        fabricante = request.getParameter("fabricante");
        ativo_fabricante = request.getParameter("ativo-fabricante");
        Fabricante fb = new Fabricante(fabricante, ativo_fabricante);
        FabricanteDAO fbtdao = new FabricanteDAO();
        Boolean cadastro = fbtdao.create(fb);
        response.sendRedirect("../../index.jsp?pagina=fabricantes&cadastrou=" + cadastro);

    } else if (acao.equals("apagar")) {

        FabricanteDAO fabricantedao = new FabricanteDAO();
        id_fabricante = request.getParameter("id-fabricante");
        response.sendRedirect("../../index.jsp?pagina=fabricantes&apagou=" + fabricantedao.delete(Integer.parseInt(id_fabricante)));

    } else if (acao.equals("atualizar")) {

        id_fabricante = request.getParameter("id-fabricante");
        fabricante = request.getParameter("fabricante");
        ativo_fabricante = request.getParameter("ativo-fabricante");

        Fabricante fb = new Fabricante(Integer.parseInt(id_fabricante),
                fabricante, ativo_fabricante);
        FabricanteDAO fbtdao = new FabricanteDAO();
        Boolean cadastro = fbtdao.update(fb);
        response.sendRedirect("../../index.jsp?pagina=fabricantes&atualizou=" + cadastro);

    } else if (acao.equals("visualizar")) {
        response.sendRedirect("../../index.jsp?pagina=fabricantes");
    }
%>