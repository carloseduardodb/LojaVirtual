<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .section {
        padding-top: 0px;
    }

    .btn-success{
        font-size: 13pt;
        background-color: #9477ff;
        border: none;
    }

    .btn-success:hover{
        background: linear-gradient(#9477ff, #765ae0);
    }

    .btn-submit{
        margin-top: 25px;
        text-align: center;
    }

    .fundo{
        background: url(img/fundoregister.svg) right no-repeat;
        background-size: 45vw;
    }

</style>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Cadastre-se</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Cadastro</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
<!-- SECTION -->
<div class="section fundo">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <form method="GET">
                <div class="col-md-7">
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
                        <input class="input" type="text" name="country" placeholder="UF">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="zip-code" placeholder="CEP">
                    </div>
                    <div class="form-group">
                        <input class="input" type="tel" name="tel" placeholder="Telefone">
                    </div>
                    <div class="form-group">
                        <input class="input" type="password" name="password" placeholder="Senha">
                    </div>
                    <div class="form-group">
                        <input class="input" type="password" name="password" placeholder="Repita sua senha">
                    </div>
                    <div class="btn-submit">
                        <button type="submit" class="btn btn-success" onclick="">Cadastrar</button>
                    </div>
                </div>
        </div>
        </form>
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->
