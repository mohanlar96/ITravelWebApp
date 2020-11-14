package itravel.model;

import java.util.ArrayList;
import java.util.List;

public class Avator {
    private int id;
    private String firstName;
    private String lastName;
    private String profileUrl;

    public Avator(int id,String firstName, String lastName,String profileUrl){
        this.id=id;
        this.firstName =firstName;
        this.lastName =lastName;
        this.profileUrl=profileUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getProfileUrl() {
        return profileUrl;
    }

    public void setProfileUrl(String profileUrl) {
        this.profileUrl = profileUrl;
    }

    @Override
    public String toString() {
        return "Avator{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", profileUrl='" + profileUrl + '\'' +
                '}';
    }
}
