package itravel.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Post {
    private int postID;
    private String postDate;
    private Location location;
    private String depAddress;
    private String desAddress;
    private User user; // email
    private Address address;//Country, City
    private String description;
    private List<PostImage> images =new ArrayList<PostImage>();
    private List<Comment> comments =new ArrayList<Comment>();
    private List<PostReaction> reactions =new ArrayList<PostReaction>();
    private int unhealthy;

    public Post(int postID, String des,String postDate, Location loc, String depAddress, String desAddress,User user) {
        this.postID = postID;
        this.description=des;
        this.postDate = postDate;
        this.location = loc;
        this.depAddress = depAddress;
        this.desAddress = desAddress;
        this.user=user;
    }

    public void setImages(List<PostImage> images) {
        this.images = images;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void setReactions(List<PostReaction> reactions) {
        this.reactions = reactions;
    }

    public List<PostImage> getImages() {
        return images;
    }
    public void addImage(PostImage image) {
        this.images.add(image);
    }
    public List<PostReaction> getReactions() {
        return reactions;
    }
    public void addReaction(PostReaction user) {
        this.reactions.add(user);
    }
    public List<Comment> getComments() {
        return comments;
    }
    public void addComment(Comment comment) {
        this.comments.add(comment);
    }
    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getDepAddress() {
        return depAddress;
    }

    public void setDepAddress(String depAddress) {
        this.depAddress = depAddress;
    }

    public String getDesAddress() {
        return desAddress;
    }

    public void setDesAddress(String desAddress) {
        this.desAddress = desAddress;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Post{" +
                " postID=" + postID +
                ",description=" +description+
                ", postDate=" + postDate +
                ", location=" + location +
                ", depAddress='" + depAddress + '\'' +
                ", desAddress='" + desAddress + '\'' +
                ", user=" + user +
                ", address=" + address +
                ", images=" + images +
                ", comments=" + comments +
                ", reactions=" + reactions +
                '}';
    }

}