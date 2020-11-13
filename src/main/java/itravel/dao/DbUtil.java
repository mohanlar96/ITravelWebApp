package itravel.dao;
import itravel.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbUtil {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/iTravelDb?useSSL=false&useTimezone=true&serverTimezone=UTC";
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

    // example
    public static List<Student> getStudents() throws Exception {
        List<Student> students = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = connectDb();

            // create sql statement
            String sql = "select * from student order by last_name";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process resultset
            while(myRs.next()) {
                // retrieve data from result set row
                int id = myRs.getInt("id");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                String email = myRs.getString("email");

                // create new student object
                Student tempStudent = new Student(id, firstName, lastName, email);

                // add it to the list of students
                students.add(tempStudent);
            }
            return students;
        }
        finally {
            // close JDBC objects
            close(myConn, myStmt, myRs);
        }

    }

    static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
        try {
            if (myRs!=null) {
                myRs.close();
            }

            if (myStmt != null) {
                myStmt.close();
            }

            if (myConn != null) {
                myConn.close(); // doesn't really close it .. just put back in the connection pool
            }
        } catch(Exception exc) {
            exc.printStackTrace();
        }

    }
}
