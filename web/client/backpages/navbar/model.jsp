<%@ page import="java.util.List" %>
<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudclient.listagem.Listagem" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page import="crudclient.listagem.DestaqueCategoria" %>
<%@ page import="crudadmin.produtos.Produto" %>
<%@ page import="crudadmin.produtos.ProdutosDAO" %>
<%@ page import="crudclient.listagem.DadosProdutosList" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Listagem lt = new Listagem();
    List<Categoria> lstcat = lt.readcategoria();
    List<DestaqueCategoria> listadestaquecategoria = lt.readprodutodesccat();
    List<DadosProdutosList> listaultimosprodutos = lt.readdadosprodutoslist("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante ORDER BY id_produto DESC LIMIT 10;");

    List<DadosProdutosList> listaultimascategorias = lt.readdadosprodutoslist("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante, s.subcategoria FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante JOIN subcategoria AS s ON p.id_subcategoria " +
            "= s.id_subcategoria GROUP BY c.categoria ORDER BY c.id_categoria DESC LIMIT 9;");

    List<DadosProdutosList> listaultimassubcategorias = lt.readdadosprodutoslistcat("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante, s.subcategoria FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante JOIN subcategoria AS s ON p.id_subcategoria " +
            "= s.id_subcategoria GROUP BY s.subcategoria ORDER BY S.id_subcategoria DESC LIMIT 9;");

    session.setAttribute("listadestaquecategoria", listadestaquecategoria);
    session.setAttribute("categoria", lstcat);
    session.setAttribute("listultimosprodutos", listaultimosprodutos);
    session.setAttribute("listultimascategorias", listaultimascategorias);
    session.setAttribute("listultimassubcategorias", listaultimassubcategorias);

    response.sendRedirect("../../index.jsp");
%>