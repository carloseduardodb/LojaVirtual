package crudadmin.produtos.cadatuprodutos;

import connection.ConnectionDatabase;
import crudadmin.categorias.Categoria;
import crudadmin.fabricante.Fabricante;
import crudadmin.produtos.Produto;
import crudadmin.subcategorias.Subcategoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CadatuprodutosDAO {

    public List<Categoria> readcategoria(){
        String sql = "SELECT categoria, id_categoria FROM categoria;";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Categoria> dependenciascat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Categoria dados = new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("categoria"));
                dependenciascat.add(dados);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return dependenciascat;
    }

    public List<Subcategoria> readsubcategoria(){
        String sql = "SELECT subcategoria, id_subcategoria FROM subcategoria;";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Subcategoria> dependenciassubcat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Subcategoria dadossub = new Subcategoria(
                        rs.getInt("id_subcategoria"),
                        rs.getString("subcategoria"));
                dependenciassubcat.add(dadossub);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return dependenciassubcat;
    }

    public List<Fabricante> readfabricante(){
        String sql = "SELECT fabricante, id_fabricante FROM fabricante;";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Fabricante> dependenciasfab = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Fabricante dados = new Fabricante(
                        rs.getInt("id_fabricante"),
                        rs.getString("fabricante"));
                dependenciasfab.add(dados);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return dependenciasfab;
    }

}
