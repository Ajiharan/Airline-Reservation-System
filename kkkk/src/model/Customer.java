package model;

//model class
public class Customer {
	
	//private variables
	private String eid;
	private String Fname;
	private String Lname;
	private String Email;
	private String Pass;
	private String Repass;
	private String Priority;
	
	
	
	//setters
	public void addF(String message) {
		this.Fname=message;
	}
	public void addI(String message) {
		this.eid=message;
		
	}
	
	public void addL(String message) {
		this.Lname=message;
	}
	public void addE(String message) {
		this.Email=message;
	}
	public void addP(String message) {
		this.Pass=message;
	}
	public void addRP(String message) {
		this.Repass=message;
	}
	public void addPr(String message) {
		this.Priority=message;
	}
	
	//getters
	public String getF() {
		return this.Fname;
	}
	
	public String getL() {
		return this.Lname;
	}
	public String getE() {
		return this.Email;
	}
	public String getP() {
		return this.Pass;
	}
	public String getRP() {
		return this.Repass;
	}
	public String getPr() {
		return this.Priority;
	}
	public String getI() {
		return this.eid;
	}
	
	
	

}
