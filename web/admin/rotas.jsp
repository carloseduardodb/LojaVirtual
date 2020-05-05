<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 27/04/2020
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%
    String pagina = "inicio";

    if (request.getParameterMap().containsKey("pagina")) {
        pagina = request.getParameter("pagina");
    }
%>