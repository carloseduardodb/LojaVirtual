<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 07:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<DadosProdutosList> dadosprodutoslistcategorias = null;
    List<DadosProdutosList> dadosprodutossubcategorias = null;
    List<DadosProdutosList> dadosprodutoslistfabricante = null;

    if(session.getAttribute("listultimascategorias") != null){
        dadosprodutoslistcategorias = (List<DadosProdutosList>) session.getAttribute("listultimascategorias");
        dadosprodutossubcategorias = (List<DadosProdutosList>) session.getAttribute("listultimassubcategorias");
        dadosprodutoslistfabricante = (List<DadosProdutosList>) session.getAttribute("listultimasfabricante");
    }

%>

<div class="section mais-vendidos-all">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top categoria</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <!-- product widget -->
                        <% if(dadosprodutoslistcategorias!=null) { int i = 0;%>
                        <% for(DadosProdutosList dpl: dadosprodutoslistcategorias) { i++; if(i<=3){%>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/<%=dpl.getImagem()%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"><%=dpl.getCategoria()%></p>
                                <h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto=<%=dpl.getId_produto()%>"><%=dpl.getNome()%></a></h3>
                                <h4 class="product-price">R$<%=dpl.getPreco()%> <del class="product-old-price">R$<%=dpl.getPreco_alto()%></del></h4>
                            </div>
                        </div>
                        <%}}}%>
                        <!-- /product widget -->
                    </div>

                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top subcategoria</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <% if(dadosprodutossubcategorias!=null) { int i = 0;%>
                        <% for(DadosProdutosList dplsub: dadosprodutossubcategorias) { i++; if(i<=3){%>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/<%=dplsub.getImagem()%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"><%=dplsub.getSubcategoria()%></p>
                                <h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto=<%=dplsub.getId_produto()%>"><%=dplsub.getNome()%></a></h3>
                                <h4 class="product-price">R$<%=dplsub.getPreco()%> <del class="product-old-price">R$<%=dplsub.getPreco_alto()%></del></h4>
                            </div>
                        </div>
                        <%}}}%>
                        <!-- /product widget -->
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top fabricante</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        <!-- product widget -->
                        <% if(dadosprodutoslistfabricante!=null) { int i = 0;%>
                        <% for(DadosProdutosList dplfab: dadosprodutoslistfabricante) { i++; if(i<=3){%>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/<%=dplfab.getImagem()%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"><%=dplfab.getFabricante()%></p>
                                <h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto=<%=dplfab.getId_produto()%>"><%=dplfab.getNome()%></a></h3>
                                <h4 class="product-price">R$<%=dplfab.getPreco()%> <del class="product-old-price">R$<%=dplfab.getPreco_alto()%></del></h4>
                            </div>
                        </div>
                        <%}}}%>
                        <!-- /product widget -->
                    </div>

                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
