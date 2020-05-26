package crudlogin;

import connection.ConnectionDatabase;
import crudclient.cliente.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginRead {
    public List<Login> read(String email, String senha){
        String sql = "SELECT * FROM administrador WHERE email = '"+email+"' AND senha = '"+senha+"';";

        Connection con = ConnectionDatabase.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Login> listlogin = new ArrayList<>();

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){
                Login login = new Login(
                        rs.getString("email"),
                        rs.getString("senha")
                );
                listlogin.add(login);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            ConnectionDatabase.closeConnection(con, stmt, rs);
        }

        return listlogin;
    }
}
