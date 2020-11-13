package itravel.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String FirstName;
    private String LastName;
    private String Gender;
    private Address Address;
    private String BirthYear;
    private String Email;
    private String Password;
    private List<User> followers;
    private List<User> followees;
    private  String profileurl;


    public User() {
        followers = new ArrayList<>();
        followees = new ArrayList<>();
    }
    public User(String firstName,String lastName ,String profileurl){ //this is for profile url
        this.FirstName=firstName;
        this.LastName=lastName;
        this.profileurl=profileurl;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public Address getAddress() {
        return Address;
    }

    public void setAddress(Address address) {
        Address = address;
    }

    public String getBirthYear() {
        return BirthYear;
    }

    public void setBirthYear(String birthYear) {
        BirthYear = birthYear;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        MD5 md5 = new MD5();
        Password = md5.getMd5(password);
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

    @Override
    public String toString() {
        return "User{" +
                "FirstName='" + FirstName + '\'' +
                ", LastName='" + LastName + '\'' +
                ", Gender='" + Gender + '\'' +
                ", Address=" + Address +
                ", BirthYear='" + BirthYear + '\'' +
                ", Email='" + Email + '\'' +
                ", Password='" + Password + '\'' +
                ", followers=" + followers +
                ", followees=" + followees +
                '}';
    }
}
