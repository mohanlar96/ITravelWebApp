package itravel.model;

public class Profile {
    private Picture profilePicture;
    private Picture CoverPicture;
    private String status;
    private String Biography;
    private String Hobby;

    public Picture getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(Picture profilePicture) {
        this.profilePicture = profilePicture;
    }

    public Picture getCoverPicture() {
        return CoverPicture;
    }

    public void setCoverPicture(Picture coverPicture) {
        CoverPicture = coverPicture;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBiography() {
        return Biography;
    }

    public void setBiography(String biography) {
        Biography = biography;
    }

    public String getHobby() {
        return Hobby;
    }

    public void setHobby(String hobby) {
        Hobby = hobby;
    }

}
