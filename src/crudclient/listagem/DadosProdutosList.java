package crudclient.listagem;

public class DadosProdutosList {
    int id_produto;
    String nome, preco_alto, preco, categoria, fabricante, imagem, subcategoria;

    public DadosProdutosList(int id_produto, String imagem,
                             String nome, String preco_alto,
                             String preco, String categoria, String fabricante) {
        this.id_produto = id_produto;
        this.nome = nome;
        this.preco_alto = preco_alto;
        this.preco = preco;
        this.categoria = categoria;
        this.fabricante = fabricante;
        this.imagem = imagem;
    }

    public DadosProdutosList(int id_produto, String nome, String
            preco_alto, String preco, String categoria, String fabricante,
                             String imagem, String subcategoria) {
        this.id_produto = id_produto;
        this.nome = nome;
        this.preco_alto = preco_alto;
        this.preco = preco;
        this.categoria = categoria;
        this.fabricante = fabricante;
        this.imagem = imagem;
        this.subcategoria = subcategoria;
    }

    public int getId_produto() {
        return id_produto;
    }

    public String getSubcategoria() {
        return subcategoria;
    }

    public String getImagem() {
        return imagem;
    }

    public String getNome() {
        return nome;
    }

    public String getPreco_alto() {
        return preco_alto;
    }

    public String getPreco() {
        return preco;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getFabricante() {
        return fabricante;
    }
}
