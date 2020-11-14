package itravel.dao;
import itravel.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/itraveldb?useSSL=false&useTimezone=true&serverTimezone=UTC";
    private static final String USERNAME = "fullstackuser";
    private static final String PASSWORD = "fullstackuser";

    public static Connection connectDb(){
        Connection connObj = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connObj = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        } catch (Exception exObj) {
            exObj.printStackTrace();
        }
        return connObj;
    }


    public static void close(Connection myConn, Statement myStmt, ResultSet myRs) {

        try {
            if (myRs!=null)     myRs.close();

            if (myStmt != null) myStmt.close();

            if (myConn != null) myConn.close(); // doesn't really close it .. just put back in the connection pool

        } catch(Exception exc) {
            exc.printStackTrace();
        }
    }
}
