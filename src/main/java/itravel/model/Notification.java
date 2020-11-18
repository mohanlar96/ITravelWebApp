package itravel.model;

public class Notification {
    private Avator avator;

    private String message;
    private String postDate;

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public Avator getAvator() {
        return avator;
    }

    public void setAvator(Avator avator) {
        this.avator = avator;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "avator=" + avator +
                ", message='" + message + '\'' +
                ", postDate='" + postDate + '\'' +
                '}';
    }
}
