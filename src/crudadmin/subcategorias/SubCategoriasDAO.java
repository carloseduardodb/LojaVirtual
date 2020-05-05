package crudadmin.subcategorias;
import connection.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubCategoriasDAO {

    public Boolean create(Subcategoria sc) {
        boolean cadastrou;

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(sc.getAtivo().equals("Sim")){
            ativo = "S";
        }

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "subcategoria (id_categoria, subcategoria, ativo_subcategoria) " +
                    "VALUES (?,?,?)");
            stmt.setString(1, sc.getId_categoria());
            stmt.setString(2, sc.getNome());
            stmt.setString(3, ativo);
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

    public List<Subcategoria> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Subcategoria> listsubcat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Subcategoria subcategoria = new Subcategoria(rs.getInt("id_subcategoria"),
                        rs.getString("subcategoria"),
                        rs.getString("ativo_subcategoria"),
                        rs.getString("id_categoria"),
                        rs.getString("categoria"));
                listsubcat.add(subcategoria);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listsubcat;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM subcategoria WHERE id_subcategoria = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Subcategoria sc){

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(sc.getAtivo().equals("Sim")){
            ativo = "S";
        }

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE subcategoria SET id_categoria = ?, " +
                    "subcategoria = ?, ativo_subcategoria = ? WHERE id_subcategoria = ?;");
            stmt.setInt(1, Integer.parseInt(sc.getId_categoria()));
            stmt.setString(2, sc.getNome());
            stmt.setString(3, ativo);
            stmt.setInt(4, sc.getId());

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
