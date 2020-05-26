<%@ page import="crudclient.painelcliente.compras.Compras" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 23/05/2020
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Compras> listacompras =  session.getAttribute("listadecomprasusuario")
            != null ? (List<Compras>) session.getAttribute("listadecomprasusuario") : null;

    Map<Integer, Object> listavendascompras = session.getAttribute("listaprodutosdecomprausuario")
    != null ? (Map<Integer, Object>) session.getAttribute("listaprodutosdecomprausuario") : null;
%>

<div class="col-md-9 direita">

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Produtos</th>
            <th scope="col">Data da Venda</th>
            <th scope="col">Pago</th>
            <th scope="col">Código de Rastreio</th>
        </tr>
        </thead>
        <tbody>
        <% if(listacompras != null) {%>
        <% for(Compras ltc : listacompras) {%>
        <tr>
            <td><a href="#" data-toggle="modal" data-target="#<%=ltc.getId_venda()%>">Exibir</a></td>
            <td><%=ltc.getData_venda()%></td>
            <td><%=ltc.getPago()%></td>
            <td><%=ltc.getCod_rastreio()%></td>
        </tr>
        <%}}%>
        </tbody>
    </table>

</div>

<% if(listacompras != null && listavendascompras != null) {%>
<% for(Compras cm : listacompras) {%>
<!-- Modal -->
<div class="modal fade" id="<%=cm.getId_venda()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header row">
                <div class="col-md-6 col-xs-6">
                <h5 class="modal-title" id="exampleModalLabel">Produtos Comprados</h5>
                </div>
                <div class="col-md-6 col-xs-6">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Produto</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Quantidade</th>
                    </tr>
                    </thead>
                    <tbody>

                    <% List<Compras> produtosdavenda = (List<Compras>) listavendascompras.get(cm.getId_venda()); %>
                    <% int i = 1; %>
                    <% for(Compras v : produtosdavenda) {%>
                    <tr>
                        <th scope="row"><%=i++%></th>
                        <td><%=v.getProduto()%></td>
                        <td>R$ <%=v.getValor_item()%></td>
                        <td><%=v.getQtde_item()%></td>
                    </tr>
                    <%}%>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

<%}}%>