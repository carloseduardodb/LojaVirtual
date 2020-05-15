package crudadmin.slideshow;
import connection.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SlideshowDAO {

    public Boolean create(Slideshow s) {
        Boolean cadastrou;

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "slideshow (id_slideshow, titulo, imagem, url, ativo) " +
                    "VALUES (?,?,?,?)");
            stmt.setInt(1, s.getId_slideshow());
            stmt.setString(2, s.getTitulo());
            stmt.setString(3, s.getImagem());
            stmt.setString(4, s.getUrl());
            stmt.setString(4, s.getAtivo());
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

    public List<Slideshow> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Slideshow> slidcat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Slideshow slideshow = new Slideshow(rs.getInt("id_categoria"),
                        rs.getString("titulo"),
                        rs.getString("imagem"),
                        rs.getString("url"),
                        rs.getString("ativo"));
                slidcat.add(slideshow);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }
        return slidcat;
    }

    public Boolean delete(Integer id){
        Boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM slideshow WHERE id_slideshow = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Slideshow s){

        Boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE slideshow SET titulo = ?, " +
                    "imagem = ?, url = ?, ativo = ? WHERE id_slideshow = ?;");
            stmt.setString(1, s.getTitulo());
            stmt.setString(2, s.getImagem());
            stmt.setString(3, s.getUrl());
            stmt.setString(4, s.getAtivo());
            stmt.setInt(5, s.getId_slideshow());

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
