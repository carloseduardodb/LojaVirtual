package crudclient.carrinho;

public class Carrinho {
    private int id_carrinho, id_pedido, id_produto, quantidade;
    private Double valor;
    private String produto, imagem;
    private Double preco;

    public Carrinho(int id_produto, String produto, String imagem, Double preco, int quantidade) {
        this.id_produto = id_produto;
        this.quantidade = quantidade;
        this.produto = produto;
        this.preco = preco;
        this.imagem = imagem;
    }

    public Carrinho(int id_carrinho, int id_pedido, int id_produto, int quantidade, Double valor) {
        this.id_carrinho = id_carrinho;
        this.id_pedido = id_pedido;
        this.id_produto = id_produto;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public Carrinho(int id_pedido, int id_produto, int quantidade, Double valor) {
        this.id_pedido = id_pedido;
        this.id_produto = id_produto;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public int getId_carrinho() {
        return id_carrinho;
    }

    public void setId_carrinho(int id_carrinho) {
        this.id_carrinho = id_carrinho;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }
}
