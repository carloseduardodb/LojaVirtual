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
                '										<h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto='+dadosprodutoslist.id_produto+'">' + dadosprodutoslist.nome + '</a></h3>' +
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
                '										<h3 class="product-name"><a href="backpages/selectproduto/model.jsp?idproduto='+dadosprodutoslist.id_produto+'">' + dadosprodutoslist.nome + '</a></h3>' +
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