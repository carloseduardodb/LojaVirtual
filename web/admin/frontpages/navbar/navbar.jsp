<%@ page contentType="text/html; charset=UTF-8" %>
<div class="menu-detalhes container-fluid">
    <div class="row mobile-fixed">
        <div class="col">
            <a href="#"><img class="logo" src="img/logo.png" width="150px"></a>
        </div>
        <div class="col opcoes">
            <a href="#" class="d-lg-none d-md-none"><img src="img/menu-mobile.png" width="35px"></a>
            <a href="#"><img src="img/notify.png" width="35px"></a>
            <a href="backpages/navbar/modelnavbar.jsp"><img src="img/exit.png" width="35px"></a>
        </div>
    </div>

    <div class="row mobile-dual-nav">
        <div class="col">
            <a href="#"><img class="logo" src="img/logo.png" width="150px"></a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-xs-12 foto-perfil">
            <a href="#"><img class="perfil" src="img/profile.jpg" align="left" width="80px" height="80px"></a>
            <ul class="dados">
                <li>
                    <h6>Bem vindo(a)!</h6>
                </li>
                <li>
                    <img src="img/email.png" width="20px">
                    carloscangere@hotmail.com</li>
                <li>
                    <img src="img/phone.png" width="20px" height="20px">
                    (35) 998284138</li>
            </ul>
        </div>

        <div class="col">
            <div class="row" style="">
                <div class="col"></div>
                <div class="dados-gerais">
                    <a href="#"><img src="img/product.png" width="50px"></a>
                    <li>25</li>
                    </ul>
                </div>

                <div class="dados-gerais">
                    <a href="#"><img src="img/users.png" width="50px"></a>
                    <li>25</li>
                    </ul>
                </div>

                <div class="dados-gerais">
                    <a href="#"><img src="img/sales.png" width="50px"></a>
                    <li>25</li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <div class="menu">
        <button onclick="window.location.href = 'index.jsp'">Inicio</button>
        <button onclick="window.location.href = 'backpages/vendas/controller.jsp?acao=visualizar'">Vendas</button>
        <button onclick="window.location.href = 'backpages/categorias/model.jsp?acao=visualizar'">Categorias</button>
        <button onclick="window.location.href = 'backpages/subcategorias/model.jsp?acao=visualizar'">Subcategorias</button>
        <button onclick="window.location.href = 'backpages/fabricantes/model.jsp?acao=visualizar'">Fabricantes</button>
        <button onclick="window.location.href = 'backpages/produtos/model.jsp?acao=visualizar'">Produtos</button>
    </div>

    <div class="menu-mobile">

        <button onclick="window.location.href = 'index.html'">Inicio</button>
        <button onclick="window.location.href = 'categorias.html'">Categorias</button>
        <button onclick="window.location.href = 'subcategoria.html'">Subcategorias</button>
        <button onclick="window.location.href = 'produtos.html'" class="selected">Produtos</button>

    </div>
</div>