package crudclient.item;

import connection.ConnectionDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public Boolean create(Item i) {
        boolean cadastrou;

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "itens (id_venda, id_produto, valor_item, qtde_item, subtotal) " +
                    "VALUES (?,?,?,?,?)");
            stmt.setInt(1, i.getId_venda());
            stmt.setInt(2, i.getId_produto());
            stmt.setDouble(3, i.getValor_item());
            stmt.setInt(4, i.getQtde_item());
            stmt.setDouble(5, i.getSubtotal());
            stmt.executeUpdate();
            cadastrou = true;
        } catch (SQLException throwables) {
            System.out.println("Erro ao salvar os dados no banco. " +
                    "/n Detalhes: "+ throwables);
            cadastrou = false;
        }finally {
            ConnectionDatabase.closeConnection(con,stmt);
        }
        return cadastrou;
    }

    public List<Item> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Item> listitens = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Item itens = new Item(rs.getInt("id_itens"),
                        rs.getInt("id_venda"),
                        rs.getInt("id_produto"),
                        rs.getInt("qtde_item"),
                        rs.getDouble("valor_item"),
                        rs.getDouble("subtotal"));
                listitens.add(itens);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }
        return listitens;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM itens WHERE id_itens = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Item i){

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE itens SET id_venda = ?, " +
                    "id_produto = ?, valor_item = ?, qtde_item = ?, subtotal = ? " +
                    "WHERE id_itens = ?;");
            stmt.setInt(1, i.getId_venda());
            stmt.setInt(2, i.getId_produto());
            stmt.setDouble(3, i.getValor_item());
            stmt.setInt(4, i.getQtde_item());
            stmt.setDouble(4, i.getSubtotal());
            stmt.setInt(5, i.getId_itens());

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
