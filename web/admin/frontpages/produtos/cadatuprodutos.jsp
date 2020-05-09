<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%
    List<Categoria> listcategoria = (List<Categoria>) session.getAttribute("dadoscat");
    List<Subcategoria> listsubcategoria = (List<Subcategoria>) session.getAttribute("dadossub");
    List<Fabricante> listfabricante = (List<Fabricante>) session.getAttribute("dadosfab");

    String id_produto = "";
    String id_categoria = "";
    String id_subcategoria = "";
    String id_fabricante = "";

    if (session.getAttribute("mapproduto") != null) {
        Map<String, String> produto = (Map<String, String>) session.getAttribute("mapproduto");
        id_produto = produto.get("id-produto");
        id_categoria = produto.get("id-categoria");
        id_subcategoria = produto.get("id-subcategoria");
        id_fabricante = produto.get("id-fabricante");
    }
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container pagina-inicio">
    <div class="titulo">
        <h2>Área administrativa - Cadastro de Produtos</h2>
        <br/>
        <hr/>
    </div>
    <form class="col-lg-9 col-xs-12" style="margin: 0 auto;">

        <input type="text" hidden name="id-produto" value="<%=id_produto%>">
        <input type="text" hidden name="id-categoria" value="<%=id_categoria%>">
        <input type="text" hidden name="id-subcategoria" value="<%=id_fabricante%>">
        <input type="text" hidden name="id-fabricante" value="<%=id_subcategoria%>">

        <div class="form-row">
            <div class="col-md">
                <label>Categoria:</label>
                <select name="categoria" class="form-control">
                    <% for(Categoria cat : listcategoria) {%>
                    <option value="<%=cat.getId()%>"><%=cat.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md">
                <label>Subcategoria:</label>
                <select name="subcategoria" class="form-control">
                    <% for(Subcategoria sub : listsubcategoria) {%>
                    <option value="<%=sub.getId()%>"><%=sub.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md">
                <label>Fabricante:</label>
                <select name="fabricante" class="form-control">
                    <% for(Fabricante fb : listfabricante) {%>
                    <option value="<%=fb.getId_fabricante()%>"><%=fb.getFabricante()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-ml">
                <label>Ativo:</label>
                <select name="Ativo" class="form-control">
                    <option>Sim</option>
                    <option>Não</option>
                </select>
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col-md">
                <label>Nome do Produto:</label>
                <input name="nome-produto" type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col" style="margin-top: 20px">
                <label>Carregar Imagem:</label>
                <input type="file" class="custom-file-input" id="customFile">
                <label class="custom-file-label" for="customFile">Escolher arquivo</label>
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col-md">
                <label>Nome da Imagem:</label>
                <input name="nome-imagem" type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col">
                <label>Preço Anterior:</label>
                <input name="preco-alto" type="number" class="form-control" placeholder="R$ 0,00">
            </div>

            <div class="col">
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