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
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import itravel.dao.HomeDao;
import itravel.model.BanWord;
import itravel.model.HomeAvator;
import itravel.model.Post;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(value = "/post")
@MultipartConfig
public class PostController extends HttpServlet {
        Connection con = null;
        PreparedStatement state = null;
        ResultSet row = null;
        Statement statement = null;

        @Override
        public void init() throws ServletException {
            super.init();
        }


    private void post(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection con = DbUtil.connectDb();

        String description = request.getParameter("description");
        String departureAddress = request.getParameter("departureAddress");
        String destinationAddress = request.getParameter("destinationAddress");
        Double latitude = Double.valueOf(request.getParameter("latitude"));
        Double longitude = Double.valueOf(request.getParameter("longitude"));
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        String notify = request.getParameter("notify");
        Integer isNotify = (notify == "on") ? 1 : 0;

        int unhealthy = PostActionController.isUnhealthy(description);
        if (unhealthy == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("unhealthy", "true");

        }


        response.getWriter().println("Server=>" + userID + " " + description + "<br> " + latitude + " " + longitude + "  " + departureAddress + " " + destinationAddress);


        try {
            String sql = "insert  into post(datetime,latitude,longitude,description,departureAddress,destinationAddress,unhealthy,notified,User_id) VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? )";

            // prepare statement
            state = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            long time = new java.util.Date().getTime();
            Date date = new Date(time);
            // set params
            ;
            state.setDate(1, date);
            state.setDouble(2, latitude);
            state.setDouble(3, longitude);
            state.setString(4, description);
            state.setString(5, departureAddress);
            state.setString(6, destinationAddress);
            state.setInt(7, unhealthy);//unhealthy
            state.setInt(8, isNotify);
            state.setInt(9, userID);
            // execute SQL statement
            int postID = 0;
            state.executeUpdate();
            row = state.getGeneratedKeys();
            while (row.next()) {
                postID = row.getInt(1);
            }


            response.getWriter().println("POST ID => " + postID);//post-str.jpg and post-large-str.jpg
            boolean isFileUploaded = ServletFileUpload.isMultipartContent(request);
            if (!isFileUploaded) { //if no file
                DbUtil.close(con, state, row);
                response.getWriter().println("Successfully Added the post  without image!");
                return; //end

            }
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            String myTimeStamp = timestamp.getTime() + "";
            String filePath = getServletContext().getRealPath("") + "images\\post\\";

            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();
            String imageExtension = getImageExtension(fileName);
            String newfileName = "post-" + myTimeStamp + "." + imageExtension;
            String image1 = filePath + newfileName;
            String dbFileURL = "images/post/" + newfileName;
            part.write(image1);
            //String image2 = filePath+"Large\\"+"post-large-"+myTimeStamp+"."+imageExtension;

            //part.write(image2);
            response.getWriter().println("url =>" + dbFileURL);
            int imagePrimaryKey = insertAnImageIntoDbTable(dbFileURL);

            sql = "insert  into post_image VALUES(?,?)";
            state = con.prepareStatement(sql);
            state.setInt(1, postID);
            state.setInt(2, imagePrimaryKey);
            state.executeUpdate();


            DbUtil.close(con, state, row);
            response.getWriter().println("Successfully Added the post with images !");
//            response.sendRedirect("/");


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private int insertAnImageIntoDbTable(String url) {

        try {
            String sql = "insert  into image(name,link) VALUES(?,?)";

            // prepare statement
            state = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setString(1, "post");
            state.setString(2, url);

            // execute SQL statement

            state.executeUpdate();
            row = state.getGeneratedKeys();
            int imgID=0;
            while (row.next()) {
                imgID = row.getInt(1);
            }
            return imgID;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return 0;
    }

    private static String getImageExtension(String fileName) {
        String extension = "none";
        int index = fileName.lastIndexOf(".");
        if (index > 0) {
            extension = fileName.substring(index + 1);
            extension = extension.toLowerCase();
        }
        return extension;
    }

}
