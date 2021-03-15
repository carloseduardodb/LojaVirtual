package connection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionDatabase {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/loja?autoReconnect=true&useSSL=false&" +
            "useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            throw new RuntimeException("Erro na conexão: ", ex);
        }
    }

    public static void closeConnection(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException se) {
            Logger.getLogger(ConnectionDatabase.class.getName()).log(Level.SEVERE, null, se);
        }
    }

    public static void closeConnection(Connection con, PreparedStatement stmt) {
        closeConnection(con);
        try {
            if(stmt != null){
                stmt.close();
            }
        } catch (SQLException se) {
            Logger.getLogger(ConnectionDatabase.class.getName()).log(Level.SEVERE, null, se);
        }
    }

    public static void closeConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
        closeConnection(con, stmt);
        try {
            if(rs != null){
                rs.close();
            }
        } catch (SQLException se) {
            Logger.getLogger(ConnectionDatabase.class.getName()).log(Level.SEVERE, null, se);
        }
    }
}
