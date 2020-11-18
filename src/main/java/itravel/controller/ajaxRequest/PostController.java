package itravel.controller.ajaxRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import itravel.dao.DbUtil;

import java.io.File;
import java.net.UnknownServiceException;
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
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(value = "/myPost")
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


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DbUtil.connectDb();

        String description = request.getParameter("description");
        String departureAddress = request.getParameter("departureAddress");
        String destinationAddress = request.getParameter("destinationAddress");
        Double latitude = Double.valueOf(request.getParameter("latitude"));
        Double longitude = Double.valueOf(request.getParameter("longitude"));
        Integer UserID = Integer.parseInt(request.getParameter("UserID"));
        System.out.println("USer ID"+ UserID);
        String notify = request.getParameter("notify");
        Integer isNotify = (notify == "on") ? 1 : 0;

        int unhealthy = PostActionController.isUnhealthy(description);
        if (unhealthy == 1) {
            HttpSession session = request.getSession();
            session.setAttribute("unhealthy", "true");

        }


        // response.getWriter().println("Server=>" + UserID + " " + description + "<br> " + latitude + " " + longitude + "  " + departureAddress + " " + destinationAddress);


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
            state.setInt(9, UserID);
            // execute SQL statement
            int postID = 0;
            state.executeUpdate();
            row = state.getGeneratedKeys();
            while (row.next()) {
                postID = row.getInt(1);
            }


            DiskFileItemFactory factory = new DiskFileItemFactory();

            factory.setSizeThreshold(1024 * 1024 * 5 );
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload fileUpload = new ServletFileUpload(factory);

            fileUpload.setFileSizeMax(1024 * 1024 * 50);
            fileUpload.setSizeMax(1024 * 1024 * 50);

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            String myTimeStamp = timestamp.getTime() + "";
            String filePath = getServletContext().getRealPath("") + "images\\post\\";

            List<FileItem> formItems = fileUpload.parseRequest(request);
            System.out.println("sizeee "+formItems.size());
            for (FileItem item : formItems)
            {

                String fileName = item.getName();
                String imageExtension = getImageExtension(fileName);
                String newfileName = "post-" + myTimeStamp + "." + imageExtension;
                String image1 = filePath + newfileName;
                String dbFileURL = "images/post/" + newfileName;

                item.write(new File( image1 ));

                int imagePrimaryKey = insertAnImageIntoDbTable(dbFileURL);

                System.out.println("Testing..."+ postID+" "+imagePrimaryKey);

                sql = "insert  into post_image VALUES(?,?)";
                state = con.prepareStatement(sql);
                state.setInt(1, postID);
                state.setInt(2, imagePrimaryKey);
                state.executeUpdate();
            }


            DbUtil.close(con, state, row);
//            response.getWriter().println("Successfully Added the post with images !");
            response.sendRedirect("/home");


        } catch (SQLException | IOException | ServletException  throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int insertAnImageIntoDbTable(String url) {
        try {
            String sql = "insert  into image(name,link) VALUES(?,?)";

            // prepare statement
            state = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setString(1, "post");
            state.setString(2, url);

            // execute SQL statement


            int imgID = 0;
            state.executeUpdate();
            row = state.getGeneratedKeys();
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
