<%@ page import="crudadmin.vendas.VendasDAO" %>
<%@ page import="crudadmin.vendas.Vendas" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="crudadmin.vendas.VendaProdutos" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 25/05/2020
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    VendasDAO vendasDAO = new VendasDAO();
    List<Vendas> compraslist = vendasDAO.readvendas("SELECT v.id_venda, c.cliente, " +
            "v.pago, v.cod_rastreio FROM venda AS v JOIN cliente AS c ON v.id_cliente = c.id_cliente;");

    Map<Integer, Object> listaprodutoskeycompras = new HashMap<Integer, Object>();

    for(Vendas v : compraslist){
        List<VendaProdutos> produtosdevenda = vendasDAO.readprodutos("SELECT p.produto, i.valor_item, " +
                "i.qtde_item FROM itens AS i JOIN produto AS p ON i.id_produto = p.id_produto " +
                "WHERE id_venda = "+v.getId_venda());
        listaprodutoskeycompras.put(v.getId_venda(), produtosdevenda);
    }
    session.removeAttribute("listadecomprasusuarioadmin");
    session.removeAttribute("listaprodutosdecomprausuarioadmin");

    session.setAttribute("listadecomprasusuarioadmin", compraslist);
    session.setAttribute("listaprodutosdecomprausuarioadmin", listaprodutoskeycompras);

    response.sendRedirect("../../index.jsp?pagina=vendas");

%>
