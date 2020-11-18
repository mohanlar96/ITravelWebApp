package itravel.controller.ajaxRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import itravel.dao.DbUtil;

import java.io.File;
import java.sql.Date;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import itravel.dao.HomeDao;
import itravel.model.BanWord;
import itravel.model.HomeAvator;
import itravel.model.Post;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(value = "/post/interact")
@MultipartConfig
public class PostActionController extends HttpServlet {
    Connection con = null;
    PreparedStatement state = null;
    ResultSet row = null;
    Statement statement = null;

    @Override
    public void init() throws ServletException {
        super.init();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            switch (request.getParameter("functionRequest")) {
                case "LIKE":
                    toggleLike(request, response);
                    break;
                case "COMMENT":
                    commentPost(request, response);
                    break;
                case "UPDATE":
                    updatePost(request, response);
                    break;
                case "DELETE":
                    deletePost(request, response);
                    break;
                case "DELETE_COMMENT":
                    deleteComment(request, response);
                    break;
                case "SCROLL":
                    scrollDown(request, response);
                    break;
                case "SEARCH":
                    searchPost(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private void toggleLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con = DbUtil.connectDb();
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        Integer postID = Integer.parseInt(request.getParameter("postID"));
        boolean isLiked = Boolean.valueOf(request.getParameter("isLiked"));

        response.getWriter().println("Server=>" + userID + " " + postID + " " + isLiked);

        try {
            if (isLiked) { //if no false .. mea
                String sql = "delete  from post_reaction WHERE Actor_id=" + userID + " AND Post_id=" + postID;
                // prepare statement
                state = con.prepareStatement(sql);
                state.executeUpdate();
                response.getWriter().println("Successfully disLike!");
            } else {
                String sql = "insert  into post_reaction VALUES(?,1,?)";
                // prepare statement
                state = con.prepareStatement(sql);
                // set params
                state.setInt(1, postID);
                state.setInt(2, userID);
                // execute SQL statement
                state.execute();
                DbUtil.close(con, state, null);
                response.getWriter().println("Successfully Like!");

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

        con = DbUtil.connectDb();
        Integer commentID = Integer.parseInt(request.getParameter("commentID"));

        response.getWriter().println("Server=> commentID" + commentID);

        try {
            String sql = "delete from comment where id= ? ";
            // prepare statement
            state = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setInt(1, commentID);
            state.executeUpdate();

            DbUtil.close(con, state, null);
            response.getWriter().println("Successfully deleted the comment !");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    private void commentPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con = DbUtil.connectDb();

        String comment = request.getParameter("comment");
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        Integer postID = Integer.parseInt(request.getParameter("postID"));

//        response.getWriter().println("Server=>"+userID +" "+postID+" "+comment);

        try {
            String sql = "insert  into comment(description,Post_id,Actor_id) VALUES( ? , ? , ? )";

            // prepare statement
            state = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setString(1, comment);
            state.setInt(2, postID);
            state.setInt(3, userID);

            int id = 0; //this is auto generate comment id
            state.executeUpdate();
            row = state.getGeneratedKeys();
            while (row.next()) {
                id = row.getInt(1);
            }
            DbUtil.close(con, state, row);
            response.getWriter().println(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public static int isUnhealthy(String description) {
        List<String> theBanWords = new ArrayList<>();
        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // create sql statement
            String sql = "select * from filterwords";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);
            // process resultset
            while (myRs.next()) {
                // retrieve data from result set row
                String theWord = myRs.getString("theWord");

                // add it to the list of students
                theBanWords.add(theWord);
            }
            for (String str : description.split(" ")) {
                if (theBanWords.contains(str)) {
                    return 1; //if some unhealthy things
                }
            }

            return 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con = DbUtil.connectDb();
        String description = request.getParameter("description");
        String departureAddress = request.getParameter("departureAddress");
        String destinationAddress = request.getParameter("destinationAddress");
        Integer id = Integer.parseInt(request.getParameter("postID"));
        response.getWriter().println("Server=>" + description + " " + departureAddress + " " + destinationAddress + " " + id);

        int unhealthy = isUnhealthy(description);
        if (unhealthy == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("unhealthy", "true");

        }


        String sql = "update post set description= ? ,departureAddress = ? ,destinationAddress = ? ,unhealthy =? where id= ?";

        state = con.prepareStatement(sql);

        // set params
        state.setString(1, description);
        state.setString(2, departureAddress);
        state.setString(3, destinationAddress);
        state.setInt(4, unhealthy);//unhealthy
        state.setInt(5, id);

        // execute SQL statement
        state.executeUpdate();


        response.getWriter().println("Successfully Updated the post !");

    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con = DbUtil.connectDb();

        Integer postID = Integer.parseInt(request.getParameter("postID"));

        List<Integer> imageIDList = new ArrayList<Integer>();
        try {
            String sql = "delete  from comment where Post_id= ? "; //deleting post relative comments
            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setInt(1, postID);
            // execute SQL statement
            state.execute();

            sql = "delete  from post_reaction where Post_id= ? "; //deleting post relative reaction
            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setInt(1, postID);
            // execute SQL statement
            state.execute();

            sql = "select Image_id from post_image where Post_id= ?"; //deleting post relative image table
            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setInt(1, postID);
            // execute SQL statement
            row = state.executeQuery();

            while (row.next()) {
                int id = row.getInt("Image_id");
                imageIDList.add(id);
            }

            for (int id : imageIDList) { //deleting images

                sql = "select link  from image where id= ? "; //deleting each post images

                // prepare statement
                state = con.prepareStatement(sql);
                // set params
                state.setInt(1, id);
                // execute SQL statement
                row = state.executeQuery();
                while (row.next()) {
                    String url = row.getString("link");

                    File file = new File(request.getContextPath() + url);

                    if (!file.isDirectory()) {
                        file.delete();
                    }

                    //DELETE a Image here from this url
                }
                sql = " delete from post_image where Post_id= ? ";// post-image connecting table delete

                // prepare statement
                state = con.prepareStatement(sql);
                // set params
                state.setInt(1, id);
                // execute SQL statement
                state.execute();

                sql = "delete  from image where id= ? ;";

                // prepare statement
                state = con.prepareStatement(sql);
                // set params
                state.setInt(1, id);
                // execute SQL statement
                state.execute();
            }


            sql = "delete  from post where id= ? "; //deleting post
            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setInt(1, postID);
            // execute SQL statement
            state.execute();


            DbUtil.close(con, state, row);

            response.getWriter().println("Successfully deleted the post !");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void scrollDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con = DbUtil.connectDb();
        Integer page = Integer.parseInt(request.getParameter("page"));
        Integer userID = Integer.parseInt(request.getParameter("userID"));

        List<Post> postItems = HomeDao.getPosts(userID, page);
        HomeAvator avator = HomeDao.getAvator(userID);

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("loginAvator", avator);
        data.put("posts", postItems);
        //Creating the ObjectMapper object
        ObjectMapper mapper = new ObjectMapper();
        //Converting the Object to JSONString
        String jsonString = mapper.writeValueAsString(data);

        response.getWriter().println(jsonString);

    }

    private void searchPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keywords");
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        List<Post> postItems = HomeDao.searchPosts(userID, 1, keyword); //10 posts // hershw ...
        HomeAvator avator = HomeDao.getAvator(userID);

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("loginAvator", avator);
        data.put("posts", postItems);
        //Creating the ObjectMapper object
        ObjectMapper mapper = new ObjectMapper();
        //Converting the Object to JSONString
        String jsonString = mapper.writeValueAsString(data);

        response.getWriter().println(jsonString);
    }


}
