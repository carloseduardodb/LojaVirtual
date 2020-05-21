<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 07:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Categoria> dcs = null;
    if(session.getAttribute("categoria")!=null){
        dcs = (List<Categoria>) session.getAttribute("categoria");
    }
%>

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Sobre nós</h3>
                        <p>A Loja Virtual é uma empresa solidificada no mercado e vendemos produtos a 10 anos.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>Dom Otto Motta, 526</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+055-35-998754898</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>carlosdev@gmail.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categorias</h3>
                        <ul class="footer-links">
                            <% if(dcs!=null) {%>
                            <% for(Categoria ctg : dcs) {%>
                            <li><a href="#"><%=ctg.getNome()%></a></li>
                            <%}}%>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Informações</h3>
                        <ul class="footer-links">
                            <li><a href="#">Sobre</a></li>
                            <li><a href="#">Contate-nos</a></li>
                            <li><a href="#">Privacidade e Segurança</a></li>
                            <li><a href="#">Encomendas e Devoluções</a></li>
                            <li><a href="#">Termos e Condições</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Serviço</h3>
                        <ul class="footer-links">
                            <li><a href="#">Minha Conta</a></li>
                            <li><a href="#">Ver Meu Carrinho</a></li>
                            <li><a href="#">Lista de Desejos</a></li>
                            <li><a href="#">Rastrear Meu Pedido</a></li>
                            <li><a href="#">Ajuda</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> Todos os direitos reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Creative Designer Code</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->