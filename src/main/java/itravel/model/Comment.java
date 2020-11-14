package itravel.model;

public class Comment {
    private int ID;
    private User commentingUser;
    private String commentContent;


    public Comment(int ID, User commentingUSer, String commentContent) {
        this.ID = ID;
        this.commentingUser = commentingUSer;
        this.commentContent = commentContent;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public User getCommentingUser() {
        return commentingUser;
    }

    public void setCommentingUser(User commentingUser) {
        this.commentingUser = commentingUser;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "ID='" + ID + '\'' +
                ", commentingUSer=" + commentingUser +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
