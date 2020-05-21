<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.util.List" %>
<%


%>
<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 27/04/2020
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%
    String pagina = "" + request.getParameter("pagina");
%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="corpo">

<%@include file="frontpages/navbar/navbar.jsp" %>
<% if (pagina.equals("home") || pagina.equals("null")) {%>

<%@include file="frontpages/destaquecategoria/destaquecategoria.jsp" %>
<%@include file="frontpages/novosprodutos/novosprodutos.jsp" %>
<%@include file="frontpages/promocao/promocao.jsp" %>
<%@include file="frontpages/maisvendidosall/maisvendidosall.jsp" %>

<%} else if (pagina.equals("produto")) {%>

<%@include file="frontpages/produto/produto.jsp" %>
<div style="height: 25px;"></div>
<%@include file="frontpages/produtossemelhantes/produtossemelhantes.jsp" %>

<%} else if (pagina.equals("checkout")) {%>

<%@include file="frontpages/checkout/checkout.jsp" %>

<%} else if (pagina.equals("store")) {%>

<%@include file="frontpages/store/store.jsp" %>

<%} else if (pagina.equals("login")) {%>

<%@include file="frontpages/login/login.jsp" %>

<%} else if (pagina.equals("cadastro")) {%>

<%@include file="frontpages/cadastro/cadastro.jsp" %>

<%}%>
<%if (!pagina.equals("cadastro")) {%>
<%@include file="frontpages/recebanovasofertas/recebanovasofertas.jsp" %>
<%}%>
<%@include file="frontpages/footer/footer.jsp" %>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>

<script>
    //crio as variaveis para saber se tranferiu de pagina e poder executar o codigo apenas uma vez
    var produtocheio = "";
    var transferiu = false;
    var colocaprodutos;
    var params;

    $("#pesquisa").keyup(function () {
        removeDOMinsertpage();
        preencheprodutos();
    });

    $('#option-cat').change(function () {
        removeDOMinsertpage();
        preencheprodutos();
    });

    //essa funcao é meio inutil mas deixarei aqui caso o usuario clique em pesquisar
    $(document).on("submit", "#form-pesquisa", function (event) {
        var $form = $(this);
        var colocaprodutos = $("#produtos-coloca");
        var produtocheio = "";
        $.get($form.attr("action"), $form.serialize(), function (response) {
            $.each(response, function (index, dadosprodutoslist) {
                produtocheio += '<div id="incorpora"><div id="produto-ad" class="col-md-4 col-xs-6">' +
                    '								<div class="product">' +
                    '									<div class="product-img">' +
                    '										<img src="img/' + dadosprodutoslist.imagem + '" alt="">' +
                    '									</div>' +
                    '									<div class="product-body">' +
                    '										<p class="product-category">' + dadosprodutoslist.categoria + '</p>' +
                    '										<h3 class="product-name"><a href="#">' + dadosprodutoslist.nome + '</a></h3>' +
                    '										<h4 class="product-price">R$' + dadosprodutoslist.preco + ' <del class="product-old-price">R$' + dadosprodutoslist.preco_alto + '</del></h4>' +
                    '										<div class="product-rating">' +
                    '										</div>' +
                    '										<div class="product-btns">' +
                    '											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">adicionar a lista de desejos</span></button>' +
                    '											<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">fazer comparação</span></button>' +
                    '											<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">visualizar</span></button>' +
                    '										</div>' +
                    '									</div>' +
                    '									<div class="add-to-cart">' +
                    '										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> comprar</button>' +
                    '									</div>' +
                    '								</div>' +
                    '							</div> <br> </div>';
                //console.log(produtocheio);
            });
            for (var o = 0; o <= 50; o++) {
                $('#incorpora').remove();
            }
            colocaprodutos.append(produtocheio);
        });

        event.preventDefault();
    });

    function remocao() {
        $(".bloco-destaque-categoria").remove();
        $(".bloco-novos-produtos").remove();
        $("#hot-deal").remove();
        $(".mais-vendidos-all").remove();
    }

    function enviaparametros(produtocheio, colocaprodutos, params) {
        $.get("../store", $.param(params), function (response) {
            $.each(response, function (index, dadosprodutoslist) {
                produtocheio += '<div id="incorpora"><div id="produto-ad" class="col-md-4 col-xs-6">' +
                    '								<div class="product">' +
                    '									<div class="product-img">' +
                    '										<img src="img/' + dadosprodutoslist.imagem + '" alt="">' +
                    '									</div>' +
                    '									<div class="product-body">' +
                    '										<p class="product-category">' + dadosprodutoslist.categoria + '</p>' +
                    '										<h3 class="product-name"><a href="#">' + dadosprodutoslist.nome + '</a></h3>' +
                    '										<h4 class="product-price">R$' + dadosprodutoslist.preco + ' <del class="product-old-price">R$' + dadosprodutoslist.preco_alto + '</del></h4>' +
                    '										<div class="product-rating">' +
                    '										</div>' +
                    '										<div class="product-btns">' +
                    '											<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">adicionar a lista de desejos</span></button>' +
                    '											<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">fazer comparação</span></button>' +
                    '											<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">visualizar</span></button>' +
                    '										</div>' +
                    '									</div>' +
                    '									<div class="add-to-cart">' +
                    '										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> comprar</button>' +
                    '									</div>' +
                    '								</div>' +
                    '							</div> <br> </div>';
                //console.log(produtocheio);
            });

            //limpo as tags com id incorpora >jquery nao elimina todas
            // com um comando só a solução foi repetir o comando diversas
            // vezes pra limpar tudo, como são poucas vezes não perde muito desempenho
            for (var o = 0; o <= 50; o++) {
                $('#incorpora').remove();
            }

            //coloco os produtos dentro da div
            colocaprodutos.append(produtocheio);
            event.preventDefault();
        });
    }

    function removeDOMinsertpage() {
        if (!transferiu) {
            transferiu = true;
            $.get("frontpages/store/store.jsp", function (data) {
                $("#especial").html(data); // insere o retorno do Ajax dentro da <head>
            });
            //remove os elementos do DOM
            remocao();
        }
    }

    function preencheprodutos() {
        //crio objeto de parametros para enviar os dados para a servlet
        params = {
            pesquisa: $('#pesquisa').val(),
            categoria: $('#option-cat').val(),
            fabricante: $('#option-fab').val(),
            precomin: $('#price-min').val(),
            precomax: $('#price-max').val()
        };

        //div selecionada para colocar os produtos dentro
        colocaprodutos = $("#produtos-coloca");

        //preecho a variavel produtocheio com as tags html preenchidas com dados do banco enviados da servlet
        produtocheio = "";

        //envio para a servlet os parametros  e recebo uma resposta de callback onde percorro o arrray e vou preenchendo os itens
        enviaparametros(produtocheio, colocaprodutos, params);
    }

    function insertfabricante(fabricante, colocawidget) {
        var widget = "";
        for(var i in fabricante){
            widget += '<div id="listafab" class="input-checkbox">'+
                '<input type="radio" name="fbrcnt" value="'+fabricante[i].id_fabricante+'" id="'+fabricante[i].id_fabricante+'">'+
                '<label for="'+fabricante[i].id_fabricante+'">'+
                '<span></span>'+
                    fabricante[i].fabricante+
                '<small></small>'+
                '</label>'+
                '</div>';
        }
        console.log(widget);
        colocawidget.append(widget);
    }
</script>