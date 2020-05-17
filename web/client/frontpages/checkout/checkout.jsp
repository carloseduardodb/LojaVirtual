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
                <h3 class="breadcrumb-header">Verificação</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Verificação</li>
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
        <div class="row">

            <div class="col-md-7">
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Endereço de cobrança</h3>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="first-name" placeholder="Primeiro Nome">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="last-name" placeholder="Último Nome">
                    </div>
                    <div class="form-group">
                        <input class="input" type="email" name="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input class="input" type="number" name="cpf" placeholder="CPF">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="address" placeholder="Endereço">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="city" placeholder="Cidade">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="UF" placeholder="UF">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="zip-code" placeholder="CEP">
                    </div>
                    <div class="form-group">
                        <input class="input" type="tel" name="tel" placeholder="Telefone">
                    </div>
                    <div class="form-group">
                        <div class="input-checkbox">
                            <input type="checkbox" id="create-account">
                            <label for="create-account">
                                <span></span>
                                Criar uma conta?
                            </label>
                            <div class="caption">
                                <p>Digite uma senha segura, você utilizará sua conta para acompanhar o pedido.</p>
                                <input class="input" type="password" name="password" placeholder="Digite sua Senha">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Billing Details -->

                <!-- Shiping Details -->
                <div class="shiping-details">
                    <div class="section-title">
                        <h3 class="title">Endereço de Entrega</h3>
                    </div>
                    <div class="input-checkbox">
                        <input type="checkbox" id="shiping-address">
                        <label for="shiping-address">
                            <span></span>
                            É um endereço diferente?
                        </label>
                        <div class="caption">
                            <div class="form-group">
                                <input class="input" type="text" name="first-name" placeholder="Primeiro Nome">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="last-name" placeholder="Último Nome">
                            </div>
                            <div class="form-group">
                                <input class="input" type="number" name="cpf" placeholder="CPF">
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="number" name="cpf" placeholder="CPF">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="address" placeholder="Endereço">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="city" placeholder="Cidade">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="UF" placeholder="UF">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="zip-code" placeholder="CEP">
                            </div>
                            <div class="form-group">
                                <input class="input" type="tel" name="tel" placeholder="Telefone">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Shiping Details -->

                <!-- Order notes -->
                <div class="order-notes">
                    <textarea class="input" placeholder="Complemento"></textarea>
                </div>
                <!-- /Order notes -->
            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Seu Pedido</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUTO</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div class="order-products">
                        <div class="order-col">
                            <div>1x Product Name Goes Here</div>
                            <div>$980.00</div>
                        </div>
                        <div class="order-col">
                            <div>2x Product Name Goes Here</div>
                            <div>$980.00</div>
                        </div>
                    </div>
                    <div class="order-col">
                        <div>Shiping</div>
                        <div><strong>FREE</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">$2940.00</strong></div>
                    </div>
                </div>
                <div class="payment-method">
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-1">
                        <label for="payment-1">
                            <span></span>
                            Direct Bank Transfer
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2">
                        <label for="payment-2">
                            <span></span>
                            Cheque Payment
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-3">
                        <label for="payment-3">
                            <span></span>
                            Paypal System
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
                <a href="#" class="primary-btn order-submit">Comprar Agora</a>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
