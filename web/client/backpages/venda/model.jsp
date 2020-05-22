<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.util.List" %>
<%@ page import="crudclient.venda.Venda" %>
<%@ page import="crudclient.venda.VendaDAO" %>
<%@ page import="crudclient.item.Item" %>
<%@ page import="crudclient.carrinho.Carrinho" %>
<%@ page import="crudclient.item.ItemDAO" %>
<%@ page import="crudclient.pedido.PedidoDAO" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 22/05/2020
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    if(session.getAttribute("cliente")!=null && session.getAttribute("carrinhocliente")!=null){
        List<Cliente> dadosclientelogado = (List<Cliente>) session.getAttribute("cliente");
        String pago = "S";
        String formapagamento = "Transferencia";
        Venda v = new Venda(dadosclientelogado.get(0).getId_cliente(),null, "Em andamento",pago,formapagamento);
        VendaDAO vendadao = new VendaDAO();
        vendadao.create(v);

        List<Carrinho> produtosdocarrinho = (List<Carrinho>) session.getAttribute("carrinhocliente");
        List<Venda> ultimavenda = vendadao.read("SELECT * FROM venda ORDER BY id_venda DESC LIMIT 1;");

        PedidoDAO pedidodao = new PedidoDAO();
        ItemDAO itemdao = new ItemDAO();
        for(Carrinho c : produtosdocarrinho){
            Item item = new Item(ultimavenda.get(0).getId_venda(),
                    c.getId_produto(), 1, c.getPreco(), 0.0);
            itemdao.create(item);
        }
        pedidodao.delete(dadosclientelogado.get(0).getId_cliente());
        response.sendRedirect("../navbar/model.jsp");
    }

%>