<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%
    List<Categoria> listcategoria = (List<Categoria>) session.getAttribute("dadoscat");
    List<Subcategoria> listsubcategoria = (List<Subcategoria>) session.getAttribute("dadossub");
    List<Fabricante> listfabricante = (List<Fabricante>) session.getAttribute("dadosfab");

    String id_produto = "";

    if (session.getAttribute("mapproduto") != null) {
        Map<String, String> produto = (Map<String, String>) session.getAttribute("mapproduto");
        id_produto = produto.get("id-produto");
    }
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container pagina-inicio">
    <div class="titulo">
        <h2>Área administrativa - Cadastro de Produtos</h2>
        <br/>
        <hr/>
    </div>
    <form class="col-lg-9 col-xs-12" action="../src/util/Servlet.java" method="post" enctype="multipart/form-data" style="margin: 0 auto;">

        <input type="text" hidden name="id-produto" value="<%=id_produto%>">
        <input type="text" hidden name="acao" value="cadastrar">
        <div class="form-row">
            <div class="col-md mb-3">
                <label>Categoria:</label>
                <select name="id-categoria" class="form-control">
                    <% for(Categoria cat : listcategoria) {%>
                    <option value="<%=cat.getId()%>"><%=cat.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md mb-3">
                <label>Subcategoria:</label>
                <select name="id-subcategoria" class="form-control">
                    <% for(Subcategoria sub : listsubcategoria) {%>
                    <option value="<%=sub.getId()%>"><%=sub.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md mb-3">
                <label>Fabricante:</label>
                <select name="id-fabricante" class="form-control">
                    <% for(Fabricante fb : listfabricante) {%>
                    <option value="<%=fb.getId_fabricante()%>"><%=fb.getFabricante()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-ml mb-1">
                <label>Ativo:</label>
                <select name="ativo-produto" class="form-control">
                    <option value="S">Sim</option>
                    <option value="N">Não</option>
                </select>
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col-md mb-3">
                <label>Nome do Produto:</label>
                <input name="produto-nome" type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col-md">
                <label>Envie uma Foto:</label>
                <input type="file" name="imagem" size="50">
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col-md mb-3">
                <label>Nome da Imagem:</label>
                <input name="imagem-nome" type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col mb-3">
                <label>Preço Anterior:</label>
                <input name="precoalto" type="number" class="form-control" placeholder="R$ 0,00">
            </div>

            <div class="col mb-3">
                <label>Preço Atual:</label>
                <input name="preco" type="number" class="form-control" placeholder="R$ 0,00">
            </div>
        </div>

        <br/>

        <div class="form-group">
            <label>Descrição:</label>
            <textarea name="descricao" class="form-control" id="editor1" rows="10" cols="80">
        </textarea>
        </div>

        <br/>

        <div class="form-group">
            <label>Detalhes:</label>
            <textarea class="form-control" name="detalhes" id="editor2" rows="10" cols="80">
        </textarea>
        </div>
        <div class="col text-center">
            <button type="submit" id="btn-cadastrar" class="btn">Cadastrar</button>
        </div>
    </form>
</div>

<script>
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.config.height = 100;
    CKEDITOR.replace('editor1');
    CKEDITOR.replace('editor2');

</script>