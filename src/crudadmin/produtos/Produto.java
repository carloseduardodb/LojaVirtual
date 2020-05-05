package crudadmin.produtos;

public class Produto {

    private int id_produto;
    private int id_categoria;
    private int id_subcategoria;
    private int id_fabricante;
    private String produto;
    private float preco_alto;
    private float preco;
    private String descricao;
    private String detalhes;
    private String ativo_produto;
    private String imagem;
    private String destaque;

    public Produto(int id_produto, int id_categoria, int id_subcategoria,
                   int id_fabricante, String produto, float preco_alto, float preco,
                   String descricao, String detalhes, String ativo_produto, String imagem,
                   String destaque) {

        this.id_produto = id_produto;
        this.id_categoria = id_categoria;
        this.id_subcategoria = id_subcategoria;
        this.id_fabricante = id_fabricante;
        this.produto = produto;
        this.preco_alto = preco_alto;
        this.preco = preco;
        this.descricao = descricao;
        this.detalhes = detalhes;
        this.ativo_produto = ativo_produto;
        this.imagem = imagem;
        this.destaque = destaque;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public int getId_subcategoria() {
        return id_subcategoria;
    }

    public void setId_subcategoria(int id_subcategoria) {
        this.id_subcategoria = id_subcategoria;
    }

    public int getId_fabricante() {
        return id_fabricante;
    }

    public void setId_fabricante(int id_fabricante) {
        this.id_fabricante = id_fabricante;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public float getPreco_alto() {
        return preco_alto;
    }

    public void setPreco_alto(float preco_alto) {
        this.preco_alto = preco_alto;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDetalhes() {
        return detalhes;
    }

    public void setDetalhes(String detalhes) {
        this.detalhes = detalhes;
    }

    public String getAtivo_produto() {
        return ativo_produto;
    }

    public void setAtivo_produto(String ativo_produto) {
        this.ativo_produto = ativo_produto;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getDestaque() {
        return destaque;
    }

    public void setDestaque(String destaque) {
        this.destaque = destaque;
    }
}
