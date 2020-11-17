package itravel.dao;

import itravel.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

    public User findUser(String password){
        Connection myConn = DbUtil.connectDb();
        User usr =new User();
        Boolean isDeactivated = true;
        String Query = "select email,password ,isDeactivated from user;";
        try{
            PreparedStatement ps = myConn.prepareStatement(Query);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                usr.setEmail(rs.getString("email"));
                usr.setPassword(rs.getString("password"));
                isDeactivated = rs.getBoolean("isDeactivated");
                System.out.println("isDeactivated"+ isDeactivated);

                return  usr;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }
}
