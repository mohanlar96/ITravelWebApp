package itravel.model;

public class PeopleFollow {
    private int userID;
    private String firstName;
    private String lastName;
    private String picturePath;
    private boolean isFollwing; // 0,1

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public boolean getIsFollwing() {
        return isFollwing;
    }

    public void setFollwing(boolean follwing) {
        isFollwing = follwing;
    }

    public int getUserID() {
        return userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPicturePath() {
        return picturePath;
    }


}
