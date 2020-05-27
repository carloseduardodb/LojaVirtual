<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 28/04/2020
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    session.invalidate();
    response.sendRedirect("../../../login/index.jsp?logout=true");

%>