package itravel.model;

public class Comment {
    private int ID;
    private Avator avator;
    private String commentContent;


    public Comment(int ID, Avator avator, String commentContent) {
        this.ID = ID;
        this.avator = avator;
        this.commentContent = commentContent;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = iD;
    }

    public Avator getCommentingUser() {
        return avator;
    }

    public Avator getAvator() {
        return avator;
    }

    public void setAvator(Avator avator) {
        this.avator = avator;
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
                "ID=" + ID +
                ", avator=" + avator +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
