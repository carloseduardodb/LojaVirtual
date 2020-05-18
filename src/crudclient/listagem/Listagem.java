package crudclient.listagem;

import connection.ConnectionDatabase;
import crudadmin.categorias.Categoria;
import crudadmin.fabricante.Fabricante;
import crudadmin.subcategorias.Subcategoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Listagem {
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

    public List<DestaqueCategoria> readprodutodesccat(){
        String sql = "SELECT p.id_produto, p.imagem, c.categoria FROM produto AS p JOIN categoria AS c " +
                "ON p.id_categoria = c.id_categoria GROUP BY c.categoria ORDER BY p.id_produto desc;";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<DestaqueCategoria> listdestacacategoria = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                DestaqueCategoria destaqueCategoria = new DestaqueCategoria(
                        rs.getInt("id_produto"),
                        rs.getString("imagem"),
                        rs.getString("categoria"));
                listdestacacategoria.add(destaqueCategoria);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }
        return listdestacacategoria;
    }


    public List<DadosProdutosList> readdadosprodutoslist(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<DadosProdutosList> listdadosprodutoslist = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                DadosProdutosList dadosProdutosList = new DadosProdutosList(
                        rs.getInt("id_produto"),
                        rs.getString("imagem"),
                        rs.getString("produto"),
                        rs.getString("preco_alto"),
                        rs.getString("preco"),
                        rs.getString("categoria"),
                        rs.getString("fabricante"));
                listdadosprodutoslist.add(dadosProdutosList);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }
        return listdadosprodutoslist;
    }

    public List<DadosProdutosList> readdadosprodutoslistcat(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<DadosProdutosList> listdadosprodutoslistcat = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                DadosProdutosList dadosProdutosListcat = new DadosProdutosList(
                        rs.getInt("id_produto"),
                        rs.getString("produto"),
                        rs.getString("preco_alto"),
                        rs.getString("preco"),
                        rs.getString("categoria"),
                        rs.getString("fabricante"),
                        rs.getString("imagem"),
                        rs.getString("subcategoria"));
                listdadosprodutoslistcat.add(dadosProdutosListcat);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }
        return listdadosprodutoslistcat;
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
