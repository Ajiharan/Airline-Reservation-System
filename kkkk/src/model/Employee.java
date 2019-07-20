package model;

//model calss Employee
public class Employee {
	//abstraction 
	private String eid;
	private String name;
	
	private String Email;
	
	private String address;
	private String job;
	
	
	//setters
	public void addname(String message) {
		this.name=message;
	}
	
	public void addemployeeEid(String message) {
		this.eid=message;
	}
	
	public void addEmail(String message) {
		this.Email=message;
	}
	
	public void addAddress(String message) {
		this.address=message;
	}
	public void addJob(String message) {
		this.job=message;
	}
	
	//getters
	public String getname() {
		return this.name;
	}
	
	
	public String getEmail() {
		return this.Email;
	}
	
	public String geteid() {
		return this.eid;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public String getJob() {
		return this.job;
	}

}
