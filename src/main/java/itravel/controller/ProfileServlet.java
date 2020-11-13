package itravel.controller;

import itravel.dao.DbUtil;
import itravel.model.Profile;
import itravel.model.Student;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private DbUtil myDbUtil;

    @Resource(name="jdbc/travelDb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();
        // create out student db util ... and pass in the conn pool / datasource
        try {
            //myDbUtil = new DbUtil(dataSource);
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
        String userid = request.getParameter("id");
        try {
            // get whatever from db util
            List<Profile> profiles = getProfiles(userid);

            // add students to the request
            request.setAttribute("profiles", profiles);

            // send to JSP page (view)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");
            dispatcher.forward(request, response);

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    // example
    public static List<Profile> getProfiles(String id) throws Exception {
        List<Profile> profiles = new ArrayList<>();

        Connection myConn = null;
        Statement info = null;
        ResultSet myRs = null;

        Statement info2 = null;
        ResultSet rsImgs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "SELECT user.id, CONCAT(person.fname, ' ', person.lname) AS name, user.biography, person.job, person.cityBirth FROM person INNER JOIN user ON person.id=user.Person_id WHERE user.id="+id;
            String getImgs = "SELECT image.link, user_image.sizeimg FROM image INNER JOIN user_image ON image.id=user_image.Image_id WHERE user_image.User_id="+id;
            info = myConn.createStatement();
            info2 = myConn.createStatement();

            // execute query
            myRs = info.executeQuery(sql);
            rsImgs = info2.executeQuery(getImgs);

            // process resultset
            while(myRs.next()) {
                Profile profile = new Profile();
                // retrieve data from result set row
                profile.setUserId(String.valueOf(myRs.getInt("id")));
                profile.setFullName(myRs.getString("name"));
                profile.setBiography(myRs.getString("biography"));
                profile.setJob(myRs.getString("job"));
                profile.setCityBirth(myRs.getString("cityBirth"));
                while(rsImgs.next()){
                    if(rsImgs.getString("sizeimg").equals("S"))      profile.setProfPicSmall(rsImgs.getString("link"));
                    else if(rsImgs.getString("sizeimg").equals("M")) profile.setProfPicMedium(rsImgs.getString("link"));
                    else if(rsImgs.getString("sizeimg").equals("L")) profile.setProfPicLarge(rsImgs.getString("link"));
                }
                profiles.add(profile);
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
        return profiles;
    }
}
