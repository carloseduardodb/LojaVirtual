package crudclient.pedido;

import java.sql.Date;

public class Pedido {
    private int id_pedido, id_cliente, qtd;
    private Date data_pedido;

    public Pedido(int id_pedido, int id_cliente, int qtd, Date data_pedido) {
        this.id_pedido = id_pedido;
        this.id_cliente = id_cliente;
        this.qtd = qtd;
        this.data_pedido = data_pedido;
    }

    public Pedido(int id_cliente, int qtd, Date data_pedido) {
        this.id_cliente = id_cliente;
        this.qtd = qtd;
        this.data_pedido = data_pedido;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public Date getData_pedido() {
        return data_pedido;
    }

    public void setData_pedido(Date data_pedido) {
        this.data_pedido = data_pedido;
    }
}
