package crudclient.cliente;

import connection.ConnectionDatabase;
import crudclient.carrinho.Carrinho;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    public Boolean create(Cliente c) {
        boolean cadastrou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO " +
                    "cliente (tipo, empresa, contato, cnpj, IncEst, " +
                    "cliente, cpf, RG, endereco, numero, complemento, " +
                    "bairro, cidade, uf, cep, ddd, fone1, fone2, sexo, " +
                    "email, senha, data_cadastro, ativo_cliente) " +
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            stmt.setString(1, c.getTipo());
            stmt.setString(2, c.getEmpresa());
            stmt.setString(3, c.getContato());
            stmt.setString(4, c.getCnpj());
            stmt.setString(5, c.getIncest());
            stmt.setString(6, c.getCliente());
            stmt.setString(7, c.getCpf());
            stmt.setString(8, c.getRg());
            stmt.setString(9, c.getEndereco());
            stmt.setString(10, c.getNumero());
            stmt.setString(11, c.getComplemento());
            stmt.setString(12, c.getBairro());
            stmt.setString(13, c.getCidade());
            stmt.setString(14, c.getUf());
            stmt.setString(15, c.getCep());
            stmt.setString(16, c.getDdd());
            stmt.setString(17, c.getFone1());
            stmt.setString(18, c.getFone2());
            stmt.setString(19, c.getSexo());
            stmt.setString(20, c.getEmail());
            stmt.setString(21, c.getSenha());
            stmt.setString(22, c.getData_cadastro());
            stmt.setString(23, c.getAtivo_cliente());

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

    public List<Cliente> read(String sql){

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Cliente> listclient = new ArrayList<>();

        try {
            System.out.println("**********************************"+sql);
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Cliente cliente = new Cliente(
                        rs.getInt("id_cliente"),
                        rs.getString("tipo"),
                        rs.getString("empresa"),
                        rs.getString("contato"),
                        rs.getString("cnpj"),
                        rs.getString("IncEst"),
                        rs.getString("cliente"),
                        rs.getString("cpf"),
                        rs.getString("RG"),
                        rs.getString("endereco"),
                        rs.getString("numero"),
                        rs.getString("complemento"),
                        rs.getString("bairro"),
                        rs.getString("cidade"),
                        rs.getString("uf"),
                        rs.getString("cep"),
                        rs.getString("ddd"),
                        rs.getString("fone1"),
                        rs.getString("fone2"),
                        rs.getString("sexo"),
                        rs.getString("email"),
                        rs.getString("senha"),
                        rs.getString("data_cadastro"),
                        rs.getString("ativo_cliente")
                        );
                listclient.add(cliente);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listclient;
    }

    public Boolean delete(Integer id){
        boolean apagou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try{
            stmt = con.prepareStatement("DELETE FROM cliente WHERE id_cliente = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
            apagou = true;
        }catch (SQLException ex){
            System.out.println("Erro ao apagar a query desejada!");
            apagou = false;
        }
        return apagou;
    }

    public Boolean update(Cliente c){

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE cliente SET tipo = ?, " +
                    "empresa = ?, contato = ?, cnpj = ?, IncEst = ?, " +
                    "cliente = ?, cpf = ?, RG = ?, endereco = ?, numero = ?, " +
                    "complemento = ?, bairro = ?, cidade = ?, uf = ?, cep = ?, " +
                    "ddd = ?, fone1 = ?, fone2 = ?, sexo = ?, email = ?, " +
                    "ativo_cliente = ?" +
                    " WHERE id_cliente = ?;");

            stmt.setString(1, c.getTipo());
            stmt.setString(2, c.getEmpresa());
            stmt.setString(3, c.getContato());
            stmt.setString(4, c.getCnpj());
            stmt.setString(5, c.getIncest());
            stmt.setString(6, c.getCliente());
            stmt.setString(7, c.getCpf());
            stmt.setString(8, c.getRg());
            stmt.setString(9, c.getEndereco());
            stmt.setString(10, c.getNumero());
            stmt.setString(11, c.getComplemento());
            stmt.setString(12, c.getBairro());
            stmt.setString(13, c.getCidade());
            stmt.setString(14, c.getUf());
            stmt.setString(15, c.getCep());
            stmt.setString(16, c.getDdd());
            stmt.setString(17, c.getFone1());
            stmt.setString(18, c.getFone2());
            stmt.setString(19, c.getSexo());
            stmt.setString(20, c.getEmail());
            stmt.setString(21, c.getAtivo_cliente());
            stmt.setInt(22, c.getId_cliente());

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

    public Boolean updatesenha(Cliente c){

        boolean atualizou;
        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE cliente SET senha = ?" +
                    " WHERE id_cliente = ?;");

            stmt.setString(1, c.getSenha());
            stmt.setInt(2, c.getId_cliente());

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
