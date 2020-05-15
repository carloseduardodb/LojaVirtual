package crudclient.carrinho;

import connection.ConnectionDatabase;
import crudadmin.categorias.Categoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarrinhoDAO {

    public Boolean create(Carrinho c) {
        Boolean cadastrou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "carrinho (id_carrinho, id_pedido, id_produto, valor, qtde) " +
                    "VALUES (?,?,?,?,?)");
            stmt.setInt(1, c.getId_carrinho());
            stmt.setInt(2, c.getId_pedido());
            stmt.setInt(3, c.getId_produto());
            stmt.setDouble(4, c.getValor());
            stmt.setInt(5, c.getQuantidade());
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

    public List<Carrinho> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Carrinho> listcar = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Carrinho carrinho = new Carrinho(rs.getInt("id_carrinho"),
                        rs.getInt("id_pedido"),
                        rs.getInt("id_produto"),
                        rs.getInt("qtde"),
                        rs.getDouble("valor"));
                listcar.add(carrinho);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listcar;
    }

    public Boolean delete(Integer id){
        Boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM carrinho WHERE id_carrinho = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Carrinho c){

        Boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE carrinho SET id_pedido = ?, " +
                    "id_produto = ?, valor = ?, qtde = ? WHERE id_carrinho = ?;");
            stmt.setInt(1, c.getId_pedido());
            stmt.setInt(2, c.getId_produto());
            stmt.setDouble(3, c.getValor());
            stmt.setInt(4, c.getQuantidade());
            stmt.setInt(5, c.getId_carrinho());

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
