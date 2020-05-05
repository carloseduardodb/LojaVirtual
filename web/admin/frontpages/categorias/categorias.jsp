<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<Categoria> listainteira = (List<Categoria>) session.getAttribute("listacategoria");
    Map<String, String> pag = (Map<String, String>) session.getAttribute("indices");
    int paginasmostradas = Integer.parseInt(pag.get("paginas_mostradas"));
    String pesquisa = pag.get("pesquisa");
    String ativo = pag.get("searching-option");
%>

<div class="container pagina-inicio" align="center">
    <h2>Área administrativa - Categorias</h2>
    <hr/>
    <form method="get" action="backpages/categorias/model.jsp" class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option" name="searching-option">
            <option>Categoria</option>
            <option>Ativo</option>
            <option>Inativo</option>
        </select>
        <input type="text" class="form-control" name="pesquisa" placeholder="Pesquisar">
        <input type="text" hidden="hidden" name="acao" value="visualizar">
        <span class="input-group-btn">
        <button style="background-color: #6C63FF" class="btn btn-default" type="submit"><img src="img/searching.png" width="21px"></button>
      </span>
        <a class="btn btn-cadastrar" onclick="apagarDados()" style="color: #fff" data-toggle="modal" data-target="#modalCA">Cadastrar</a>
    </form>

    <div class="tabela col-8">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Ativo</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
            <% for (Categoria c : listainteira) {%>
            <tr>
                <th scope="row"><%=c.getId()%>
                </th>
                <td><%=c.getNome()%>
                </td>
                <td><%=c.getAtivo()%>
                </td>
                <td>
                    <button class="acao btn" data-toggle="modal" data-target="#modalCA" onclick='adicionaDados(<%=new Gson().toJson(c)%>)'><img
                            src="img/editar.png" width="15px" height="15px" ></button>
                    <button class="acao btn" onclick="location.href='backpages/categorias/model.jsp?acao=apagar&id=<%=c.getId()%>'"><img src="img/apagar.png"
                                                                                                                 width="15px" height="15px"></button>
                </td>
            </tr>
            <%
                }%>
            </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item <%=pag.get("tem_url_voltar")%>">
                <a class="page-link" href="<%=pag.get("url_voltar")%>" tabindex="-1">Anterior</a>
            </li>
            <% for (int x = 0; x <= paginasmostradas; x++) { %>
            <li class="page-item"><a class="page-link" href="backpages/categorias/model.jsp?acao=visualizar&ordem=<%=x%>&pesquisa=<%=pesquisa%>&searching-option=<%=ativo%>"><%=x + 1%>
            </a></li>
            <%}%>
            <li class="page-item <%=pag.get("tem_url_proximo")%>">
                <a class="page-link" href="<%=pag.get("url_proximo")%>">Próximo</a>
            </li>
        </ul>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalCA" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titulo-modalcategoria">Cadastro de categoria:</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="get" id="form-categoria" action="backpages/categorias/model.jsp">
                    <div class="form-group">
                        <label>Nome da Categoria</label>
                        <input hidden="true" id="acao" name="acao" type="text" value="cadastrar">
                        <input hidden="true" id="identificacao" name="id" type="text" value="">
                        <input class="form-control" name="nome" id="nome" placeholder="Ex: Tablet" type="text">
                    </div>

                    <div class="form-group">
                        <label>Slug da Categoria</label>
                        <input type="text" name="slug" id="slug" class="form-control" placeholder="Ex: telefones">
                    </div>

                    <div class="form-group">
                        <label>Ativo</label>
                        <select class="form-control" name="ativo" id="ativo">
                            <option>Sim</option>
                            <option>Não</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn acao">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    var identificacao = document.getElementById("identificacao");
    var acao = document.getElementById("acao");
    var inome = document.getElementById("nome");
    var islug = document.getElementById("slug");
    var iativo = document.getElementById("ativo");
    var titulomodal = document.getElementById("titulo-modalcategoria");

    function adicionaDados(dado) {

        let id = dado.id,
            nome = dado.nome,
            slug = dado.slug,
            ativo = dado.ativo;

        identificacao.setAttribute("value", id);
        acao.setAttribute("value", "atualizar");
        inome.setAttribute("value", nome);
        islug.setAttribute("value", slug);
        iativo.setAttribute("value", ativo);
        titulomodal.innerHTML = "Editar categoria:"
    }

    function apagarDados() {

        acao.setAttribute("value", "cadastrar");
        inome.setAttribute("value", "");
        islug.setAttribute("value", "");
        iativo.setAttribute("value", "");
        titulomodal.innerHTML = "Cadastro de categoria:";
    }

    function sair(){
        document.write('');
    }
</script>