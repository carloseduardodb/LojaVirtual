<%@ page import="crudadmin.fabricante.Fabricante" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<Fabricante> listainteira = (List<Fabricante>) session.getAttribute("listafabricante");
    Map<String, String> pag = (Map<String, String>) session.getAttribute("indices");
    int paginasmostradas = Integer.parseInt(pag.get("paginas_mostradas"));
    String pesquisa = pag.get("pesquisa");
    String ativo = pag.get("searching-option");
%>

<div class="container pagina-inicio" align="center">
    <h2>Área administrativa - Fabricantes</h2>
    <hr />
    <div class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option">
            <option>Fabricante</option>
            <option>Ativo</option>
            <option>Inativo</option>
        </select>
        <input type="text" class="form-control" placeholder="Pesquisar">
        <span class="input-group-btn">
        <a class="btn btn-default" type="button"><img src="img/searching.png" width="21px"></a>
      </span>
        <button class="btn btn-cadastrar" data-toggle="modal" data-target="#modalExemplo">Cadastrar</button>
    </div>

    <div class="tabela col-8">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Fabricante</th>
                <th scope="col">Ativo</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
            <% for (Fabricante fbt : listainteira){%>
            <tr>
                <th scope="row"><%=fbt.getId_fabricante()%></th>
                <td><%=fbt.getFabricante()%></td>
                <td><%=fbt.getAtivo_fabricante()%></td>
                <td>
                    <button class="acao btn" data-toggle="modal" data-target="#modalCA" onclick='adicionaDados(<%=new Gson().toJson(fbt)%>)'><img
                            src="img/editar.png" width="15px" height="15px" ></button>
                    <button class="acao btn" onclick="location.href='backpages/produtos/model.jsp?acao=apagar&id=<%=fbt.getId_fabricante()%>'"><img src="img/apagar.png"
                                                                                                                                         width="15px" height="15px"></button>
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
            <li class="page-item"><a class="page-link" href="backpages/fabricantes/model.jsp?acao=visualizar&ordem=<%=x%>&pesquisa=<%=pesquisa%>&searching-option=<%=ativo%>"><%=x + 1%>
            </a></li>
            <%}%>
            <li class="page-item <%=pag.get("tem_url_proximo")%>">
                <a class="page-link" href="<%=pag.get("url_proximo")%>">Próximo</a>
            </li>
        </ul>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titulo-modalcategoria">Cadastro de categoria:</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Nome da Categoria</label>
                        <input type="text" class="form-control" placeholder="Ex: Tablet">
                    </div>

                    <div class="form-group">
                        <label>Slug da Categoria</label>
                        <input type="text" class="form-control" placeholder="Ex: telefones">
                    </div>

                    <div class="form-group">
                        <label>Ativo</label>
                        <select class="form-control">
                            <option>Sim</option>
                            <option>Não</option>
                        </select>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn acao">Salvar</button>
            </div>
        </div>
    </div>
</div>

