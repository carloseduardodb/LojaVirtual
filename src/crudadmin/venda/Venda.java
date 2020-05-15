package crudadmin.venda;

import java.sql.Date;

public class Venda {
    private int id_venda, id_cliente;
    private Date data_venda;
    private String pago, forma_pagamento;

    public Venda(int id_venda, int id_cliente, Date data_venda, String pago, String forma_pagamento) {
        this.id_venda = id_venda;
        this.id_cliente = id_cliente;
        this.data_venda = data_venda;
        this.pago = pago;
        this.forma_pagamento = forma_pagamento;
    }

    public Venda(int id_cliente, Date data_venda, String pago, String forma_pagamento) {
        this.id_cliente = id_cliente;
        this.data_venda = data_venda;
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
