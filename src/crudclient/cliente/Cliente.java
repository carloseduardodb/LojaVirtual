package crudclient.cliente;

public class Cliente {
    private int id_cliente;

    private String tipo, empresa, contato, cnpj,
            incest, cliente, cpf, rg, endereco, numero,
            complemento, bairro, cidade, uf, cep,
            ddd, fone1, fone2, sexo, email, senha,
            data_cadastro, ativo_cliente;

    public Cliente(int id_cliente, String tipo, String empresa,
                   String contato, String cnpj, String incest,
                   String cliente, String cpf, String rg,
                   String endereco, String numero, String complemento,
                   String bairro, String cidade, String uf, String cep,
                   String ddd, String fone1, String fone2, String sexo,
                   String email, String senha, String data_cadastro,
                   String ativo_cliente) {
        this.id_cliente = id_cliente;
        this.tipo = tipo;
        this.empresa = empresa;
        this.contato = contato;
        this.cnpj = cnpj;
        this.incest = incest;
        this.cliente = cliente;
        this.cpf = cpf;
        this.rg = rg;
        this.endereco = endereco;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
        this.cep = cep;
        this.ddd = ddd;
        this.fone1 = fone1;
        this.fone2 = fone2;
        this.sexo = sexo;
        this.email = email;
        this.senha = senha;
        this.data_cadastro = data_cadastro;
        this.ativo_cliente = ativo_cliente;
    }

    public Cliente(String tipo, String empresa, String contato,
                   String cnpj, String incest, String cliente,
                   String cpf, String rg, String endereco,
                   String numero, String complemento, String bairro,
                   String cidade, String uf, String cep, String ddd,
                   String fone1, String fone2, String sexo, String email,
                   String senha, String data_cadastro, String ativo_cliente) {
        this.tipo = tipo;
        this.empresa = empresa;
        this.contato = contato;
        this.cnpj = cnpj;
        this.incest = incest;
        this.cliente = cliente;
        this.cpf = cpf;
        this.rg = rg;
        this.endereco = endereco;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
        this.cep = cep;
        this.ddd = ddd;
        this.fone1 = fone1;
        this.fone2 = fone2;
        this.sexo = sexo;
        this.email = email;
        this.senha = senha;
        this.data_cadastro = data_cadastro;
        this.ativo_cliente = ativo_cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getContato() {
        return contato;
    }

    public void setContato(String contato) {
        this.contato = contato;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getIncest() {
        return incest;
    }

    public void setIncest(String incest) {
        this.incest = incest;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getFone1() {
        return fone1;
    }

    public void setFone1(String fone1) {
        this.fone1 = fone1;
    }

    public String getFone2() {
        return fone2;
    }

    public void setFone2(String fone2) {
        this.fone2 = fone2;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(String data_cadastro) {
        this.data_cadastro = data_cadastro;
    }

    public String getAtivo_cliente() {
        return ativo_cliente;
    }

    public void setAtivo_cliente(String ativo_cliente) {
        this.ativo_cliente = ativo_cliente;
    }
}
