package crudclient.painelcliente.compras;

import connection.ConnectionDatabase;
import crudclient.carrinho.Carrinho;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComprasDAO {
    public List<Compras> readcompras(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Compras> listbuy = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Compras compras = new Compras(rs.getInt("id_venda"),
                        rs.getDate("data_venda"),
                        rs.getString("pago"),
                        rs.getString("cod_rastreio"));
                listbuy.add(compras);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listbuy;
    }

    public List<Compras> readprodutos(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Compras> listbuy = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Compras compras = new Compras(rs.getString("produto"),
                        rs.getDouble("valor_item"),
                        rs.getInt("qtde_item"));
                listbuy.add(compras);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listbuy;
    }

}
