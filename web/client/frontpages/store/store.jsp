<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 08:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .section{
        padding-top: 0;
    }
</style>

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Produtos</a></li>
                    <li><a href="#">Pesquisa</a></li>
                    <li class="active" id="pesquisa-inform"></li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Preço</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>
                        <div class="input-number price-min">
                            <input id="price-min" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span>-</span>
                        <div class="input-number price-max">
                            <input id="price-max" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->
                <input hidden id="option-fab">
                <br/> <br/>

                <!-- aside Widget -->
                <div class="aside" id="fab-radius">
                    <h3 class="aside-title">Fabricantes</h3>
                    <div id="checkboxfilter" class="checkbox-filter">
                        <div id="listafab" class="input-checkbox">
                            <input type="radio" name="fbrcnt" value="0" id="0">
                            <label for="0">
                                <span></span>
                                    Todos Fabricantes
                                <small></small>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select">
                                <option value="0">Popular</option>
                                <option value="1">Position</option>
                            </select>
                        </label>

                        <label>
                            Show:
                            <select class="input-select">
                                <option value="0">20</option>
                                <option value="1">50</option>
                            </select>
                        </label>
                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                -->
                <!-- /store top filter -->

                <!-- store products -->
                <div class="row" id="produtos-coloca">

                </div>
                <!-- /store products -->

                <!-- store bottom filter
                <div class="store-filter clearfix">
                    <span class="store-qty">Showing 20-100 products</span>
                    <ul class="store-pagination">
                        <li class="active">1</li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                -->
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<script src="js/main.js"></script>

<script>
    var fabricantest = document.getElementById('fabjson').value;
    var colocawidget = $('#checkboxfilter');
    insertfabricante(JSON.parse(fabricantest), colocawidget);

    $('#checkboxfilter input[type=radio]').change(function(){
        document.getElementById('option-fab').setAttribute("value", $(this).val());
        removeDOMinsertpage();
        preencheprodutos();
    });
</script>
