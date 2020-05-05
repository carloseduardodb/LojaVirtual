<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container pagina-inicio">
    <div class="titulo">
        <h2>Área administrativa - Cadastro de Produtos</h2>
        <br />
        <hr />
    </div>
    <form class="col-lg-9 col-xs-12" style="margin: 0 auto;">

        <div class="form-row">
            <div class="col-md">
                <label>Categoria:</label>
                <select class="form-control">
                    <option>Listar Categorias</option>
                </select>
            </div>

            <div class="col-md">
                <label>Subcategoria:</label>
                <select class="form-control">
                    <option>Listar Subcategorias</option>
                </select>
            </div>

            <div class="col-md">
                <label>Fabricante:</label>
                <select class="form-control">
                    <option>Listar Fabricante</option>
                </select>
            </div>

            <div class="col-ml">
                <label>Ativo:</label>
                <select class="form-control">
                    <option>Sim</option>
                    <option>Não</option>
                </select>
            </div>
        </div>

        <br />

        <div class="form-row">
            <div class="col-md">
                <label>Nome do Produto:</label>
                <input type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col" style="margin-top: 20px">
                <label >Carregar Imagem:</label>
                <input type="file" class="custom-file-input" id="customFile">
                <label class="custom-file-label" for="customFile">Escolher arquivo</label>
            </div>
        </div>

        <br />

        <div class="form-row">
            <div class="col-md">
                <label>Nome da Imagem:</label>
                <input type="text" class="form-control" placeholder="Nome">
            </div>

            <div class="col">
                <label>Preço Anterior:</label>
                <input type="number" class="form-control" placeholder="R$ 0,00">
            </div>

            <div class="col">
                <label>Preço Atual:</label>
                <input type="number" class="form-control" placeholder="R$ 0,00">
            </div>
        </div>

        <br />

        <div class="form-group">
            <label for="formGroupExampleInput">Descrição:</label>
            <textarea class="form-control" name="editor1" id="editor1" rows="10" cols="80">
        </textarea>
        </div>

        <br />

        <div class="form-group">
            <label for="formGroupExampleInput">Detalhes:</label>
            <textarea class="form-control" name="editor1" id="editor2" rows="10" cols="80">
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