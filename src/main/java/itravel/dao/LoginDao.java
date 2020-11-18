package itravel.dao;

import itravel.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {


    public static User findUser(String email) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;

        User usr = new User();
        int userId;
        String userEmail;
        String userPassword;
        int isDeactivated;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            // user should be activated, otherwise
            String sql = "select id, email, password, isDeactivated from user where email=?";

            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1,email);

            // execute query
            myRs = myStmt.executeQuery();
            // process result set
            if(myRs.next()) {
                // retrieve data from result set row
                userId = myRs.getInt(1);
                userEmail = myRs.getString(2);
                userPassword = myRs.getString(3);
                isDeactivated = myRs.getInt(4);
                usr.setId(userId);
                usr.setEmail(userEmail);
                usr.setPassword(userPassword);
                usr.setIsDeactivated(isDeactivated);
                return usr;
            } else {
                return null;
            }
        }
        finally {
            // close JDBC objects
            DbUtil.close(myConn, myStmt, myRs);
        }
    }

    public static void deactivateUser(int id) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = DbUtil.connectDb();
            // create SQL update statement
            String sql = "update user "
                    + "set isDeactivated=1 "
                    + "where id=?";

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setInt(1, id);

            // execute SQL statement
            myStmt.execute();

        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }
    }

}
