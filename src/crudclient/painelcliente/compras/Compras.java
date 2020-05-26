package crudclient.painelcliente.compras;

import java.sql.Date;

public class Compras {
    private int id_venda;
    private Date data_venda;
    private String pago;
    private String cod_rastreio;

    private String produto;
    private Double valor_item;
    private int qtde_item;

    public Compras(String produto, Double valor_item, int qtde_item) {
        this.produto = produto;
        this.valor_item = valor_item;
        this.qtde_item = qtde_item;
    }

    //construtor parte 1
    public Compras(int id_venda, Date data_venda, String pago, String cod_rastreio) {
        this.data_venda = data_venda;
        this.pago = pago;
        this.cod_rastreio = cod_rastreio;
        this.id_venda = id_venda;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
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

    public Date getData_venda() {
        return data_venda;
    }

    public void setData_venda(Date data_venda) {
        this.data_venda = data_venda;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public String getCod_rastreio() {
        return cod_rastreio;
    }

    public void setCod_rastreio(String cod_rastreio) {
        this.cod_rastreio = cod_rastreio;
    }
}
