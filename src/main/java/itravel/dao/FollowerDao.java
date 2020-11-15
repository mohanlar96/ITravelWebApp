package itravel.dao;

import itravel.model.Traveller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FollowerDao {

    public static List<Traveller> getTraveller(int currentUserID) throws Exception {
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        List<Traveller> allTraveller = new ArrayList<>();
        try {
            // String sql = "SELECT fname,lname FROM itraveldb.person where id<4;";
            String sql =
                    "SELECT user.id, image.link, person.fname, person.lname FROM image " +
                            "Inner JOIN user_image ON image.id=user_image.Image_id " +
                            "Inner JOIN user ON user_image.User_id=user.id " +
                            "Inner JOIN person ON user.Person_id=person.id " +
                            "WHERE  user.id!=" + currentUserID + " and user_image.sizeimg='S' order by person.fname asc";
            myConn = DbUtil.connectDb();
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            while (myRs.next()) {
                Traveller Traveller = new Traveller();
                int TravellerId = Integer.parseInt(myRs.getString("id"));
                Traveller.setUserID(TravellerId);
                Traveller.setPicturePath(myRs.getString("image.link"));
                Traveller.setFirstName(myRs.getString("person.fname"));
                Traveller.setLastName(myRs.getString("person.lname"));
                Traveller.setFollwing(isFollwing(currentUserID, TravellerId));
                allTraveller.add(Traveller);
            }
            return allTraveller;
        } finally {
            myConn.close();
        }
    }

    public static boolean isFollwing(int userID, int TravellerID) throws Exception {
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            String sql = "SELECT * from follower where follower.User_id=" + TravellerID + " and follower.Follower1_id=" + userID;
            myConn = DbUtil.connectDb();
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            if (myRs.next()) {
                return true;
            } else
                return false;
        } finally {
            myConn.close();
        }
    }

    public static String followUnfollow(int currentUserID, int travellerID, String status) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "";
        String resultString="";
        try {
            myConn = DbUtil.connectDb();
            if (status.trim().equals("Following")) {
                sql = "Delete from follower WHERE follower.User_id=" + travellerID + " and follower.Follower1_id=" + currentUserID;
                myStmt = myConn.prepareStatement(sql);
                myStmt.execute();
                resultString="Follow";
//                boolean result = myStmt.execute();
//                if (result) {
//                    resultString="Follow";
//                    System.out.println("hiii");
//                }
            }
            else if (status.trim().equals("Follow")) {
                sql = "Insert into follower(follower.User_id,follower.Follower1_id) values(" + travellerID + "," + currentUserID + ")";
                myStmt = myConn.prepareStatement(sql);
                myStmt.execute();
                resultString="Following";

            }
            return resultString;
        } finally {
            myConn.close();
        }
    }
}
