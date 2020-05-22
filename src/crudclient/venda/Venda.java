package crudclient.venda;
import java.sql.Date;

public class Venda {
    int id_venda, id_cliente;
    Date data_venda;
    String cod_rastreio, pago, forma_pagamento;

    public Venda(int id_cliente, Date data_venda, String cod_rastreio, String pago, String forma_pagamento) {
        this.id_cliente = id_cliente;
        this.data_venda = data_venda;
        this.cod_rastreio = cod_rastreio;
        this.pago = pago;
        this.forma_pagamento = forma_pagamento;
    }

    public Venda(int id_venda, int id_cliente, Date data_venda, String cod_rastreio, String pago, String forma_pagamento) {
        this.id_venda = id_venda;
        this.id_cliente = id_cliente;
        this.data_venda = data_venda;
        this.cod_rastreio = cod_rastreio;
        this.pago = pago;
        this.forma_pagamento = forma_pagamento;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Date getData_venda() {
        return data_venda;
    }

    public void setData_venda(Date data_venda) {
        this.data_venda = data_venda;
    }

    public String getCod_rastreio() {
        return cod_rastreio;
    }

    public void setCod_rastreio(String cod_rastreio) {
        this.cod_rastreio = cod_rastreio;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public String getForma_pagamento() {
        return forma_pagamento;
    }

    public void setForma_pagamento(String forma_pagamento) {
        this.forma_pagamento = forma_pagamento;
    }
}
