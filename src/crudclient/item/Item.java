package crudclient.item;

public class Item {
    private int id_itens, id_venda, id_produto, qtde_item;
    private Double valor_item, subtotal;

    public Item(int id_itens, int id_venda, int id_produto, int qtde_item, Double valor_item, Double subtotal) {
        this.id_itens = id_itens;
        this.id_venda = id_venda;
        this.id_produto = id_produto;
        this.qtde_item = qtde_item;
        this.valor_item = valor_item;
        this.subtotal = subtotal;
    }

    public Item(int id_venda, int id_produto, int qtde_item, Double valor_item, Double subtotal) {
        this.id_venda = id_venda;
        this.id_produto = id_produto;
        this.qtde_item = qtde_item;
        this.valor_item = valor_item;
        this.subtotal = subtotal;
    }

    public int getId_itens() {
        return id_itens;
    }

    public void setId_itens(int id_itens) {
        this.id_itens = id_itens;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getQtde_item() {
        return qtde_item;
    }

    public void setQtde_item(int qtde_item) {
        this.qtde_item = qtde_item;
    }

    public Double getValor_item() {
        return valor_item;
    }

    public void setValor_item(Double valor_item) {
        this.valor_item = valor_item;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}
