package itravel.dao;

import itravel.model.PeopleFollow;
import itravel.model.Student;
import itravel.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class FollowerDao {

    public static List<PeopleFollow> getPeople(int userID) throws Exception {
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        List<PeopleFollow> allPeople = new ArrayList<>();
        try {
           // String sql = "SELECT fname,lname FROM itraveldb.person where id<4;";
            String sql =
                    "SELECT user.id, image.link, person.fname, person.lname FROM image " +
                    "Inner JOIN user_image ON image.id=user_image.Image_id " +
                    "Inner JOIN user ON user_image.User_id=user.id " +
                    "Inner JOIN person ON user.Person_id=person.id " +
                    "WHERE  user.id!="+userID+" and user_image.sizeimg='S' order by person.fname asc";
            myConn = DbUtil.connectDb();
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            while (myRs.next()) {
                PeopleFollow people = new PeopleFollow();
                int peopleId = Integer.parseInt(myRs.getString("id"));
                people.setUserID(peopleId);
                people.setPicturePath(myRs.getString("image.link"));
                people.setFirstName(myRs.getString("person.fname"));
                people.setLastName(myRs.getString("person.lname"));
                people.setFollwing(isFollwing(userID, peopleId));
                allPeople.add(people);
            }
            return allPeople;
        }
        finally {
            myConn.close();
        }
    }

    public static boolean isFollwing(int userID, int peopleID) throws Exception{
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            String sql = "SELECT * from follower where follower.User_id="+peopleID+" and follower.Follower1_id="+userID;
            myConn = DbUtil.connectDb();
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery(sql);
            if(myRs.next()){
                return true;
            }
            else
            return false;
        }
        finally {
            myConn.close();
        }
    }





}
