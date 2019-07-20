package model;

//model class feedback
public class Feedback {
	
	//private variables
	private String comment;
	
	private String myemail_id;
	
	
	//setters
	public void setComment(String message) {
		this.comment=message;
	}
	
	public void setEmail(String message) {
		this.myemail_id=message;
	}
	
	//getters
	public String getComment() {
		return this.comment;
	}
	
	public String getEmail_id() {
		return this.myemail_id;
	}

}
