package itravel.controller.admin;

public class BanWord {
	private String id;
	private String theWord;
	
	public BanWord(String id, String theWord) {
		this.id = id;
		this.theWord = theWord;
	}

	public String getId() {
		return id;
	}

	public String getTheWord() {
		return theWord;
	}

	public void setTheWord(String theWord) {
		this.theWord = theWord;
	}	
	
}
