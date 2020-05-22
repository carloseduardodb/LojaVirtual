<%@ page import="java.util.List" %>
<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudclient.listagem.Listagem" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="crudclient.listagem.DestaqueCategoria" %>
<%@ page import="crudclient.listagem.DadosProdutosList" %>
<%@ page import="crudadmin.produtos.cadatuprodutos.CadatuprodutosDAO" %>
<%@ page import="crudclient.carrinho.Carrinho" %>
<%@ page import="crudclient.carrinho.CarrinhoDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Listagem lt = new Listagem();
    CarrinhoDAO carinhoclientedao = new CarrinhoDAO();
    List<Categoria> lstcat = lt.readcategoria();
    CadatuprodutosDAO cadatuprodao = new CadatuprodutosDAO();
    List<DestaqueCategoria> listadestaquecategoria = lt.readprodutodesccat();

    List<DadosProdutosList> listaultimosprodutos = lt.readdadosprodutoslist("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante ORDER BY id_produto DESC LIMIT 10;");

    List<DadosProdutosList> listaultimascategorias = lt.readdadosprodutoslist("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante, s.subcategoria FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante JOIN subcategoria AS s ON p.id_subcategoria " +
            "= s.id_subcategoria GROUP BY c.categoria ORDER BY c.id_categoria DESC LIMIT 3;");

    List<DadosProdutosList> listaultimassubcategorias = lt.readdadosprodutoslistcat("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante, s.subcategoria FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante JOIN subcategoria AS s ON p.id_subcategoria " +
            "= s.id_subcategoria GROUP BY s.subcategoria ORDER BY s.id_subcategoria DESC LIMIT 3;");

    List<DadosProdutosList> listaultimasfabricante = lt.readdadosprodutoslistcat("SELECT p.id_produto, p.produto, p.imagem, p.preco_alto, " +
            "p.preco, c.categoria, f.fabricante, s.subcategoria FROM produto AS p JOIN categoria AS c ON p.id_categoria = " +
            "c.id_categoria JOIN fabricante AS f ON p.id_fabricante = f.id_fabricante JOIN subcategoria AS s ON p.id_subcategoria " +
            "= s.id_subcategoria GROUP BY f.fabricante ORDER BY f.id_fabricante DESC LIMIT 3;");

    List<Fabricante> fabricante = cadatuprodao.readfabricante();
    List<Carrinho> carrinhocliente = carinhoclientedao.readclientecar();

    session.setAttribute("listadestaquecategoria", listadestaquecategoria);
    session.setAttribute("categoria", lstcat);
    session.setAttribute("listultimosprodutos", listaultimosprodutos);
    session.setAttribute("listultimascategorias", listaultimascategorias);
    session.setAttribute("listultimassubcategorias", listaultimassubcategorias);
    session.setAttribute("listultimasfabricante", listaultimasfabricante);
    session.setAttribute("jsonfabricante", fabricante);
    session.setAttribute("carrinhocliente", carrinhocliente);

    response.sendRedirect("../../index.jsp");
%>