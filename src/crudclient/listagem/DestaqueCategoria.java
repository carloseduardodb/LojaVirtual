package crudclient.listagem;

public class DestaqueCategoria {
    int id_produto;
    String imagem;
    String categoria;

    public DestaqueCategoria(int id_produto, String imagem, String categoria) {
        this.id_produto = id_produto;
        this.imagem = imagem;
        this.categoria = categoria;
    }

    public int getId_produto() {
        return id_produto;
    }

    public String getImagem() {
        return imagem;
    }

    public String getCategoria() {
        return categoria;
    }
}
