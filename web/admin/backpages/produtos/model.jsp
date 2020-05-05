<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 28/04/2020
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //declaro as variaveis a serem recebidas pelas acoes CRUD
    String id, acao, nome, idcategoria, ativo;
    acao = request.getParameter("acao");

    if (acao.equals("cadastrar")) {
        nome = request.getParameter("nome");
        idcategoria = request.getParameter("categoria");
        ativo = request.getParameter("ativo");

        Subcategoria subcategoria = new Subcategoria(nome, ativo, idcategoria);
        SubCategoriasDAO scdao = new SubCategoriasDAO();
        Boolean cadastro = scdao.create(subcategoria);
        response.sendRedirect("../../index.jsp?pagina=subcategorias&cadastrou=" + cadastro);

    }else if (acao.equals("apagar")){

        SubCategoriasDAO subcategoriadao = new SubCategoriasDAO();
        id = request.getParameter("id");
        response.sendRedirect("../../index.jsp?pagina=subcategorias&apagou="
                +subcategoriadao.delete(Integer.parseInt(id)));

    }else if(acao.equals("atualizar")){

        id = request.getParameter("id");
        nome = request.getParameter("nome");
        idcategoria = request.getParameter("categoria");
        ativo = request.getParameter("ativo");

        System.out.println("****************************** id: "+id);
        System.out.println("****************************** nome: "+nome);
        System.out.println("****************************** categoria: "+idcategoria);
        System.out.println("****************************** ativo: "+ativo);

        Subcategoria subcategoria = new Subcategoria(Integer.parseInt(id), nome, ativo, idcategoria);
        SubCategoriasDAO scdao = new SubCategoriasDAO();
        Boolean update = scdao.update(subcategoria);
        response.sendRedirect("../../index.jsp?pagina=subcategorias&atualizou=" + update);

    }else if(acao.equals("visualizar")){

        response.sendRedirect("../../index.jsp?pagina=subcategorias");

    }
%>