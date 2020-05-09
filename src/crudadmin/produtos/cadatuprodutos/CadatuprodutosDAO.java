package crudadmin.produtos.cadatuprodutos;

import connection.ConnectionDatabase;
import crudadmin.produtos.Produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CadatuprodutosDAO {

    public List<Cadatuproduto> read(){
        String sql = "SELECT categoria.id_categoria, " +
                "categoria, subcategoria.id_subcategoria, " +
                "subcategoria, fabricante.id_fabricante, " +
                "fabricante FROM produto INNER JOIN categoria ON " +
                "produto.id_categoria = categoria.id_categoria INNER JOIN " +
                "subcategoria ON produto.id_subcategoria = " +
                "subcategoria.id_subcategoria INNER JOIN fabricante ON " +
                "produto.id_fabricante = fabricante.id_fabricante;";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Cadatuproduto> dependencias = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Cadatuproduto dados = new Cadatuproduto(
                        rs.getInt("id_categoria"),
                        rs.getString("categoria"),
                        rs.getInt("id_subcategoria"),
                        rs.getString("subcategoria"),
                        rs.getInt("id_fabricante"),
                        rs.getString("fabricante"));
                dependencias.add(dados);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return dependencias;
    }

}
