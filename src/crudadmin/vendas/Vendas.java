package crudadmin.vendas;

public class Vendas {
    private int id_venda;
    private String cliente, pago, codigo_rastreio;

    public Vendas(int id_venda, String cliente, String pago, String codigo_rastreio) {
        this.id_venda = id_venda;
        this.cliente = cliente;
        this.pago = pago;
        this.codigo_rastreio = codigo_rastreio;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public String getCodigo_rastreio() {
        return codigo_rastreio;
    }

    public void setCodigo_rastreio(String codigo_rastreio) {
        this.codigo_rastreio = codigo_rastreio;
    }
}
