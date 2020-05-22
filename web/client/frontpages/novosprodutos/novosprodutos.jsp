<%@ page import="crudclient.listagem.DadosProdutosList" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 07:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    List<DadosProdutosList> ltpd = null;
    if (session.getAttribute("listultimosprodutos") != null) {
        ltpd = (List<DadosProdutosList>) session.getAttribute("listultimosprodutos");
    }

%>

<div class="section bloco-novos-produtos">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Novos Produtos</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <% if (ltpd != null) {
                                int i = 0;%>
                            <% for (DadosProdutosList dpl : ltpd) {
                                i++;
                                if (i <= 5) {%>
                            <!--<li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>--->
                            <li><a data-toggle="tab" href="#tab1"><%=dpl.getCategoria()%>
                            </a></li>
                            <%
                                        }
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <% if (ltpd != null) {
                                    int i = 0;%>
                                <% for (DadosProdutosList dpl : ltpd) {
                                    i++;%>
                                <%
                                    Float preco_alto = Float.parseFloat(dpl.getPreco_alto());
                                    Float preco = Float.parseFloat(dpl.getPreco());
                                    Float desconto = ((preco_alto - preco) / preco) * 100;
                                    DecimalFormat df = new DecimalFormat("0");
                                %>
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="./img/<%=dpl.getImagem()%>" alt="">
                                        <div class="product-label">
                                            <span class="sale"> - <%=df.format(desconto)%>%</span>
                                            <%if (i <= 3) {%>
                                            <span class="new">NOVO</span>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category"><%=dpl.getCategoria()%>
                                        </p>
                                        <h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto=<%=dpl.getId_produto()%>"><%=dpl.getNome()%>
                                        </a></h3>
                                        <h4 class="product-price">R$<%=dpl.getPreco()%>
                                            <del class="product-old-price">R$<%=dpl.getPreco_alto()%>
                                            </del>
                                        </h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                    class="tooltipp">adicionar a lista de desejos</span></button>
                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                    class="tooltipp">comparar</span></button>
                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <button onclick="location.href='backpages/carrinho/model.jsp?idproduto=<%=dpl.getId_produto()%>'" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> <a class="plusaddcar"><i class="fa fa-plus"></i></a>  Carrinho </button>
                                    </div>
                                </div>
                                <!-- /product -->
                                <%
                                        }
                                    }
                                %>

                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>