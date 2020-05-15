package crudadmin.venda;
import connection.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VendaDAO {


    public Boolean create(Venda v) {
        Boolean cadastrou;

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "venda (id_venda, id_cliente, data_venda, pago, forma_pagamento) " +
                    "VALUES (?,?,?,?,?)");
            stmt.setInt(1, v.getId_venda());
            stmt.setInt(2, v.getId_cliente());
            stmt.setDate(3, v.getData_venda());
            stmt.setString(4, v.getPago());
            stmt.setString(5, v.getForma_pagamento());
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

    public List<Venda> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Venda> listvend = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Venda venda = new Venda(rs.getInt("id_venda"),
                        rs.getInt("id_cliente"),
                        rs.getDate("data_venda"),
                        rs.getString("pago"),
                        rs.getString("forma_pagamento"));
                listvend.add(venda);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listvend;
    }

    public Boolean delete(Integer id){
        Boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM venda WHERE id_venda = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Venda v){

        Boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE venda SET id_cliente = ?, " +
                    "data_venda = ?, pago = ?, forma_pagamento = ? WHERE id_venda = ?;");
            stmt.setInt(1, v.getId_cliente());
            stmt.setDate(2, v.getData_venda());
            stmt.setString(3, v.getPago());
            stmt.setString(4, v.getForma_pagamento());
            stmt.setInt(5, v.getId_venda());

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
