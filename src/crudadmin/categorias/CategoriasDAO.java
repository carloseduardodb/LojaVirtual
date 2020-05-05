package crudadmin.categorias;

import connection.ConnectionDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriasDAO {

    public Boolean create(Categoria c) {
        Boolean cadastrou;

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(c.getAtivo().equals("Sim")){
            ativo = "S";
        }

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "categoria (categoria, ativo_categoria, slug_categoria, icone) " +
                    "VALUES (?,?,?,?)");
            stmt.setString(1, c.getNome());
            stmt.setString(2, ativo);
            stmt.setString(3, c.getSlug());
            stmt.setString(4, c.getIcone());
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

    public List<Categoria> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Categoria> listcat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Categoria categoria = new Categoria(rs.getInt("id_categoria"),
                        rs.getString("categoria"),
                        rs.getString("slug_categoria"),
                        rs.getString("ativo_categoria"),
                        rs.getString("icone"));
                listcat.add(categoria);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listcat;
    }

    //necessario para listar as categorias disponiveis e cadastradas
    public List<Categoria> readnamecat(){
        String sql = "SELECT categoria, id_categoria FROM categoria;";
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Categoria> listnamecat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Categoria categoria = new Categoria(rs.getInt("id_categoria"), rs.getString("categoria"));
                listnamecat.add(categoria);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listnamecat;
    }

    public Boolean delete(Integer id){
        Boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM categoria WHERE id_categoria = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Categoria c){

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(c.getAtivo().equals("Sim")){
            ativo = "S";
        }

        Boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE categoria SET categoria = ?, " +
                    "ativo_categoria = ?, slug_categoria = ?, icone = ? WHERE id_categoria = ?;");
            stmt.setString(1, c.getNome());
            stmt.setString(2, ativo);
            stmt.setString(3, c.getSlug());
            stmt.setString(4, c.getIcone());
            stmt.setInt(5, c.getId());

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
