package itravel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class NewUserDao {
    // GET the count of users
    public static int checkEmailExists(String email) throws Exception {

        int rowCnt = 0;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "select count(*) from user where email=?";

            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1,email);

            // execute query
            myRs = myStmt.executeQuery();
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

    public static int getCityId(String city) throws Exception{
//        select id from city where name="Olympia";
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int cityId=0;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "select id from city where name=?";

            myStmt = myConn.prepareStatement(sql);

            myStmt.setString(1,city);

            // execute query
            myRs = myStmt.executeQuery();
            // process result set
            while(myRs.next()) {
                // retrieve data from result set row
                cityId = myRs.getInt(1);
            }
            return cityId;
        }
        finally {
            // close JDBC objects
            DbUtil.close(myConn, myStmt, myRs);
        }

    }

    public static int insertNewAddress(String street, int zipcode, int cityId) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        int addressId = 0;
        try {
            // get db connection
            myConn = DbUtil.connectDb();

            // create sql for insert
            String sql = "insert into address "
                    + "(street1,zip,City_id) "
                    + "values (?,?,?)";

            myStmt = myConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            // set the param values for the student
            myStmt.setString(1, street);
            myStmt.setInt(2, zipcode);
            myStmt.setInt(3, cityId);

            // execute sql insert
            myStmt.execute();

            ResultSet rs = myStmt.getGeneratedKeys();

            if (rs.next()) {
                addressId = rs.getInt(1);
            }
            return addressId;

        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }
    }

    public static int insertNewPerson(String firstName, String lastName, String gender, LocalDate dateOfBirth, int addressId) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;
        int personId = 0;
        try {
            // get db connection
            myConn = DbUtil.connectDb();

            // create sql for insert
            String sql = "insert into person "
                    + "(fname, lname, gender, dateBirth, Address_id) "
                    + "values (?,?,?,?,?)";

            myStmt = myConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            // set the param values for the student
            myStmt.setString(1, firstName);
            myStmt.setString(2, lastName);
            myStmt.setString(3, gender);
//            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//            Date myDate = formatter.parse(dateOfBirth.toString());
//            java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
            myStmt.setString(4, dateOfBirth.toString());
            myStmt.setInt(5, addressId);

            // execute sql insert
            myStmt.execute();

            ResultSet rs = myStmt.getGeneratedKeys();

            if (rs.next()) {
                personId = rs.getInt(1);
            }
            return personId;

        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }

    }

    public static int insertNewUser(String email, String password, int personId) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        int userId = 0;
        try {
            // get db connection
            myConn = DbUtil.connectDb();

            // create sql for insert
            String sql = "insert into user "
                    + "(email,password,isDeactivated,Person_Id) "
                    + "values (?,?,?,?)";

            myStmt = myConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            // set the param values for the student
            myStmt.setString(1, email);
            myStmt.setString(2, password);
            myStmt.setInt(3, 0);
            myStmt.setInt(4, personId);

            // execute sql insert
            myStmt.execute();

            ResultSet rs = myStmt.getGeneratedKeys();

            if (rs.next()) {
                userId = rs.getInt(1);
            }
            return userId;

        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }
    }

    // default image for user
    // Large, Medium, Small pictures
    // Banner and Large profile
    private static Map<Integer, String> createMap() {
        Map<Integer,String> myMap = new HashMap<Integer,String>();
        myMap.put(45, "B");
        myMap.put(46, "V");
        myMap.put(47, "L");
        myMap.put(48, "M");
        myMap.put(49, "S");
        return myMap;
    }
    public static void setDefaultImages(int userId) throws Exception{
        Connection myConn = null;
        PreparedStatement myStmt = null;
        // map with initialized literals
        Map<Integer, String> userImagesMap = createMap();

        try {
            // get db connection
            myConn = DbUtil.connectDb();

            for (Map.Entry<Integer,String> entry : userImagesMap.entrySet()) {
                // create sql for insert
                String sql = "insert into user_image "
                        + "(User_id, Image_id, sizeimg) "
                        + "values (?,?,?)";

                myStmt = myConn.prepareStatement(sql);

                // set the param values for the student
                myStmt.setInt(1, userId);
                myStmt.setInt(2, entry.getKey());
                myStmt.setString(3, entry.getValue());

                // execute sql insert
                myStmt.execute();
            }
        }
        finally {
            // clean up JDBC objects
            DbUtil.close(myConn, myStmt, null);
        }
    }
}
