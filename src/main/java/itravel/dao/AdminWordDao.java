package itravel.dao;

import itravel.model.BanWord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminWordDao {
    public static List<BanWord> getBanWords(int selectedPageN) throws Exception {
        List<BanWord> theBanWords = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            int selectOffset = (selectedPageN-1)*10;
            // create sql statement
            String sql = "select * from filterwords limit 10 offset "+selectOffset;
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
            DbUtil.close(myConn, myStmt, myRs);
        }

    }

    public static int getCntBanWords() throws Exception {
        int rowCnt = 0;
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "select count(*) from filterwords";
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
            DbUtil.close(myConn, myStmt, myRs);
        }

    }

    public static void updateWord(BanWord theWord) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = DbUtil.connectDb();

            // create SQL update statement
            String sql = "update filterwords "
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
            DbUtil.close(myConn, myStmt, null);
        }
    }

    public static void addWord(BanWord theNewWord) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = DbUtil.connectDb();

            // create sql for insert
            String sql = "insert into filterwords "
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
            DbUtil.close(myConn, myStmt, null);
        }
    }

    public static void deleteWord(String theWordId) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // convert student id to int
            int studentId = Integer.parseInt(theWordId);

            // get connection to database
            myConn = DbUtil.connectDb();

            // create sql to delete student
            String sql = "delete from filterwords where id=?";

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setString(1, theWordId);

            // execute sql statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC code
            DbUtil.close(myConn, myStmt, null);
        }
    }
}
