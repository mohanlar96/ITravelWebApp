package itravel.model;

public class Comment {
    private int id;
    private Avator avator;
    private String commentContent;


    public Comment(int ID, Avator avator, String commentContent) {
        this.id = ID;
        this.avator = avator;
        this.commentContent = commentContent;
    }

    public int getId() {
        return id;
    }

    public void setId(int iD) {
        id = iD;
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
                "ID=" + id +
                ", avator=" + avator +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
