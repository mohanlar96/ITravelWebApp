package itravel.model;

public class Profile {

	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	//pictures
	private String profPicSmall;
	private String profPicMedium;
	private String profPicLarge;
	private String banner;
	//person
	private String fullName;
	private String firstName;
	private String midName;
	private String lastName;
	private String gender;
	private String job;
	private String cityBirth;
	private String dateBirth;
	private Address address;
	//user
	private String userId;
	private String email;
	private String username;
	private String password;
	private String biography;
	private boolean isDeactivated;

	// GETTERS & SETTERS
	//pictures
	public String getProfPicSmall()                    { return profPicSmall; }
	public void setProfPicSmall(String profPicSmall)   { this.profPicSmall = profPicSmall; }
	public String getProfPicMedium()                   { return profPicMedium; }
	public void setProfPicMedium(String profPicMedium) {
		this.profPicSmall = profPicMedium;
	}
	public String getProfPicLarge()                    { return profPicLarge; }
	public void setProfPicLarge(String profPicLarge)   { this.profPicLarge = profPicLarge; }
	public String getBanner()                  		   { return banner; }
	public void setBanner(String banner)               { this.banner = banner; }
	//person
	public String getFullName()                { return fullName; }
	public void setFullName(String fullName)   { this.fullName = fullName; }
	public String getFirstName()               { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }
	public String getMidName()                 { return midName; }
	public void setMidName(String midName)     { this.midName = midName; }
	public String getLastName()                { return lastName; }
	public void setLastName(String lastName)   { this.lastName = lastName; }
	public String getGender()                  { return gender; }
	public void setGender(String gender)       { if(gender.equals("M") || gender.equals("F")) this.gender = gender;}
	public String getJob()                     { return job; }
	public void setJob(String job)             { this.job = job; }
	public String getCityBirth()               { return cityBirth; }
	public void setCityBirth(String cityBirth) { this.cityBirth = cityBirth; }
	public String getDateBirth()               { return dateBirth; }
	public void setDateBirth(String dateBirth) { this.dateBirth = dateBirth; }
	public Address getAddress()                { return address; }
	public void setAddress(Address address)    { this.address = address; }
	//user
	public String getUserId() 			       { return userId; }
	public void setUserId(String userId)       { this.userId= userId; }
	public String getEmail()               	   { return email; }
	public void setEmail(String email) 		   { this.email = email; }
	public String getUsername()                { return username; }
	public void setUsername(String username)   { this.username = username; }
	public String getPassword()                { return password; }
	public void setPassword(String password)   { this.password = password; }
	public String getBiography()               { return biography; }
	public void setBiography(String biography) { this.biography = biography; }
	public boolean getIsDeactivated()		   { return isDeactivated; }
	public void setIsDeactivated(boolean deac) { this.isDeactivated = deac; }
}