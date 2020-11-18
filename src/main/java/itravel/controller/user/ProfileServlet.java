package itravel.controller.user;

import itravel.dao.DbUtil;
import itravel.dao.HomeDao;
import itravel.model.*;

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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static itravel.dao.HomeDao.postItems;

@WebServlet(value = "/profile")
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
        Object userId = request.getSession().getAttribute("userId");
        Integer currentLoginUserID = (int)userId;
        String sessionid = String.valueOf(currentLoginUserID) ;//CHANGE FOR SESSION ID
        String userid = request.getParameter("id");
        List<Post> posts = new ArrayList<>();
        HomeAvator avator = new HomeAvator(0, "", "", "");
        List<String> placeVisited = new ArrayList<>();
        try {
            String filepath = "aaaaaaaaa";
            if(sessionid!=null && userid.length()>0 && userid.chars().mapToObj(c -> (char) c).allMatch(Character::isDigit)){
                // get whatever from db util
                Profile profile = getProfile(userid);

                // add students to the request
                request.setAttribute("prof", profile);
               // System.out.println("Id is: " + profile.getUserId());
                if (profile.getUserId() != null) filepath = "profile.jsp";

                posts = getProfilePosts(Integer.parseInt(userid),1); //10 posts // hershw ...
                avator= HomeDao.getAvator(currentLoginUserID);
                placeVisited=HomeDao.getVisitedPlace(Integer.parseInt(userid));
                List<Notification> notifications=null;
                notifications=HomeDao.getNotifications(currentLoginUserID);
                request.setAttribute("notifications",notifications );

                request.setAttribute("avator",avator );
                request.setAttribute("posts", posts);
                request.setAttribute("places",placeVisited);
            }
            // send to JSP page (view)
            RequestDispatcher dispatcher = request.getRequestDispatcher(filepath);
            dispatcher.forward(request, response);

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    // example
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
    public  static  List<Post> getProfilePosts(int UserId ,int page) throws Exception {
        String offset=(page>1)?" offset "+(page-1)*10:"";
        String sql = "" +
                "SELECT post.*, person.fname, person.lname, image.link " +
                "FROM post INNER JOIN user ON post.User_id=user.id " +
                "INNER JOIN person ON user.Person_id=person.id " +
                "INNER JOIN user_image ON user.id=user_image.User_id " +
                "INNER JOIN image ON user_image.Image_id=image.id " +
                "WHERE user_image.sizeimg='M' AND user.id="+UserId+"  order by post.datetime limit "+page*10+offset;
        return postItems(sql);
    }
}