package itravel.model;

public class HomeAvator  extends Avator{
    private String banner;
    private String biography;
    private String avatorIcon;
    private  String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public HomeAvator(int id, String firstName, String lastName, String profileUrl) {
        super(id, firstName, lastName, profileUrl);
    }

    public String getBanner() {
        return banner;
    }

    public String getAvatorIcon() {
        return avatorIcon;
    }

    public void setAvatorIcon(String avatorIcon) {
        this.avatorIcon = avatorIcon;
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
                ", avatorIcon='" + avatorIcon + '\'' +
                "} " + super.toString();
    }
}
