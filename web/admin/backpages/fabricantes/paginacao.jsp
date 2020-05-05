<%@ page import="crudadmin.fabricante.FabricanteDAO" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 05/05/2020
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String pesquisa = "";
    String query = "";
    String where = "";
    String estaativoquery = "";
    String estaativourl = "";

    if (request.getParameterMap().containsKey("pesquisa") && !request.getParameter("pesquisa").equals("")) {
        pesquisa = request.getParameter("pesquisa");
        where = " WHERE fabricante ";
        query = " LIKE '%" + pesquisa + "%'";
        estaativourl = request.getParameter("searching-option");
        if (request.getParameter("searching-option").equals("Inativo")) {
            estaativoquery = " AND ativo_fabricante = 'N' ";
        } else if (request.getParameter("searching-option").equals("Categoria")) {
            estaativoquery = "";
        } else {
            estaativoquery = " AND ativo_fabricante = 'S' ";
        }
    }

    //--PAGINAÇÃO E LISTAGEM DAS CATEGORIAS--

    //instancia de CRUD da categoria
    FabricanteDAO fbdao = new FabricanteDAO();

    //recebe dados da listagem de categoria do CRUD especificando a query sql
    List<Fabricante> listainteira = fbdao.read("SELECT * FROM fabricante " + where + query + estaativoquery + ";");

    //ordem da lista a ser visualizada
    int ordem = 0;

    //recebo o parametro ordem passada via get pra saber que pagina mandar pra view
    if (request.getParameterMap().containsKey("ordem")) {
        ordem = Integer.parseInt(request.getParameter("ordem"));
    }

    //tamanho quantidade de linhas retornadas do banco
    int tamanho = listainteira.size();

    //quantidade de linhas por paginas
    final int LPP = 5;

    //determinar quantidade de paginas
    int paginaTamanho = Math.round(tamanho / LPP - 1);

    //determina total de paginas mostradas
    int paginas_mostradas = Math.round(tamanho / LPP);

    int ordem_mostradas = ordem + 1;
    int inicio = ordem * LPP;
    int proximo, anterior;

    //adiciona para onde a url vai retornar na pagina atual
    String url_proximo = "";
    String url_voltar = "";


    /* adiciona ou não uma string disable
     * caso não houver uma proxima pagina ou anterior
     */
    String tem_url_proximo = "";
    String tem_url_voltar = "";

    if (ordem == 0) {
        tem_url_voltar = "disabled";
        listainteira = fbdao.read("SELECT * FROM fabricante " + where + query + estaativoquery + " LIMIT " + inicio + ", " + LPP + ";");
        proximo = ordem + 1;
        url_proximo = "backpages/fabricantes/model.jsp?acao=visualizar&ordem=" + proximo + "&pesquisa=" + pesquisa + "&searching-option=" + estaativourl;
    }

    if (ordem > 0) {
        listainteira = fbdao.read("SELECT * FROM fabricante " + where + query + estaativoquery + " LIMIT " + inicio + ", " + LPP + ";");
        proximo = ordem + 1;
        url_proximo = "backpages/fabricantes/model.jsp?acao=visualizar&ordem=" + proximo + "&pesquisa=" + pesquisa + "&searching-option=" + estaativourl;

        anterior = ordem - 1;
        url_voltar = "backpages/fabricantes/model.jsp?acao=visualizar&ordem=" + anterior + "&pesquisa=" + pesquisa + "&searching-option=" + estaativourl;
    }

    if (ordem == paginas_mostradas) {
        tem_url_proximo = "disabled";
    }

    /* toda vez que abro a categoria a acao visualizar
     * é nativa e a atualizacao
     * da tabela é necessaria em cada acao CRUD, esses metodos atualizam a mesma
     */
    Map<String, String> pag = new HashMap<String, String>();
    pag.put("tem_url_voltar", tem_url_voltar);
    pag.put("url_voltar", url_voltar);
    pag.put("tem_url_proximo", tem_url_proximo);
    pag.put("url_proximo", url_proximo);
    pag.put("paginas_mostradas", "" + paginas_mostradas);
    pag.put("pesquisa", pesquisa);
    pag.put("searching-option", estaativourl);
    session.removeAttribute("listacategoria");
    session.removeAttribute("indices");
    session.setAttribute("listacategoria", listainteira);
    session.setAttribute("indices", pag);
%>