<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 23/05/2020
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-9 direita">

    <form>

        <div class="row">
            <div class="col-md-6">
                <label>Nome</label>
                <input type="text" name="nome" class="form-control" placeholder="Nome">
                <br>
            </div>
            <div class="col-md-6">
                <label>Sobrenome</label>
                <input type="text" name="sobrenome" class="form-control" placeholder="Sobrenome">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>Email</label>
                <input type="text" name="email" class="form-control" placeholder="Email">
                <br>
            </div>
            <div class="col-md-6">
                <label>CPF</label>
                <input type="text" name="cpf" class="form-control" placeholder="CPF">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>Endereço</label>
                <input type="text" name="endereco" class="form-control" placeholder="Endereço">
                <br>
            </div>
            <div class="col-md-6">
                <label>Bairro</label>
                <input type="text" name="bairro" class="form-control" placeholder="Bairro">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>Número</label>
                <input type="text" name="numero" class="form-control" placeholder="Número">
                <br>
            </div>
            <div class="col-md-6">
                <label>Complemento</label>
                <input type="text" name="complemento" class="form-control" placeholder="Complemento">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>Cidade</label>
                <input type="text" name="cidade" class="form-control" placeholder="Cidade">
                <br>
            </div>
            <div class="col-md-6">
                <label>UF</label>
                <input type="text" name="uf" class="form-control" placeholder="UF">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label>CEP</label>
                <input type="text" name="cep" class="form-control" placeholder="CEP">
                <br>
            </div>
            <div class="col-md-6">
                <label>Telefone</label>
                <input type="text" name="telefone" class="form-control" placeholder="Telefone">
                <br>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-xs-6">
                <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalAlterasenha">Alterar Senha</button>
                <br>
            </div>
            <div class="col-md-6 col-xs-6" align="right">
                <button class="btn btn-success" type="submit">Salvar Alterações</button>
            </div>
        </div>
    </form>
</div>

<div class="modal fade" id="modalAlterasenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <label><h3><strong>Alterar Senha</strong></h3></label>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-6">
                        <label>Senha Anterior:</label>
                        <input type="password" name="senhaanterior" class="form-control" placeholder="******">
                        <br>
                    </div>
                    <div class="col-md-6">
                        <label>Nova Senha:</label>
                        <input type="password" name="senha" class="form-control" placeholder="*******">
                        <br>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-success">Salvar</button>
            </div>
        </div>
    </div>
</div>