<%@ page import="crudadmin.produtos.cadatuprodutos.CadatuprodutosDAO" %>
<%@ page import="crudadmin.produtos.cadatuprodutos.Cadatuproduto" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="crudadmin.produtos.Produto" %>
<%@ page import="crudadmin.produtos.ProdutosDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 09/05/2020
  Time: 00:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String acao, idproduto, idcategoria, idsubcategoria, idfabricante,
            produtonome, precoalto, preco, descricao, detalhes, ativoproduto,
            imagem, destaque;

    if ("visualizar".equals(request.getParameter("acao"))) {

        CadatuprodutosDAO cadatuprodutosDAO = new CadatuprodutosDAO();

        List<Categoria> dadoscat = cadatuprodutosDAO.readcategoria();
        List<Subcategoria> dadossub = cadatuprodutosDAO.readsubcategoria();
        List<Fabricante> dadosfab = cadatuprodutosDAO.readfabricante();

        session.removeAttribute("dadoscat");
        session.removeAttribute("dadossub");
        session.removeAttribute("dadosfab");

        session.setAttribute("dadoscat", dadoscat);
        session.setAttribute("dadossub", dadossub);
        session.setAttribute("dadosfab", dadosfab);

        response.sendRedirect("../../../index.jsp?pagina=produtoscadatu");
    }

    if("cadastrar".equals(request.getParameter("acao"))){

        idcategoria = request.getParameter("id-categoria").toString();
        idsubcategoria = request.getParameter("id-subcategoria").toString();
        idfabricante = request.getParameter("id-fabricante").toString();
        produtonome = request.getParameter("produto-nome").toString();
        precoalto = request.getParameter("precoalto").toString();
        preco = request.getParameter("preco").toString();
        descricao = request.getParameter("descricao").toString();
        detalhes = request.getParameter("detalhes").toString();
        ativoproduto = request.getParameter("ativo-produto").toString();
        imagem = " aa";//request.getParameter("imagem").replace(" ", "_");
        destaque = "S";

        Produto produto = new Produto(Integer.parseInt(idcategoria),
                Integer.parseInt(idsubcategoria), Integer.parseInt(idfabricante),
                produtonome, Float.parseFloat(precoalto), Float.parseFloat(preco),
                descricao, detalhes, ativoproduto, imagem, destaque);
        ProdutosDAO produtosDAO = new ProdutosDAO();
        Boolean cadastro = produtosDAO.create(produto);
        response.sendRedirect("../../index.jsp?pagina=produtos&cadastrou=" + cadastro);
    }
%>