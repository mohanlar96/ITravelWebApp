//package itravel.controller.ajaxRequest;
//import itravel.dao.DbUtil;
//
//import java.awt.*;
//import java.io.IOException;
//import java.sql.Date;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.sql.*;
//import java.util.Collection;
//
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//@WebServlet(value = "/post")
//@MultipartConfig
//public class PostController extends HttpServlet {
//        Connection con = null;
//        PreparedStatement state = null;
//        ResultSet row = null;
//        Statement statement = null;
//
//        @Override
//        public void init() throws ServletException {
//            super.init();
//        }
//
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        Connection con = DbUtil.connectDb();
//        String description = request.getParameter("description");
//        String departureAddress = request.getParameter("departureAddress");
//        String destinationAddress = request.getParameter("destinationAddress");
//        Double latitude = Double.valueOf(request.getParameter("latitude"));
//        Double longitude = Double.valueOf(request.getParameter("longitude"));
//        Integer userID = Integer.parseInt(request.getParameter("userID"));
//        String notify = request.getParameter("notify");
//        Integer isNotify = (notify == "on") ? 1 : 0;
//
//        int unhealthy = PostActionController.isUnhealthy(description);
//        if (unhealthy == 1) {
//            HttpSession session = request.getSession();
//            session.setAttribute("unhealthy", "true");
//
//        }
//
//
//        response.getWriter().println("Server=>" + userID + " " + description + "<br> " + latitude + " " + longitude + "  " + departureAddress + " " + destinationAddress);
//
//
//        try {
//            String sql = "insert  into post(datetime,latitude,longitude,description,departureAddress,destinationAddress,unhealthy,notified,User_id) VALUES( ? , ? , ? , ? , ? , ? , ? , ? , ? )";
//            // prepare statement
//            state = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            long time = new java.util.Date().getTime();
//            Date date = new Date(time);
//            // set params
//            ;
//            state.setDate(1, date);
//            state.setDouble(2, latitude);
//            state.setDouble(3, longitude);
//            state.setString(4, description);
//            state.setString(5, departureAddress);
//            state.setString(6, destinationAddress);
//            state.setInt(7, unhealthy);//unhealthy
//            state.setInt(8, isNotify);
//            state.setInt(9, userID);
//            // execute SQL statement
//            int postID = 0;
//            state.executeUpdate();
//            row = state.getGeneratedKeys();
//            while (row.next()) {
//                postID = row.getInt(1);
//            }
//
//
//            response.getWriter().println("POST ID => " + postID);
//
//
//            Collection<Part> parts = request.getParts();
//
//            for(Part p:parts){
//                System.out.println(p.getSubmittedFileName());
//                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//                String myTimeStamp = timestamp.getTime() + "";
//                String filePath = getServletContext().getRealPath("") + "images\\post\\";
//                String fileName = p.getSubmittedFileName();
//                String imageExtension = getImageExtension(fileName);
//                String newfileName = "post-" + myTimeStamp + "." + imageExtension;
//                String image1 = filePath + newfileName;
//                String dbFileURL = "images/post/" + newfileName;
//                System.out.println("url =>" + dbFileURL+newfileName);
//                p.write(image1);
//                int imagePrimaryKey = insertAnImageIntoDbTable(dbFileURL);
//                sql = "insert  into post_image VALUES(?,?)";
//                state = con.prepareStatement(sql);
//                state.setInt(1, postID);
//                state.setInt(2, imagePrimaryKey);
//                state.executeQuery();
//            }
//            DbUtil.close(con, state, row);
//            response.getWriter().println("Successfully Added the post with images !");
//            response.sendRedirect("/");
//
//
//        } catch (SQLException | IOException | ServletException throwables) {
//            throwables.printStackTrace();
//        }
//    }
//
//    private int insertAnImageIntoDbTable(String url) {
//
//        try {
//            String sql = "insert  into image(name,link) VALUES(?,?)";
//
//            // prepare statement
//            state = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
//            // set params
//            state.setString(1, "post");
//            state.setString(2, url);
//
//            // execute SQL statement
//
//            state.executeUpdate();
//            row = state.getGeneratedKeys();
//            int imgID=0;
//            while (row.next()) {
//                imgID = row.getInt(1);
//            }
//            return imgID;
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//        return 0;
//    }
//
//    private static String getImageExtension(String fileName) {
//        String extension = "none";
//        int index = fileName.lastIndexOf(".");
//        if (index > 0) {
//            extension = fileName.substring(index + 1);
//            extension = extension.toLowerCase();
//        }
//        return extension;
//    }
//
//}
