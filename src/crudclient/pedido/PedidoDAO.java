package crudclient.pedido;
import connection.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    public Boolean create(Pedido p) {
        boolean cadastrou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "pedido (id_cliente, qtd, data_pedido) " +
                    "VALUES (?,?,?)");
            stmt.setInt(1, p.getId_cliente());
            stmt.setInt(2, p.getQtd());
            stmt.setDate(3, p.getData_pedido());
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

    public List<Pedido> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Pedido> listpedido = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Pedido pedido = new Pedido(rs.getInt("id_pedido"),
                        rs.getInt("id_cliente"),
                        rs.getInt("qtd"),
                        rs.getDate("data_pedido"));
                listpedido.add(pedido);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listpedido;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM pedido WHERE id_pedido = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Pedido p){

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE pedido SET id_cliente = ?, " +
                    "qtd = ?, data_pedido = ? WHERE id_pedido = ?;");
            stmt.setInt(1, p.getId_cliente());
            stmt.setInt(2, p.getQtd());
            stmt.setDate(3, p.getData_pedido());
            stmt.setInt(4, p.getId_pedido());

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
