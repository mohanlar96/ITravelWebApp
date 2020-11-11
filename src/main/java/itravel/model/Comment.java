package itravel.model;

public class Comment {
private String ID;
private User commentingUSer;
public String getID() {
	return ID;
}
public void setID(String iD) {
	ID = iD;
}
public User getCommentingUSer() {
	return commentingUSer;
}
public void setCommentingUSer(User commentingUSer) {
	this.commentingUSer = commentingUSer;
}
public String getCommentContent() {
	return commentContent;
}
public void setCommentContent(String commentContent) {
	this.commentContent = commentContent;
}
private String commentContent;

}
