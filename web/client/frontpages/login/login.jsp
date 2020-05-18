<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 17/05/2020
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .login-form {
        width: 400px;
        margin: 5vh auto;
    }

    .login-form form {
        margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }

    .login-form h2 {
        margin: 0 0 15px;
    }

    .login-form .hint-text {
        color: #777;
        padding-bottom: 15px;
        text-align: center;
    }

    .form-control,
    .btn {
        min-height: 38px;
        border-radius: 2px;
    }

    .login-btn {
        font-size: 15px;
        font-weight: bold;
        border-radius: 5px;
        background-color: #9477ff;
    }

    .login-btn:hover {
        font-size: 15px;
        font-weight: bold;
        border-radius: 5px;
        background-image: linear-gradient(#9477ff, #765ae0);
    }

    .or-seperator {
        margin: 20px 0 10px;
        text-align: center;
        border-top: 1px solid #ccc;
    }

    .or-seperator i {
        padding: 0 10px;
        background: #f7f7f7;
        position: relative;
        top: -11px;
        z-index: 1;
    }

    .social-btn .btn {
        color: #1E1F29;
        border-color: #f7f7f7;
        background-color: #f7f7f7;
        border-radius: 5px;
        margin: 10px 0;
        font-size: 15px;
        text-align: left;
        line-height: 24px;
    }

    .social-btn :hover{
        color: #1E1F29;
        border-color: #fff;
        background-image: linear-gradient(#e0daf5, #ab9ed9);
        border-radius: 5px;
        margin: 10px 0;
        font-size: 15px;
        text-align: left;
        line-height: 24px;
    }

    .social-btn .btn i {
        float: left;
        margin: 4px 15px 0 5px;
        min-width: 15px;
    }

    .input-group-addon .fa {
        font-size: 18px;
    }

    .fundo{
        background:url("img/undraw_login.svg") top right no-repeat, url("img/undraw_authentication.svg") top left no-repeat;
        background-size: 30vw;
    }

</style>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Login</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Inicio</a></li>
                    <li class="active">Login</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->
<div class="fundo">
<div class="login-form">
    <form action="backpages/usuario/model.jsp" method="get">
        <h2 class="text-center">Login</h2>
        <div class="text-center social-btn">
            <a href="#" class="btn btn-danger btn-block"><i class="fa fa-plus-circle"></i> Não tem uma conta? <b>Cadastre-se!</b></a>
        </div>
        <div class="or-seperator"><i>ou</i></div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input name="acao" value="login" hidden>
                <input type="text" class="form-control" name="email" placeholder="Email" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="senha" placeholder="Senha" required="required">
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-block login-btn">Login</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> Lembre-me</label>
            <a href="#" class="pull-right">Esqueceu sua senha?</a>
        </div>
    </form>
</div>
</div>