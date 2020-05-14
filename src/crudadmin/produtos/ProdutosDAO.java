package crudadmin.produtos;

import connection.ConnectionDatabase;
import crudadmin.subcategorias.Subcategoria;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdutosDAO {
    public Boolean create(Produto pd) {
        boolean cadastrou;

        //muda valor de boolean para sim ou nao
        String ativo = "N";
        if(pd.getAtivo_produto().equals("Sim")){
            ativo = "S";
        }

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO produto(id_categoria, " +
                    "id_subcategoria, id_fabricante, produto, preco_alto, preco, " +
                    "descricao, detalhes, ativo_produto, imagem, destaque) VALUES " +
                    "(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1, pd.getId_categoria());
            stmt.setInt(2, pd.getId_subcategoria());
            stmt.setInt(3, pd.getId_fabricante());
            stmt.setString(4, pd.getProduto());
            stmt.setFloat(5, pd.getPreco_alto());
            stmt.setFloat(6, pd.getPreco());
            stmt.setString(7, pd.getDescricao());
            stmt.setString(8, pd.getDetalhes());
            stmt.setString(9, ativo);
            stmt.setString(10, pd.getImagem());
            stmt.setString(11, pd.getDestaque());

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

    public List<Produto> read(String sql){
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Produto> listproduto = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Produto produto = new Produto(
                        rs.getInt("id_produto"),
                        rs.getInt("id_categoria"),
                        rs.getInt("id_subcategoria"),
                        rs.getInt("id_fabricante"),
                        rs.getString("produto"),
                        rs.getFloat("preco_alto"),
                        rs.getFloat("preco"),
                        rs.getString("descricao"),
                        rs.getString("detalhes"),
                        rs.getString("ativo_produto"),
                        rs.getString("imagem"),
                        rs.getString("destaque"));
                listproduto.add(produto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listproduto;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM produto WHERE id_produto = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Produto pd){
        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {

            stmt = con.prepareStatement("UPDATE produto SET id_categoria = ?, " +
                    "id_subcategoria = ?, id_fabricante = ?, produto = ?, preco_alto = ?, " +
                    "preco = ?, descricao = ?, detalhes = ?, ativo_produto = ?, imagem = ?, " +
                    "destaque = ? WHERE id_produto = ?;");

            stmt.setInt(1, pd.getId_categoria());
            stmt.setInt(2, pd.getId_subcategoria());
            stmt.setInt(3, pd.getId_fabricante());
            stmt.setString(4, pd.getProduto());
            stmt.setFloat(5, pd.getPreco_alto());
            stmt.setFloat(6, pd.getPreco());
            stmt.setString(7, pd.getDescricao());
            stmt.setString(8, pd.getDetalhes());
            stmt.setString(9, pd.getAtivo_produto());
            stmt.setString(10, pd.getImagem());
            stmt.setString(11, pd.getDestaque());
            stmt.setInt(12, pd.getId_produto());

            stmt.executeUpdate();
            atualizou = true;

        } catch (SQLException throwables) {
            atualizou = false;
            throwables.printStackTrace();
        } finally {
            ConnectionDatabase.closeConnection(con, stmt);
        }
        System.out.println("*********************************************************************PASSOU"+ atualizou);
        return atualizou;
    }
}
