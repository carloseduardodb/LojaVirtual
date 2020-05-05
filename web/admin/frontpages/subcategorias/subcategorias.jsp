<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<Subcategoria> listainteira = (List<Subcategoria>) session.getAttribute("listasubcategoria");
    List<Categoria> listanomescategorias = (List<Categoria>) session.getAttribute("listanomescategorias");
    Map<String, String> pag = (Map<String, String>) session.getAttribute("subcatindices");
    int paginasmostradas = Integer.parseInt(pag.get("paginas_mostradas"));
    String pesquisa = pag.get("pesquisa");
    String ativo = pag.get("searching-option");
%>

<div class="container pagina-inicio" align="center">

    <h2>Área administrativa - Subcategoria</h2>
    <hr/>

    <form method="get" action="backpages/subcategorias/model.jsp" class="input-group col-8 pesquisar">
        <select class="form-control col-3" id="searching-option" name="searching-option">
            <option>Subcategoria</option>
            <option>Ativo</option>
            <option>Inativo</option>
        </select>
        <input type="text" class="form-control" name="pesquisa" placeholder="Pesquisar">
        <input type="text" hidden="hidden" name="acao" value="visualizar">
        <span class="input-group-btn">
        <button style="background-color: #6C63FF" class="btn btn-default" type="submit"><img src="img/searching.png"
                                                                                             width="21px"></button>
      </span>
        <a class="btn btn-cadastrar" onclick="apagarDados()" style="color: #fff" data-toggle="modal"
           data-target="#modalSUBCA">Cadastrar</a>
    </form>

    <div class="tabela col-8">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Subcategoria</th>
                <th scope="col">Categoria</th>
                <th scope="col">Ativo (S ou N)</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
            <% for (Subcategoria sc : listainteira) {%>
            <tr>
                <th scope="row"><%=sc.getId()%>
                </th>
                <td><%=sc.getNome()%>
                </td>
                <td><%=sc.getNome_categoria()%>
                </td>
                <td><%=sc.getAtivo()%>
                </td>
                <td>
                    <button class="acao btn" data-toggle="modal" data-target="#modalSUBCA"
                            onclick='adicionaDados(<%=new Gson().toJson(sc)%>)'><img
                            src="img/editar.png" width="15px" height="15px"></button>
                    <button class="acao btn"
                            onclick="location.href='backpages/subcategorias/model.jsp?acao=apagar&id=<%=sc.getId()%>'">
                        <img
                                src="img/apagar.png" width="15px" height="15px"></button>
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
            <% if (x < 2 || x > paginasmostradas - 2) {%>
            <li class="page-item"><a class="page-link"
                                     href="backpages/subcategorias/model.jsp?acao=visualizar&ordem=<%=x%>&pesquisa=<%=pesquisa%>&searching-option=<%=ativo%>"><%=x + 1%>
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

<!-- Modal -->
<div class="modal fade" id="modalSUBCA" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titulo-modalsubcategoria">Cadastro de subcategoria:</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="get" id="form-subcategoria" action="backpages/subcategorias/model.jsp">
                    <div class="form-group">
                        <label>Categoria</label>
                        <input hidden="true" id="acao" name="acao" type="text" value="cadastrar">
                        <input hidden="true" id="identificacao" name="id" type="text" value="">
                        <input hidden="true" id="identificacao-categoria" name="categoria" type="text" value="">
                        <select class="form-control select-categoria" id="categoria">
                            <option id="selectcategoria">Escolha uma Categoria</option>
                            <% for (Categoria c : listanomescategorias) { %>
                            <option value="<%=c.getId()%>"><%=c.getNome()%>
                            </option>
                            <%}%>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Título da Subcategoria</label>
                        <input name="nome" type="text" class="form-control" id="nome" placeholder="Ex: Samsung">
                    </div>

                    <div class="form-group">
                        <label>Ativo</label>
                        <select name="ativo" id="ativo" class="form-control">
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

    //identificação da subcategoria que estou editando
    var selectcategoria = document.getElementById("selectcategoria");
    var identificacao = document.getElementById("identificacao");
    var acao = document.getElementById("acao");
    var inome = document.getElementById("nome");
    var iativo = document.getElementById("ativo");
    var titulomodal = document.getElementById("titulo-modalsubcategoria");
    var identificacao_categoria = document.getElementById("identificacao-categoria");




    //funcao para adicionar os dados dentro dos inputs quando for editar
    function adicionaDados(dado) {

        let id = dado.id,
            nome = dado.nome,
            categoria = dado.nome_categoria,
            idcategoria = dado.id_categoria,
            ativo = dado.ativo;

        identificacao.setAttribute("value", id);
        acao.setAttribute("value", "atualizar");
        inome.setAttribute("value", nome);
        iativo.setAttribute("value", ativo);
        titulomodal.innerHTML = "Editar subcategoria:"
        selectcategoria.innerText = ""+categoria;
        selectcategoria.setAttribute("value", idcategoria);

        identificacao_categoria.setAttribute("value", idcategoria);
    }

    //funcao para apagar os dados quando o usuario for cadastrar
    function apagarDados() {

        acao.setAttribute("value", "cadastrar");
        inome.setAttribute("value", "");
        selectcategoria.innerHTML = "Escolha uma Categoria";
        iativo.setAttribute("value", "");
        titulomodal.innerHTML = "Cadastro de subcategoria:";

    }

    function sair(){

        document.write('');

    }

    $('.select-categoria').change(function(event){
        var id_categoria = event.currentTarget.value;
        identificacao_categoria.setAttribute("value", id_categoria);
    });

</script>
