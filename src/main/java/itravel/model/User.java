package itravel.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String firstName;
    private String lastName;
    private String gender;
    private Address address;
    private String birthYear;
    private String email;
    private String password;
    private List<User> followers;
    private List<User> followees;
    private String profileurl;


    public User() {
        followers = new ArrayList<>();
        followees = new ArrayList<>();
    }
    public User(String firstName,String lastName ,String profileurl){ //this is for profile url
        this.firstName =firstName;
        this.lastName =lastName;
        this.profileurl=profileurl;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(String birthYear) {
        this.birthYear = birthYear;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        MD5 md5 = new MD5();
        this.password = md5.getMd5(password);
    }

    public List<User> getFollowers() {
        return followers;
    }

    public void addFollowers(User follower) {
        this.followers.add(follower);
    }

    public List<User> getFollowees() {
        return followees;
    }

    public void addFollowees(User followee) {
        this.followees.add(followee);
    }

    public String getProfileurl() {
        return profileurl;
    }

    public void setProfileurl(String profileurl) {
        this.profileurl = profileurl;
    }

    @Override
    public String toString() {
        return "User{" +
                "FirstName='" + firstName + '\'' +
                ", LastName='" + lastName + '\'' +
                ", profileurl='" + profileurl + '\'' +
                ", Gender='" + gender + '\'' +
                ", Address=" + address +
                ", BirthYear='" + birthYear + '\'' +
                ", Email='" + email + '\'' +
                ", Password='" + password + '\'' +
                ", followers=" + followers +
                ", followees=" + followees +
                '}';
    }
}
