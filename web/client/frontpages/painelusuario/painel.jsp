<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 23/05/2020
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/style-painelusuario.css">
<script src="js/jquery.min.js"></script>
<%
    String paginaadmin = "" + request.getParameter("paginaadmin");
%>
<div class="container">
    <div class="row center-block corpo <%=paginaadmin.equals("meusdados")?"fundo-painel":""%>">

        <div class="col-md-3" align="center">
            <br>
            <br>
            <h3><strong>Bem Vindo(a)!</strong></h3>
            <br>
            <div class="esquerda">
                <button class="btn btn-default botao" onclick="location.href='index.jsp?pagina=painel'">Compras</button>
                <button class="btn btn-default botao"
                        onclick="location.href='index.jsp?pagina=painel&paginaadmin=meusdados'">Meus Dados
                </button>
                <button type="button" class="btn btn-default botao" data-toggle="modal" data-target="#apagar">Apagar
                    Conta
                </button>
                <button class="btn btn-default botao"
                        onclick="location.href='backpages/usuario/model.jsp?acao=sair'">Sair
                </button>
            </div>
        </div>

        <% if (paginaadmin.equals("inicio") || paginaadmin.equals("null")) {%>

        <%@include file="pedidos.jsp" %>

        <%} else if (paginaadmin.equals("meusdados")) {%>

        <%@include file="meusdados.jsp" %>

        <%}%>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="apagar" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="TituloModalCentralizado">Tem certeza que deseja apagar sua conta?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="backpages/usuario/model.jsp">
                <input type="text" name="acao" value="apagar" hidden>
                <div class="modal-body">
                    <label> Esta ação não pode ser desfeita! </label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-danger">Apagar</button>
                </div>
            </form>
        </div>
    </div>
</div>
