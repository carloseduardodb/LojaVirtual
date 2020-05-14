<%@ page import="crudadmin.categorias.Categoria" %>
<%@ page import="crudadmin.subcategorias.Subcategoria" %>
<%@ page import="crudadmin.fabricante.Fabricante" %>
<%
    String produto = "", precoalto = "", preco = "",
            descricao = "", detalhes = "", ativoproduto = "",
            imagem = "", destaque = "", requisicao = "../Cadastro", botao = "Cadastrar";
    int categoria = -1, subcategoria = -1, fabricante = -1, id_produto = -1;

    List<Categoria> listcategoria = (List<Categoria>) session.getAttribute("dadoscat");
    List<Subcategoria> listsubcategoria = (List<Subcategoria>) session.getAttribute("dadossub");
    List<Fabricante> listfabricante = (List<Fabricante>) session.getAttribute("dadosfab");

    if (session.getAttribute("dadosprodutoeditado") != null) {
        List<Produto> ltpd = (List<Produto>) session.getAttribute("dadosprodutoeditado");
        id_produto = ltpd.get(0).getId_produto();
        produto = ltpd.get(0).getProduto();
        precoalto = ""+ltpd.get(0).getPreco_alto();
        preco = ""+ltpd.get(0).getPreco();
        descricao = ltpd.get(0).getDescricao();
        detalhes = ltpd.get(0).getDetalhes();
        ativoproduto = ltpd.get(0).getAtivo_produto();
        imagem = ltpd.get(0).getImagem();
        destaque = ltpd.get(0).getDestaque();
        categoria = ltpd.get(0).getId_categoria();
        subcategoria = ltpd.get(0).getId_subcategoria();
        fabricante = ltpd.get(0).getId_fabricante();
        requisicao = "../Atualizacao";
        botao = "Atualizar";
        session.removeAttribute("dadosprodutoeditado");
    }
%>

<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container pagina-inicio">
    <div class="titulo">
        <h2>Área administrativa - Cadastro de Produtos</h2>
        <br/>
        <hr/>
    </div>
    <form class="col-lg-9 col-xs-12" action="<%=requisicao%>" method="post" enctype="multipart/form-data" style="margin: 0 auto;">

        <input type="text" hidden name="id-produto" value="<%=id_produto%>">
        <input type="text" hidden name="acao" value="cadastrar">
        <div class="form-row">
            <div class="col-md mb-3">
                <label>Categoria:</label>
                <select name="id-categoria" class="form-control">
                    <% for(Categoria cat : listcategoria) {%>
                    <option <% if(cat.getId() == categoria){ %> selected <%}%> value="<%=cat.getId()%>"><%=cat.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md mb-3">
                <label>Subcategoria:</label>
                <select name="id-subcategoria" class="form-control">
                    <% for(Subcategoria sub : listsubcategoria) {%>
                    <option <% if(sub.getId() == subcategoria){ %> selected <%}%> value="<%=sub.getId()%>"><%=sub.getNome()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-md mb-3">
                <label>Fabricante:</label>
                <select name="id-fabricante" class="form-control">
                    <% for(Fabricante fb : listfabricante) {%>
                    <option <% if(fb.getId_fabricante() == fabricante){ %> selected <%}%> value="<%=fb.getId_fabricante()%>"><%=fb.getFabricante()%></option>
                    <%}%>
                </select>
            </div>

            <div class="col-ml mb-1">
                <label>Ativo:</label>
                <select name="ativo-produto" class="form-control">
                    <option <% if("S".equals(ativoproduto)){ %> selected <%}%> value="S">Sim</option>
                    <option <% if("N".equals(ativoproduto)){ %> selected <%}%>  value="N">Não</option>
                </select>
            </div>

            <div class="col-ml mb-1">
                <label>Destaque:</label>
                <select name="destaque" class="form-control">
                    <option <% if("S".equals(destaque)){ %> selected <%}%> value="S">Sim</option>
                    <option <% if("N".equals(destaque)){ %> selected <%}%> value="N">Não</option>
                </select>
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col-md mb-3">
                <label>Nome do Produto:</label>
                <input name="produto-nome" type="text" value="<%=produto%>" class="form-control" placeholder="Nome">
            </div>

            <div class="col-md">
                <label>Envie uma Foto:</label>
                <input type="hidden" id="tipoForm" name="tipoForm" value="imagem">
                <input name="imagem" type="file" accept="image/jpeg; image/gif; image/bmp; image/png" id="imagem" class="dados" maxlength="60" tabindex="1" value="<%=imagem%>">
            </div>
        </div>

        <br/>

        <div class="form-row">
            <div class="col mb-3">
                <label>Preço Anterior:</label>
                <input name="precoalto" type="number" value="<%=precoalto%>" class="form-control" placeholder="R$ 0,00">
            </div>

            <div class="col mb-3">
                <label>Preço Atual:</label>
                <input name="preco" type="number" value="<%=preco%>" class="form-control" placeholder="R$ 0,00">
            </div>
        </div>

        <br/>

        <input value="<%=descricao%>" hidden id="ocldescricao">
        <div class="form-group">
            <label>Descrição:</label>
            <textarea name="descricao" class="form-control" id="descricao" rows="10" cols="80">
        </textarea>
        </div>

        <br/>
        <input value="<%=detalhes%>" hidden id="ocldetalhes">
        <div class="form-group">
            <label>Detalhes:</label>
            <textarea class="form-control" name="detalhes" id="detalhes" rows="10" cols="80">
        </textarea>
        </div>
        <div class="col text-center">
            <button type="submit" id="btn-cadastrar" class="btn"><%=botao%></button>
        </div>
    </form>
</div>

<script>
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.config.height = 100;

    var descricao = CKEDITOR.replace('descricao');
    var detalhes = CKEDITOR.replace('detalhes');

    var ocldescricao = document.getElementById("ocldescricao");
    var ocldetalhes = document.getElementById("ocldetalhes");

    descricao.setData(ocldescricao.getAttribute("value"));
    detalhes.setData(ocldetalhes.getAttribute("value"));

</script>