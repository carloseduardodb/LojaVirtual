package crudadmin.vendas;

public class VendaProdutos {
    private String produto;
    private Double valor_item;
    private int qtde_item;

    public VendaProdutos(String produto, Double valor_item, int qtde_item) {
        this.produto = produto;
        this.valor_item = valor_item;
        this.qtde_item = qtde_item;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public Double getValor_item() {
        return valor_item;
    }

    public void setValor_item(Double valor_item) {
        this.valor_item = valor_item;
    }

    public int getQtde_item() {
        return qtde_item;
    }

    public void setQtde_item(int qtde_item) {
        this.qtde_item = qtde_item;
    }
}
