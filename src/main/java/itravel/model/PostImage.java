package itravel.model;

public class PostImage {
    private int id;
    private String url;

    public PostImage(int id, String url) {
        this.id = id;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "PostImage{" +
                "id=" + id +
                ", url='" + url + '\'' +
                '}';
    }
}
