package crudadmin.vendas;

import connection.ConnectionDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VendasDAO {
    public List<Vendas> readvendas(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Vendas> listbuy = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Vendas vendas = new Vendas(rs.getInt("id_venda"),
                        rs.getString("cliente"),
                        rs.getString("pago"),
                        rs.getString("cod_rastreio"));
                listbuy.add(vendas);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listbuy;
    }

    public List<VendaProdutos> readprodutos(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<VendaProdutos> listprodutos = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                VendaProdutos vendaProdutos = new VendaProdutos(rs.getString("produto"),
                        rs.getDouble("valor_item"),
                        rs.getInt("qtde_item"));
                listprodutos.add(vendaProdutos);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listprodutos;
    }

    public Boolean updaterastreio(Integer idvenda, String codrastreio){

        Boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE venda SET cod_rastreio = ? " +
                    "WHERE id_venda = ?;");
            stmt.setString(1, codrastreio);
            stmt.setInt(2, idvenda);

            stmt.executeUpdate();
            atualizou = true;

        } catch (SQLException throwables) {
            atualizou = false;
            throwables.printStackTrace();
        } finally {
            ConnectionDatabase.closeConnection(con, stmt);
        }

        return atualizou;
    }
}
