package itravel.model;

public class Profile {

	private Picture CoverPicture; //banner
	private String status;
	private String Hobby;

	private String profPicSmall;
	private String profPicMedium;
	private String profPicLarge;
	private String userId;
	private String fullName;
	private String biography;
	private String job;
	private String cityBirth;

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
	public String getHobby() {
		return Hobby;
	}
	public void setHobby(String hobby) {
		Hobby = hobby;
	}

	public String getProfPicSmall()         { return profPicSmall; }
	public void setProfPicSmall(String profPicSmall) {
		this.profPicSmall = profPicSmall;
	}
	public String getProfPicMedium()         { return profPicMedium; }
	public void setProfPicMedium(String profPicMedium) {
		this.profPicSmall = profPicMedium;
	}
	public String getProfPicLarge()         { return profPicLarge; }
	public void setProfPicLarge(String profPicLarge) {
		this.profPicLarge = profPicLarge;
	}
	public String getUserId() 			       { return userId; }
	public void setUserId(String userId)       { this.userId= userId; }
	public String getFullName()                { return fullName; }
	public void setFullName(String fullName)   { this.fullName = fullName; }
	public String getBiography()               { return biography; }
	public void setBiography(String biography) {
			this.biography = biography;
		}
	public String getJob()                     { return job; }
	public void setJob(String job)             { this.job = job; }
	public String getCityBirth()               { return cityBirth; }
	public void setCityBirth(String cityBirth) { this.cityBirth = cityBirth; }
}
