package itravel.dao;

import itravel.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    // get a connection
    static Connection  con =null;
    public static List<Post> getPosts() throws Exception {

        List<Post> posts = new ArrayList<>();
        Statement state=null;
        ResultSet row=null;
        con= DbUtil.connectDb();
        try {
            // create sql statement
            String sql = "" +
                    "SELECT post.*, person.fname, person.lname, image.link" +
                    " FROM post left JOIN user ON post.User_id=user.id " +
                    "INNER JOIN person ON user.Person_id=person.id " +
                    "INNER JOIN user_image ON user.id=user_image.User_id " +
                    "INNER JOIN image ON user_image.Image_id=image.id " +
                    "WHERE user_image.sizeimg='M' order by post.datetime limit 10 " +
                    ";";
            state = con.createStatement();
            // execute query
             row = state.executeQuery(sql);
            // process resultset
            while (row.next()) {
                // retrieve data from result set row
                // create new post object
                int postID=row.getInt("id");
                Avator postAvator =new Avator(row.getString("fname"),row.getString("lname"),row.getString("link"));

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
                    "SELECT comment.id,comment.description, person.fname, person.lname, image.link FROM comment " +
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
                Avator avator =new Avator(row.getString("fname"),row.getString("lname"),row.getString("link"));
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
            String sql="SELECT person.fname, person.lname, image.link FROM post " +
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
                Avator avator =new Avator(row.getString("fname"),row.getString("lname"),row.getString("link"));
                PostReaction reaction=new PostReaction(avator);
                postReactions.add(reaction);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return postReactions;
    }



}
