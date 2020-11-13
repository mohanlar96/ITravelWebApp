package itravel.model;

public class Comment {
    private int ID;
    private User commentingUSer;
    private String commentContent;


    public Comment(int ID, User commentingUSer, String commentContent) {
        this.ID = ID;
        this.commentingUSer = commentingUSer;
        this.commentContent = commentContent;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public User getCommentingUSer() {
        return commentingUSer;
    }

    public void setCommentingUSer(User commentingUSer) {
        this.commentingUSer = commentingUSer;
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
                ", commentingUSer=" + commentingUSer +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
