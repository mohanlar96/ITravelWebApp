package itravel.controller.user;

import itravel.dao.DbUtil;
import itravel.model.Address;
import itravel.model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(value = "/editprofile")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("id");
        try {
            String filepath = "aaaaaaaaa";
            if(userid != null && userid.length()>0 && userid.chars().mapToObj(c -> (char) c).allMatch(Character::isDigit)){
                // get whatever from db util
                Profile profile = getProfile(userid);

                // add students to the request
                request.setAttribute("prof", profile);
                System.out.println("Id is: " + profile.getUserId());
                if (profile.getUserId() != null) filepath = "/edit_profile.jsp";
            }
            // send to JSP page (view)
            RequestDispatcher dispatcher = request.getRequestDispatcher(filepath);
            dispatcher.forward(request, response);

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    public static Profile getProfile(String id) throws Exception {
        Profile profile = new Profile();

        Connection myConn = null;
        Statement info = null;
        ResultSet myRs = null;

        Statement info2 = null;
        ResultSet rsImgs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "SELECT * FROM profileNoPics WHERE id="+id;
            String getImgs = "SELECT image.link, user_image.sizeimg FROM image INNER JOIN user_image ON image.id=user_image.Image_id WHERE user_image.User_id="+id;
            info = myConn.createStatement();
            info2 = myConn.createStatement();

            // execute query
            myRs = info.executeQuery(sql);
            rsImgs = info2.executeQuery(getImgs);

            // process resultset
            while(myRs.next()) {
                // retrieve data from result set row
                profile.setUserId(String.valueOf(myRs.getInt("id")));
                profile.setEmail(myRs.getString("email"));
                //profile.setPassword(myRs.getString("password"));
                profile.setUsername(myRs.getString("username"));
                profile.setBiography(myRs.getString("biography"));

                profile.setFirstName(myRs.getString("fname"));
                profile.setMidName(myRs.getString("mname"));
                profile.setLastName(myRs.getString("lname"));
                profile.setGender(myRs.getString("gender"));
                profile.setDateBirth(myRs.getString("dateBirth"));
                profile.setCityBirth(myRs.getString("cityBirth"));
                profile.setJob(myRs.getString("job"));

                profile.setAddress(new Address());
                profile.getAddress().setStreet1(myRs.getString("street1"));
                profile.getAddress().setStreet2(myRs.getString("street2"));
                profile.getAddress().setZipCode(myRs.getString("zip"));
                profile.getAddress().setCity(myRs.getString("city"));
                profile.getAddress().setState(myRs.getString("state"));

                while(rsImgs.next()){
                    switch (rsImgs.getString("sizeimg")) {
                        case "S":
                            profile.setProfPicSmall(rsImgs.getString("link"));
                            break;
                        case "M":
                            profile.setProfPicMedium(rsImgs.getString("link"));
                            break;
                        case "L":
                            profile.setProfPicLarge(rsImgs.getString("link"));
                            break;
                        case "B":
                            profile.setBanner(rsImgs.getString("link"));
                            break;
                    }
                }
            }
        }
        finally {
            try{
                if (rsImgs!=null)     rsImgs.close();
                if (info2!=null)     info2.close();
            } catch(Exception exc){ exc.printStackTrace(); }

            // close JDBC objects
            DbUtil.close(myConn, info, myRs);
        }
        return profile;
    }
}