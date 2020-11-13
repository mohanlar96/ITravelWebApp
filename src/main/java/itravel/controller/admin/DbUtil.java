package itravel.controller.admin;

import javax.sql.DataSource;
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

    public static List<BanWord> getBanWords(int selectedPageN) throws Exception {
        List<BanWord> theBanWords = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = connectDb();

            int selectOffset = (selectedPageN-1)*10;
            // create sql statement
            String sql = "select * from FilterWords limit 10 offset "+selectOffset;
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process resultset
            while(myRs.next()) {
                // retrieve data from result set row
                String id = myRs.getString("id");
                String theWord = myRs.getString("theWord");


                // create new student object
                BanWord theBanWord = new BanWord(id, theWord);

                // add it to the list of students
                theBanWords.add(theBanWord);
            }
            return theBanWords;
        }
        finally {
            // close JDBC objects
            close(myConn, myStmt, myRs);
        }

    }

    public static int getCntBanWords() throws Exception {
        int rowCnt = 0;
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = connectDb();

            // create sql statement
            String sql = "select count(*) from FilterWords";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);
            // process resultset
            while(myRs.next()) {
                // retrieve data from result set row
                rowCnt = myRs.getInt(1);
            }
            return rowCnt;
        }
        finally {
            // close JDBC objects
            close(myConn, myStmt, myRs);
        }

    }

    public static void updateWord(BanWord theWord) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = connectDb();

            // create SQL update statement
            String sql = "update FilterWords "
                    + "set theWord=?"
                    + "where id=?";

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setString(1, theWord.getTheWord());
            myStmt.setString(2, theWord.getId());

            // execute SQL statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public static void addWord(BanWord theNewWord) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = connectDb();

            // create sql for insert
            String sql = "insert into FilterWords "
                    + "(theWord) "
                    + "values (?)";

            myStmt = myConn.prepareStatement(sql);

            // set the param values for the student
            myStmt.setString(1, theNewWord.getTheWord());

            // execute sql insert
            myStmt.execute();
            System.out.println("success");

        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public static void deleteWord(String theWordId) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // convert student id to int
            int studentId = Integer.parseInt(theWordId);

            // get connection to database
            myConn = connectDb();

            // create sql to delete student
            String sql = "delete from FilterWords where id=?";

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setString(1, theWordId);

            // execute sql statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC code
            close(myConn, myStmt, null);
        }
    }



    private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
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
