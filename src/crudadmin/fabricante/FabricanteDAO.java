package crudadmin.fabricante;

import connection.ConnectionDatabase;
import crudadmin.produtos.Produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FabricanteDAO {
    public Boolean create(Fabricante fb) {
        boolean cadastrou;

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(fb.getAtivo_fabricante().equals("Sim")){
            ativo = "S";
        }

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO fabricante(fabricante, " +
                    "ativo_fabricante) VALUES " +
                    "(?,?)");
            stmt.setString(1, fb.getFabricante());
            stmt.setString(2, ativo);

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

    public List<Fabricante> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Fabricante> listfabricante = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Fabricante fabricante = new Fabricante(
                        rs.getInt("id_fabricante"),
                        rs.getString("fabricante"),
                        rs.getString("ativo_fabricante"));
                listfabricante.add(fabricante);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listfabricante;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM fabricante WHERE id_fabricante = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Fabricante fb){

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(fb.getAtivo_fabricante().equals("Sim")){
            ativo = "S";
        }

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {

            stmt = con.prepareStatement("UPDATE fabricante SET fabricante = ?, " +
                    "ativo_fabricante = ? WHERE id_fabricante = ?;");

            stmt.setString(1, fb.getFabricante());
            stmt.setString(2, ativo);
            stmt.setInt(3, fb.getId_fabricante());

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
