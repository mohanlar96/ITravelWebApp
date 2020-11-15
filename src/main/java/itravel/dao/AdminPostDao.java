package itravel.dao;

import itravel.model.Post;
import itravel.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminPostDao {

    // GET the count of users
    public static int getCntPosts() throws Exception {
        int rowCnt = 0;
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "select count(*) from post where unhealthy=1";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);
            // process result set
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

    public static void updatePosts(String[] ids) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = DbUtil.connectDb();

            for (String id : ids) {
                // create SQL update statement
                String sql = "update post "
                        + "set unhealthy=0 "
                        + "where id=?";

                // prepare statement
                myStmt = myConn.prepareStatement(sql);

                // set params
                myStmt.setInt(1, Integer.parseInt(id));

                // execute SQL statement
                myStmt.execute();
            }
        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }
    }

    public static List<Post> getUnhealthyPosts(int selectedPageN) throws Exception {
        List<Post> thePosts = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            int selectOffset = (selectedPageN-1)*10;
            // create sql statement
            String sql = "select a.fname, a.lname, b.email, b.id " +
                    "from person a INNER JOIN user b " +
                    "ON a.id = b.Person_id where b.isDeactivated = 1 " +
                    "limit 10 offset "+selectOffset;


            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process resultset
            while(myRs.next()) {
                // retrieve data from result set row
                int id = myRs.getInt("id");
                String fName = myRs.getString("fname");
                String lName = myRs.getString("lname");
                String email = myRs.getString("email");

                // create new user object
                Post thePost = new Post(id, fName, lName, email, 0);

                // add it to the list of students
                thePosts.add(thePost);
            }
            return thePosts;
        }
        finally {
            // close JDBC objects
            DbUtil.close(myConn, myStmt, myRs);
        }

    }
}
