<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="crudclient.carrinho.Carrinho" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 07:24
--%>
<%
    String telefone = "", email = "", endereco = "", fabricantejson ="";
    List<Cliente> cl = (List<Cliente>) session.getAttribute("cliente");
    if (session.getAttribute("cliente") != null) {
        telefone = ""+cl.get(0).getFone1();
        email = ""+cl.get(0).getEmail();
        endereco = ""+cl.get(0).getEndereco() + ", " + cl.get(0).getNumero();
    }
    List<Categoria> lc = null;
    if(session.getAttribute("categoria") == null){
        response.sendRedirect("backpages/navbar/model.jsp");
    }else{
        lc = (List<Categoria>) session.getAttribute("categoria");
    }

    List<Fabricante> ltfb = null;

    if(session.getAttribute("jsonfabricante") != null){
        ltfb = (List<Fabricante>) session.getAttribute("jsonfabricante");
        fabricantejson = new Gson().toJson(ltfb);
    }

    Double subtotal = 0.00;
    List<Carrinho> carrinhoprodutos = null;
    if(session.getAttribute("carrinhocliente") != null){
        carrinhoprodutos = (List<Carrinho>) session.getAttribute("carrinhocliente");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HEADER -->
<header>

    <input id="fabjson" value='<%=fabricantejson%>' hidden>

    <!-- TOP HEADER -->
    <%if (session.getAttribute("cliente") != null) {%>
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> <%=telefone%></a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> <%=email%></a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> <%=endereco%></a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> BRL</a></li>
                <li><a href="#"><i class="fa fa-user-o"></i> Minha Conta</a></li>
            </ul>
        </div>
    </div>
    <%} else {%>
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> BRL</a></li>
                <li><a href="index.jsp?pagina=login"><i class="fa fa-user-o"></i> Login</a></li>
            </ul>
        </div>
    </div>
    <%}%>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="index.jsp" class="logo">
                            <img src="img/logo.png" alt="" width="200">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form id="form-pesquisa" action="../store" method="post">
                            <select class="input-select" id="option-cat">
                                <option value="0">Todas Categorias</option>
                                <% if(lc != null){%>
                                <% for(Categoria c : lc) {%>
                                <option value="<%=c.getId()%>"><%=c.getNome()%></option>
                                <%}}%>
                            </select>
                            <input style="width: 175px" id="pesquisa" name="pesquisa" class="input" placeholder="Procure aqui">
                            <button class="search-btn" type="submit">Pesquisar</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <% if(session.getAttribute("cliente")!=null && session.getAttribute("carrinhocliente") != null) {%>
                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" style="color: black" data-toggle="dropdown" aria-expanded="true">
                                <h2><i class="fa fa-shopping-cart"></i></h2>
                                <span><h5>Seu Carrinho</h5></span>
                                <div class="qty"><%=carrinhoprodutos != null ? carrinhoprodutos.size() : "0"%></div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <% for(Carrinho cr : carrinhoprodutos) {%>
                                    <% subtotal += cr.getPreco(); %>
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="./img/<%=cr.getImagem()%>" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#"><%=cr.getProduto()%></a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>R$ <%=cr.getPreco()%></h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                    <%}%>
                                </div>
                                <div class="cart-summary">
                                    <small><%=carrinhoprodutos != null ? carrinhoprodutos.size() : "0"%> Item(s) selecionados</small>
                                    <h5>SUBTOTAL: R$ <%=subtotal%></h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">Ver Carrinho</a>
                                    <a href="backpages/venda/model.jsp">Comprar <i class="fa fa-shopping-bag"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
                <%}%>

            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="#">Inicio</a></li>
                <% if(lc != null){%>
                <% for(Categoria c : lc) {%>
                <li><a href="#"><%=c.getNome()%></a></li>
                <%}}%>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<div id="especial"></div>