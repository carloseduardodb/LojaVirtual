<%@ page import="crudclient.listagem.DestaqueCategoria" %>
<%@ page import="crudclient.listagem.Listagem" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 16/05/2020
  Time: 07:28
  To change this template use File | Settings | File Templates.
--%>
<%
    List<DestaqueCategoria> lstdestaq = null;
    if(session.getAttribute("listadestaquecategoria") != null){
       lstdestaq = (List<DestaqueCategoria>) session.getAttribute("listadestaquecategoria");
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- SECTION -->
<div class="section bloco-destaque-categoria">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <%if(lstdestaq!=null){%>
            <% int i = 0; %>
            <%for(DestaqueCategoria dc : lstdestaq){ i++; if(i<=3){%>
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img" style="height: 240px; width: 500px; padding-right: 80px" align="center">
                        <img style="width: 300px; height: 240px;" src="img/<%=dc.getImagem()%>" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Coleções de <br><%=dc.getCategoria()%></h3>
                        <a href="#" class="cta-btn">Compre agora <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <%}}}%>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->