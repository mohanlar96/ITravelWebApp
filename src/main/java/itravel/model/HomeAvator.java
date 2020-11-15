package itravel.model;

public class HomeAvator  extends Avator{
    private String banner;
    private String biography;

    public HomeAvator(int id, String firstName, String lastName, String profileUrl) {
        super(id, firstName, lastName, profileUrl);
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    @Override
    public String toString() {
        return "HomeAvator{" +
                "banner='" + banner + '\'' +
                ", biography='" + biography + '\'' +
                "} " + super.toString();
    }
}
