package itravel.dao;

import itravel.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HomeDao {
    // get a connection
    static Connection  con =null;
    // scroll 10th to 20 ths
    public  static  List<Post> getPosts(int UserId ,int page) throws Exception {
        String offset=(page>1)?" offset "+(page-1)*10:"";
        String sql = "" +
                "SELECT post.*, person.fname, person.lname, image.link " +
                "FROM post INNER JOIN user ON post.User_id=user.id " +
                "INNER JOIN person ON user.Person_id=person.id " +
                "INNER JOIN user_image ON user.id=user_image.User_id " +
                "INNER JOIN image ON user_image.Image_id=image.id " +
                "WHERE user_image.sizeimg='M' order by post.datetime limit 10";


        return postItems(sql);


    }
    public static List<Post> searchPosts(int UserId ,int page ,String searchString) throws Exception {
        String sql = "" +
                "SELECT post.*, person.fname, person.lname, image.link " +
                "FROM post INNER JOIN user ON post.User_id=user.id " +
                "INNER JOIN person ON user.Person_id=person.id " +
                "INNER JOIN user_image ON user.id=user_image.User_id " +
                "INNER JOIN image ON user_image.Image_id=image.id " +
                "WHERE user_image.sizeimg='M' order by post.datetime limit "+page*10; //searching

        return postItems(sql);

    }

    public static List<Post> postItems( String sql) throws Exception {

        List<Post> posts = new ArrayList<>();
        Statement state=null;
        ResultSet row=null;
        con= DbUtil.connectDb();
        try {
            // create sql statement
            state = con.createStatement();
            // execute query
            row = state.executeQuery(sql);
            // process resultset
            while (row.next()) {
                // retrieve data from result set row
                // create new post object
                int postID=row.getInt("id");


                Avator postAvator =new Avator(row.getInt("User_id"),row.getString("fname"),row.getString("lname"),row.getString("link"));

                Post tempPost = new Post(
                        postID,
                        row.getString("description"),
                        row.getString("datetime"),
                        new Location(row.getString("latitude"), row.getString("longitude")),
                        row.getString("departureAddress"), row.getString("destinationAddress"),
                        postAvator
                );

                //now going to fetch all of the images from posts
                tempPost.setImages(fetchPostImages(postID));

                //now going to fetch all of the comment of posts
                tempPost.setComments(fetchPostComments(postID));

                //now going to feall all of the reaction of posts
                tempPost.setReactions(fetchPostReactions(postID));
                //adding each post into post Array list
                posts.add(tempPost);


            }
            return posts;
        } finally {
            // close JDBC objects
            DbUtil.close(con, state, row);
        }

    }

    public static List<PostImage> fetchPostImages(int postId)  {
        List<PostImage> postImages=new ArrayList<PostImage>();

        ResultSet row = null;
        try {
            String sql="" +
                    "select image.id,image.link from image " +
                    "left join post_image on image.id=post_image.Image_id " +
                    "where post_image.Post_id=?" +
                    "";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,postId);
            row = ps.executeQuery();
            while (row.next() )
            {
                PostImage image = new PostImage(row.getInt("id"),row.getString("link"));
                postImages.add(image);
            }
        } catch (SQLException throwables) {
            System.out.println(throwables);
            throwables.printStackTrace();
        }

        return postImages;
    }
    public static List<Comment> fetchPostComments(int postId)  {
        List<Comment> postedComment=new ArrayList<>();
        try {
            String sql="" +
                    "SELECT user_image.User_id, comment.id,comment.description, person.fname, person.lname, image.link FROM comment " +
                    "INNER JOIN user ON comment.Actor_id=user.id " +
                    "INNER JOIN person ON user.Person_id=person.id " +
                    "INNER JOIN user_image ON user.id=user_image.User_id " +
                    "INNER JOIN image ON user_image.Image_id=image.id " +
                    "WHERE user_image.sizeimg='M' AND comment.Post_id=?";

            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,postId);
            ResultSet row = ps.executeQuery();
            while (row.next())
            {
                Avator avator =new Avator(row.getInt("User_id"),row.getString("fname"),row.getString("lname"),row.getString("link"));
                Comment comment = new Comment(row.getInt("id"), avator,row.getString("description"));
                postedComment.add(comment);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return postedComment;


    }
    private static List<PostReaction> fetchPostReactions(int postID)  {
        List<PostReaction> postReactions=new ArrayList<>();
        try {
            String sql="SELECT user.id, person.fname, person.lname, image.link FROM post " +
                    "INNER JOIN post_reaction ON post.id=post_reaction.Post_id " +
                    "INNER JOIN user ON post_reaction.Actor_id=user.id " +
                    "INNER JOIN person ON user.id=person.id " +
                    "INNER JOIN user_image ON user.id=user_image.User_id " +
                    "INNER JOIN image ON user_image.Image_id=image.id " +
                    "WHERE post.id=? AND post_reaction.Reaction_id=1 AND user_image.sizeimg='S'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,postID);
            ResultSet row = ps.executeQuery();
            while (row.next())
            {
                Avator avator =new Avator(row.getInt("id"),row.getString("fname"),row.getString("lname"),row.getString("link"));
                PostReaction reaction=new PostReaction(avator);
                postReactions.add(reaction);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return postReactions;
    }
    public static List<String> getVisitedPlace(int avatorID){
        con=DbUtil.connectDb();

        List<String> visitedPlaces=new ArrayList<String>();
        try {
            String sql="" +
                    "select post.destinationAddress " +
                    "from post " +
                    "where User_id=? order by id desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,avatorID);
            ResultSet row = ps.executeQuery();
            while (row.next())
            {
                visitedPlaces.add(row.getString("destinationAddress"));
            }
            DbUtil.close(con,ps,row);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return visitedPlaces;

    }

    public static List<Notification> getNotifications(int loginUserId){
        String sql="" +
                "SELECT p.id, p.fname, p.lname, i.link,post.datetime FROM itraveldb.person p " +
                "        INNER JOIN itraveldb.user u ON p.id=u.Person_id " +
                "        INNER JOIN itraveldb.user_image ui ON u.id=ui.User_id " +
                "        INNER JOIN itraveldb.image i ON ui.Image_id=i.id " +
                "        INNER JOIN itraveldb.post ps ON u.id=ps.User_id " +
                "        INNER JOIN itraveldb.follower f ON u.id=f.User_id " +
                "        WHERE f.Follower1_id=? AND p.notified=1 AND ui.sizeimg='S' ";


        con=DbUtil.connectDb();
        Avator avator=null;
        List<Notification> notifications=new ArrayList<>();
        Notification notification=new Notification();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, loginUserId);
            ResultSet row = ps.executeQuery();
            while (row.next()) {
                 avator = new Avator(row.getInt("id"), row.getString("fname"), row.getString("lname"),row.getString("link"));
                 notification.setAvator(avator);
                 notification.setPostDate(row.getString("datetime"));
                 notification.setMessage("Added a post");
                 notifications.add(notification);
            }
            DbUtil.close(con, ps, row);
        }  catch (SQLException throwables) {
        throwables.printStackTrace();
         }
        return notifications;


    }

    public static HomeAvator getAvator(int avatorID) {
        con=DbUtil.connectDb();
        HomeAvator avator=null;
        try {
            String sql="" +
                    "SELECT user.email,user.id,user.Biography,person.fname,person.lname  " +
                    "FROM  user INNER JOIN person ON user.Person_id=person.id " +
                    "WHERE  user.id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,avatorID);
            ResultSet row = ps.executeQuery();
            while (row.next())
            {
                avator =new HomeAvator(row.getInt("id"),row.getString("fname"),row.getString("lname"),null);
                avator.setBiography(row.getString("biography"));
                avator.setEmail(row.getString("email"));
            }
            sql="SELECT image.link, user_image.sizeimg " +
                    "FROM image INNER JOIN user_image ON image.id=user_image.Image_id WHERE " +
                    "user_image.User_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,avatorID);
            row = ps.executeQuery();
            while (row.next())
            {
                String imgSize=row.getString("sizeimg");
                if(imgSize.contains("V")) avator.setBanner(row.getString("link"));
                if(imgSize.contains("M")) avator.setProfileUrl(row.getString("link"));
                if(imgSize.contains("S")) avator.setAvatorIcon(row.getString("link"));


            }
            DbUtil.close(con,ps,row);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return avator;
    }
}
