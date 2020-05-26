<%@ page import="crudadmin.vendas.Vendas" %>
<%@ page import="crudadmin.vendas.VendaProdutos" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 26/05/2020
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%

    List<Vendas> listadecompras = session.getAttribute("listadecomprasusuarioadmin") != null ?
            (List<Vendas>) session.getAttribute("listadecomprasusuarioadmin") : null;

    Map<Integer, Object> listadeprodutosvendidos = session.getAttribute("listaprodutosdecomprausuarioadmin") != null ?
            (Map<Integer, Object>) session.getAttribute("listaprodutosdecomprausuarioadmin") : null;

%>

<div class="container pagina-inicio" align="center">
    <h2>Área administrativa - Vendas</h2>
    <hr />
    <div class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option">
            <option>Rastreio</option>
            <option value="S">Sim</option>
            <option value="N">Não</option>
        </select>
        <input type="text" class="form-control" placeholder="Pesquisar">
        <span class="input-group-btn">
        <a class="btn btn-default" type="button"><img src="img/searching.png" width="21px"></a>
      </span>

    </div>

    <div class="tabela col-8">

        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Cliente</th>
                <th scope="col">Produtos</th>
                <th scope="col">Pago</th>
                <th scope="col">Codigo de Rastreio</th>
                <th scope="col">Ações</th>
            </tr>
            </thead>
            <tbody>
            <% if(listadecompras != null){%>
            <% for(Vendas v:listadecompras){%>
            <tr>
                <th scope="row"><%=v.getId_venda()%></th>
                <td><%=v.getCliente()%></td>
                <td><button class="btn btn-default" data-toggle="modal" data-target="#a<%=v.getId_venda()%>">Exibir</button></td>
                <td><%=v.getPago()%></td>
                <td><%=v.getCodigo_rastreio()%></td>
                <td>
                    <button class="btn btn-warning">+ Rastreio</button>
                </td>
            </tr>
            <%}}%>
            </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Anterior</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Próximo</a>
            </li>
        </ul>
    </div>
</div>


<% if(listadecompras != null && listadeprodutosvendidos != null) {%>
<% for(Vendas vd : listadecompras) {%>
<!-- Modal -->
<div class="modal fade" id="a<%=vd.getId_venda()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

                    <% List<VendaProdutos> produtosdavenda = (List<VendaProdutos>) listadeprodutosvendidos.get(vd.getId_venda()); %>
                    <% int i = 1; %>
                    <% for(VendaProdutos v : produtosdavenda) {%>
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
