<%@ page import="crudclient.carrinho.CarrinhoDAO" %>
<%@ page import="crudclient.carrinho.Carrinho" %>
<%@ page import="crudclient.pedido.Pedido" %>
<%@ page import="crudclient.pedido.PedidoDAO" %>
<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.util.List" %>
<%@ page import="crudadmin.produtos.Produto" %>
<%@ page import="crudadmin.produtos.ProdutosDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //verifico se o cliente esta logado
    if(session.getAttribute("cliente")!=null) {
        //recebo parametro do id do produto via get
        String id_produto = request.getParameter("idproduto")
                == null ? "" : request.getParameter("idproduto");

        //instacio as acoes do produto
        ProdutosDAO prod = new ProdutosDAO();

        //listo os dados que preciso para adicionar no pedido e carrinho
        List<Cliente> dadoscliente = (List<Cliente>) session.getAttribute("cliente");
        List<Produto> produtoadd = prod.read("SELECT * FROM produto WHERE id_produto ="+id_produto);

        //instancio pedido e crio a row no banco
        Pedido pedido = new Pedido(dadoscliente.get(0).getId_cliente(),
                1, null);
        PedidoDAO pedidodao = new PedidoDAO();
        pedidodao.create(pedido);

        //listo o ultimo pedido feito pra adicionar o id no carrinho
        List<Pedido> pedidosfeito = pedidodao.read("SELECT * FROM pedido ORDER BY id_pedido DESC LIMIT 1");
        int id_pedido = pedidosfeito.get(0).getId_pedido();

        //instancio o carrinho e crio a row no banco
        Carrinho carrinho = new Carrinho(0,
                id_pedido, Integer.parseInt(id_produto), 1,
                Double.parseDouble(""+produtoadd.get(0).getPreco()));
        CarrinhoDAO cardao = new CarrinhoDAO();
        cardao.create(carrinho);
        response.sendRedirect("../navbar/model.jsp");
    }else{
        response.sendRedirect("../../index.jsp?pagina=login&continuar=true");
    }
%>