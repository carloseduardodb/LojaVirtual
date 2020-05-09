<%@ page import="crudadmin.produtos.Produto" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    List<Produto> listaproduto = (List<Produto>) session.getAttribute("listaproduto");
    Map<String, String> pag = (Map<String, String>) session.getAttribute("indices");
    int paginasmostradas = Integer.parseInt(pag.get("paginas_mostradas"));
    String pesquisa = pag.get("pesquisa");
    String ativo = pag.get("searching-option");
%>

<div class="container pagina-inicio" align="center">
    <h2>Área administrativa - Produtos</h2>
    <hr/>
    <form method="get" action="backpages/produtos/model.jsp" class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option" name="searching-option">
            <option>Produto</option>
            <option>Ativo</option>
            <option>Inativo</option>
        </select>
        <input type="text" class="form-control" name="pesquisa" placeholder="Pesquisar">
        <input type="text" hidden="hidden" name="acao" value="visualizar">
        <span class="input-group-btn">
        <button style="background-color: #6C63FF" class="btn btn-default" type="submit"><img src="img/searching.png" width="21px"></button>
      </span>
        <a style="color: #fff;" class="btn btn-cadastrar" onclick="window.location.href = 'backpages/produtos/cadatuprodutos/model.jsp?acao=visualizar'">Cadastrar
        </a>
    </form>

    <div class="tabela col-8">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Preço</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
            <% for(Produto pd : listaproduto) {%>
            <tr>
                <th scope="row"><%=pd.getId_produto()%></th>
                <td style="max-width: 30ch;"><%=pd.getProduto()%></td>
                <td><%=pd.getPreco()%></td>
                <td>
                    <button class="acao btn"><img src="img/editar.png" width="15px" height="15px"></button>
                    <button class="acao btn" onclick="location.href='backpages/produtos/model.jsp?acao=apagar&id=<%=pd.getId_produto()%>'"><img src="img/apagar.png" width="15px" height="15px"></button>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item <%=pag.get("tem_url_voltar")%>">
                <a class="page-link" href="<%=pag.get("url_voltar")%>" tabindex="-1">Anterior</a>
            </li>
            <% for (int x = 0; x <= paginasmostradas; x++) { %>
            <% if (x < 2 || x > paginasmostradas - 2) {%>
            <li class="page-item"><a class="page-link"
                                     href="backpages/produtos/model.jsp?acao=visualizar&ordem=<%=x%>&pesquisa=<%=pesquisa%>&searching-option=<%=ativo%>"><%=x + 1%>
            </a></li>
            <% if (x == 1) {%>
            <li class="page-item"><a class="page-link" href="#">...</a></li>
            <%
                        }
                    }
                }
            %>
            <li class="page-item <%=pag.get("tem_url_proximo")%>">
                <a class="page-link" href="<%=pag.get("url_proximo")%>">Próximo</a>
            </li>
        </ul>
    </div>
</div>
</div>
