<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 08:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .section{
        padding-top: 10px;
    }
</style>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Carrinho</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Carrinho</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row fundo-checkout">

            <div class="col-md-7">

            </div>

            <% if(session.getAttribute("cliente")!=null && session.getAttribute("carrinhocliente") != null) {%>
            <!-- Order Details -->
            <div class="col-md-5 order-details" style="">
                <div class="section-title text-center">
                    <h3 class="title">Seu Pedido</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUTO</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <% for(Carrinho car : carrinhoprodutos) {%>
                        <div class="order-col">
                            <div><%=car.getQuantidade()%> <%=car.getProduto()%></div>
                            <div>R$ <%=car.getPreco()%></div>
                        </div>
                        <%}%>
                    </div>
                    <div class="order-col">
                        <div>Frete</div>
                        <div><strong>Gratuito</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">R$ <%=subtotal%></strong></div>
                    </div>
                </div>
                <div class="payment-method">
                    <div class="input-radio">
                        <input type="radio" onselect="" name="payment" id="payment-1">
                        <label for="payment-1">
                            <span></span>
                            Tranferência Bancária
                        </label>
                        <div class="caption">
                            <p> A transferência bancária é o único meio de pagamento disponível no momento.</p>
                        </div>
                    </div>
                </div>
                <div class="input-checkbox">
                    <input type="checkbox" id="terms">
                    <label for="terms">
                        <span></span>
                        Eu li e aceito os <a href="#">termos & condições</a>
                    </label>
                </div>
                <a href="backpages/venda/model.jsp" class="primary-btn order-submit">Comprar Agora</a>
            </div>
            <!-- /Order Details -->
            <%}%>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
