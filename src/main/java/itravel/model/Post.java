package itravel.model;


import java.util.Date;

public class Post {
private String postID;
private User postingUser; // email
private Address location;//Country, City
private Date postDate;
public String getPostID() {
	return postID;
}
public void setPostID(String postID) {
	this.postID = postID;
}
public User getUserID() {
	return postingUser;
}
public void setUserID(User postingUser) {
	this.postingUser = postingUser;
}
public Address getLocation() {
	return location;
}
public void setLocation(Address location) {
	this.location = location;
}
public Date getPostDate() {
	return postDate;
}
public void setPostDate(Date postDate) {
	this.postDate = postDate;
}


}
