package itravel.controller.ajaxRequest;
import com.fasterxml.jackson.databind.ObjectMapper;
import itravel.dao.DbUtil;
import java.io.File;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import itravel.dao.HomeDao;
import itravel.model.Post;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(value = "/post/interact")
@MultipartConfig
public class PostRelativeController extends HttpServlet {
    Connection con=null;
    PreparedStatement state=null;
    ResultSet row=null;
    Statement statement=null;
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
            case "POST":
                post(request, response);
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

        }
        } catch (Exception e) {
                e.printStackTrace();
            }


    }
    private void toggleLike(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con=DbUtil.connectDb();
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        Integer postID = Integer.parseInt(request.getParameter("postID"));
        boolean isLiked= Boolean.valueOf(request.getParameter("isLiked"));

        response.getWriter().println("Server=>"+userID +" "+postID+" "+isLiked);

        try{
            if(isLiked){ //if no false .. mea
                String sql = "delete  from post_reaction WHERE Actor_id="+userID+" AND Post_id="+postID;
                // prepare statement
                state = con.prepareStatement(sql);
                state.executeUpdate();
                response.getWriter().println("Successfully disLike!");
            }else{
                String sql = "insert  into post_reaction VALUES(?,1,?)";
                // prepare statement
                state = con.prepareStatement(sql);
                // set params
                state.setInt(1, postID);
                state.setInt(2, userID);
                // execute SQL statement
                state.execute();
                DbUtil.close(con,state,null);
                response.getWriter().println("Successfully Like!");

            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }
    private  void deleteComment(HttpServletRequest request, HttpServletResponse response) throws Exception {

        con=DbUtil.connectDb();
        Integer commentID = Integer.parseInt(request.getParameter("commentID"));

        response.getWriter().println("Server=> commentID"+commentID );

        try{
            String sql = "delete from comment where id= ? ";
            // prepare statement
            state = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setInt(1, commentID);
            state.executeUpdate();

            DbUtil.close(con,state,null);
            response.getWriter().println("Successfully deleted the comment !");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    private void commentPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con=DbUtil.connectDb();

        String comment = request.getParameter("comment");
        Integer userID = Integer.parseInt(request.getParameter("userID"));
        Integer postID= Integer.parseInt(request.getParameter("postID"));

//        response.getWriter().println("Server=>"+userID +" "+postID+" "+comment);

        try{
            String sql = "insert  into comment(description,Post_id,Actor_id) VALUES( ? , ? , ? )";

            // prepare statement
            state = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            // set params
            state.setString(1, comment);
            state.setInt(2, postID);
            state.setInt(3, userID);

            int id = 0; //this is auto generate comment id
            state.executeUpdate();
            row= state.getGeneratedKeys();
            while (row.next() ) {
                id = row.getInt(1);
            }
            DbUtil.close(con,state,row);
            response.getWriter().println(id);
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    private void post(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con=DbUtil.connectDb();

        String description = request.getParameter("description");
        String departureAddress=request.getParameter("departureAddress");
        String destinationAddress=request.getParameter("destinationAddress");
        Double latitude=Double.valueOf(request.getParameter("latitude"));
        Double longitude=Double.valueOf(request.getParameter("longitude"));
        Integer userID = Integer.parseInt(request.getParameter("userID"));

        response.getWriter().println("Server=>"+userID +" "+description+"<br> "+latitude +" "+longitude+"  "+departureAddress+" "+destinationAddress );


        try{
            String sql = "insert  into post(datetime,latitude,longitude,description,departureAddress,destinationAddress,unhealthy,User_id) VALUES( ? , ? , ? , ? , ? , ? , ? , ? )";

            // prepare statement
            state = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            long time = new java.util.Date().getTime();
            Date date= new Date(time);
            // set params
            ;
            state.setDate(1,  date);
            state.setDouble(2, latitude);
            state.setDouble(3, longitude);
            state.setString(4,description);
            state.setString(5,departureAddress);
            state.setString(6,destinationAddress);
            state.setInt(7,1);//unhealthy
            state.setInt(8,userID);
            // execute SQL statement
            int postID = 0;
            state.executeUpdate();
            row= state.getGeneratedKeys();
            while (row.next() ) {
                 postID = row.getInt(1);
            }
            response.getWriter().println("POST ID => "+postID);


            boolean isFileUploaded= ServletFileUpload.isMultipartContent(request);
            if(!isFileUploaded){ //if no file
                DbUtil.close(con,state,row);
                response.getWriter().println("Successfully Added the post  without image!");
                return ; //end

            }
            //file uploading start

            String filePath = request.getContextPath()+"/images/post/";
            int maxFileSize = 50 * 1024;
            int maxMemSize = 4 * 1024;
            String dbFileURL=null;


            DiskFileItemFactory factory = new DiskFileItemFactory();

            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);

            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("c:\\temp"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // maximum file size to be uploaded.
            upload.setSizeMax( maxFileSize );
            ArrayList<Integer> imageIDList=new ArrayList<Integer>();

            try {
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);
                System.out.println(fileItems.toString());

                // Process the uploaded file items
                Iterator i = fileItems.iterator();

                while ( i.hasNext () ) {
                    FileItem fi = (FileItem)i.next();
                    if ( !fi.isFormField () ) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
//                        fi.setFieldName("mohanlar");
                        String fileName = fi.getName();
                        String contentType = fi.getContentType();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        // Write the file
                        if( fileName.lastIndexOf("\\") >= 0 ) {
                            dbFileURL= filePath + fileName.substring( fileName.lastIndexOf("\\")) ;
                        } else {
                            dbFileURL= filePath + fileName.substring(fileName.lastIndexOf("\\")+1) ;
                        }
                        response.getWriter().println("url =>" +dbFileURL);

                        fi.write( new File(dbFileURL) ) ;
                        //insert into db
                        int imagePrimaryKey= insertAnImageIntoDbTable(dbFileURL);
                        imageIDList.add(imagePrimaryKey);
                    }
                }

            } catch(Exception ex) {
                System.out.println(ex);
            }

            for(Integer img_id:imageIDList){
                sql = "insert  into post_image VALUES(?,?)";
                state = con.prepareStatement(sql);
                state.setInt(1, postID);
                state.setInt(2, img_id);
                state.executeUpdate();
            }

            DbUtil.close(con,state,row);
            response.getWriter().println("Successfully Added the post with images !");
            response.sendRedirect("/");
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private int insertAnImageIntoDbTable(String url) {

        try{
            String sql = "insert  into post(name,link) VALUES(?,?)";

            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setString(1, "post");
            state.setString(2, url);

            // execute SQL statement
            state.execute();
            row=state.getGeneratedKeys();
            int imgID = 0;
            if(row.next())
            {
                imgID= row.getInt(1);
            }
            return imgID;
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return 0;
    }
    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con=DbUtil.connectDb();
        String description = request.getParameter("description");
        String departureAddress=request.getParameter("departureAddress");
        String destinationAddress=request.getParameter("destinationAddress");
        Integer id = Integer.parseInt(request.getParameter("postID"));
       response.getWriter().println("Server=>"+description +" "+departureAddress+" "+destinationAddress+ " "+id);



        String sql = "update post set description= ? ,departureAddress = ? ,destinationAddress = ? ,unhealthy =? where id= ?";

        state = con.prepareStatement(sql);

        // set params
        state.setString(1,description);
        state.setString(2,departureAddress);
        state.setString(3,destinationAddress);
        state.setInt(4,1);//unhealthy
        state.setInt(5,id);

        // execute SQL statement
        state.executeUpdate();



        response.getWriter().println("Successfully Updated the post !");

    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        con=DbUtil.connectDb();

        Integer postID = Integer.parseInt(request.getParameter("postID"));

        List<Integer> imageIDList=new ArrayList<Integer>();
        try{
            String sql="delete  from comment where Post_id= ? "; //deleting post relative comments
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

            sql="select Image_id from post_image where Post_id= ?"; //deleting post relative image table
            // prepare statement
            state = con.prepareStatement(sql);
            // set params
            state.setInt(1, postID);
            // execute SQL statement
            row=state.executeQuery();

            while (row.next() ) {
               int id= row.getInt("Image_id");
               imageIDList.add(id);
            }

            for(int id:imageIDList) { //deleting images

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



            DbUtil.close(con,state,row);

            response.getWriter().println("Successfully deleted the post !");

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void scrollDown(HttpServletRequest request, HttpServletResponse response) throws Exception{
        con=DbUtil.connectDb();
        Integer page = Integer.parseInt(request.getParameter("page"));
        Integer userID=Integer.parseInt(request.getParameter("userID"));
//        response.getWriter().println("Server=>"+page +" "+userID);

        List<Post> postItems=HomeDao.getPosts(userID,page);
        //Creating the ObjectMapper object
        ObjectMapper mapper = new ObjectMapper();
        //Converting the Object to JSONString
        String jsonString = mapper.writeValueAsString(postItems);

        response.getWriter().println(jsonString);

    }



}
