<%@ page import="crudadmin.produtos.Produto" %>
<%@ page import="crudadmin.produtos.ProdutosDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 28/04/2020
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="paginacao.jsp"%>
<%
    //declaro as variaveis a serem recebidas pelas acoes CRUD
    String acao, idproduto, idcategoria, idsubcategoria, idfabricante,
            produtonome, precoalto, preco, descricao, detalhes, ativoproduto,
            imagem, destaque;
    acao = request.getParameter("acao");

    if (acao.equals("apagar")){

        ProdutosDAO produtosdao = new ProdutosDAO();
        idproduto = request.getParameter("id");
        response.sendRedirect("../../index.jsp?pagina=produtos&apagou="
                +produtosdao.delete(Integer.parseInt(idproduto)));

    }else if(acao.equals("atualizar")){

        idproduto = request.getParameter("id-produto");
        idcategoria = request.getParameter("id-categoria");
        idsubcategoria = request.getParameter("id-subcategoria");
        idfabricante = request.getParameter("id-fabricante");
        produtonome = request.getParameter("produto-nome");
        precoalto = request.getParameter("precoalto");
        preco = request.getParameter("preco");
        descricao = request.getParameter("descricao");
        detalhes = request.getParameter("detalhes");
        ativoproduto = request.getParameter("ativo-produto");
        imagem = request.getParameter("imagem").replace(" ", "_");
        destaque = request.getParameter("destaque");

        Produto produto = new Produto(Integer.parseInt(idproduto),
                Integer.parseInt(idcategoria), Integer.parseInt(idsubcategoria),
                Integer.parseInt(idfabricante), produtonome,
                Float.parseFloat(precoalto), Float.parseFloat(preco),
                descricao, detalhes, ativoproduto, imagem, destaque);

        ProdutosDAO produtosDAO = new ProdutosDAO();
        Boolean update = produtosDAO.update(produto);
        response.sendRedirect("../../index.jsp?pagina=produtos&atualizou=" + update);

    }else if(acao.equals("visualizar")){

        response.sendRedirect("../../index.jsp?pagina=produtos");

    }else if(acao.equals("editar")){

        /*quando eu edito preciso dos dados para preencher os
        * select da view entao encaminho a resposta da requisicao
        * para cadatuproduto para trazer os dados
        * */

        List<Produto> edtproduto = pddao.read("SELECT * FROM produto WHERE id_produto = "+request.getParameter("id-produto"));
        session.removeAttribute("dadosprodutoeditado");
        session.setAttribute("dadosprodutoeditado", edtproduto);
        response.sendRedirect("cadatuprodutos/model.jsp?acao=visualizar");

    }
%>