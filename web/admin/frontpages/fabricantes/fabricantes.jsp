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
    <form method="get" action="backpages/fabricantes/model.jsp" class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option" name="searching-option">
            <option>Fabricante</option>
            <option>Ativo</option>
            <option>Inativo</option>
        </select>
        <input type="text" class="form-control" name="pesquisa" placeholder="Pesquisar">
        <input type="text" hidden="hidden" name="acao" value="visualizar">
        <span class="input-group-btn">
        <button style="background-color: #6C63FF" class="btn btn-default" type="submit"><img src="img/searching.png" width="21px"></button>
      </span>
        <a class="btn btn-cadastrar" onclick="apagarDados()" style="color: #fff" data-toggle="modal" data-target="#modalFA">Cadastrar</a>
    </form>

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
                    <button class="acao btn" data-toggle="modal" data-target="#modalFA" onclick='adicionaDados(<%=new Gson().toJson(fbt)%>)'><img
                            src="img/editar.png" width="15px" height="15px" ></button>
                    <button class="acao btn" onclick="location.href='backpages/fabricantes/model.jsp?acao=apagar&id-fabricante=<%=fbt.getId_fabricante()%>'"><img src="img/apagar.png"
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
<!-- Modal -->
<div class="modal fade" id="modalFA" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titulo-modalcategoria">Cadastro de fabricante:</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="get" id="form-fabricante" action="backpages/fabricantes/model.jsp">
                    <div class="form-group">
                        <label>Nome do Fabricante:</label>
                        <input hidden="true" id="acao" name="acao" type="text" value="cadastrar">
                        <input hidden="true" id="identificacao" name="id-fabricante" type="text" value="">
                        <input class="form-control" name="fabricante" id="nome" placeholder="Ex: Tablet" type="text">
                    </div>

                    <div class="form-group">
                        <label>Ativo</label>
                        <select class="form-control" name="ativo-fabricante" id="ativo">
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
    var iativo = document.getElementById("ativo");
    var titulomodal = document.getElementById("titulo-modalcategoria");

    function adicionaDados(dado) {

        let id = dado.id_fabricante,
            nome = dado.fabricante,
            ativo = dado.ativo_fabricante;

        identificacao.setAttribute("value", id);
        acao.setAttribute("value", "atualizar");
        inome.setAttribute("value", nome);
        iativo.setAttribute("value", ativo);
        titulomodal.innerHTML = "Editar fabricante:"
    }

    function apagarDados() {

        acao.setAttribute("value", "cadastrar");
        inome.setAttribute("value", "");
        iativo.setAttribute("value", "");
        titulomodal.innerHTML = "Cadastro de fabricante:";
    }

    function sair(){
        document.write('');
    }
</script>

