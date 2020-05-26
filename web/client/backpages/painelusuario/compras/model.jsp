<%@ page import="crudclient.painelcliente.compras.ComprasDAO" %>
<%@ page import="crudclient.painelcliente.compras.Compras" %>
<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 24/05/2020
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<Cliente> dadosuserlogado = (List<Cliente>) session.getAttribute("cliente");
    ComprasDAO comprasDAO = new ComprasDAO();
    List<Compras> compraslist = comprasDAO.readcompras("SELECT id_venda, " +
            "data_venda, pago, cod_rastreio FROM venda " +
            "WHERE id_cliente = "+dadosuserlogado.get(0).getId_cliente());

    Map<Integer, Object> listaprodutoskeycompras = new HashMap<Integer, Object>();

    for(Compras c : compraslist){
        List<Compras> produtosdevenda = comprasDAO.readprodutos("SELECT p.produto, i.valor_item, " +
                "i.qtde_item FROM itens AS i JOIN produto AS p ON i.id_produto = p.id_produto " +
                "WHERE id_venda = "+c.getId_venda());
        listaprodutoskeycompras.put(c.getId_venda(), produtosdevenda);
    }
    session.removeAttribute("listadecomprasusuario");
    session.removeAttribute("listaprodutosdecomprausuario");

    session.setAttribute("listadecomprasusuario", compraslist);
    session.setAttribute("listaprodutosdecomprausuario", listaprodutoskeycompras);

    response.sendRedirect("../../../index.jsp?pagina=painel");
%>