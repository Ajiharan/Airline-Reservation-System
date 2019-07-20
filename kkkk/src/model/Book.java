package model;

//model class Book
public class Book {
	
	//abstraction 
	private String flight_name;
	private String from;
	private String to;
	private String Myname;
	private String SeatType;
	private String Arrival_Date;
	private String Country;
	private String Passport_No;
	public  static Book mybook=new Book();
	
	//setters
	public void addflight_name(String flight_name) {
		this.flight_name=flight_name;
	}
	
	public void addFrom(String from) {
		this.from=from;
	}
	
	public void addTo(String to) {
		this.to=to;
	}
	public void addName(String Myname) {
		this.Myname=Myname;
	}
	
	public void addSeatType(String SeatType) {
		this.SeatType=SeatType;
	}
	public void addArrival(String Arrival_Date) {
		this.Arrival_Date=Arrival_Date;
	}
	
	public void addCountry(String Country) {
		this.Country=Country;
	}
	public void addPassportNo(String Passport_No){
		this.Passport_No=Passport_No;
	}
	
	
	//getters
	
	public String getflight_name() {
		 return this.flight_name;
	}
	
	public String getFrom() {
		 return this.from;
	}
	
	public String getTo() {
		 return this.to;
	}
	public String getName() {
		 return this.Myname;
	}
	
	public String getSeatType() {
		 return this.SeatType;
	}
	public String getArrival() {
		 return this.Arrival_Date;
	}
	
	public String getCountry() {
		 return this.Country;
	}
	public String getPassportNo(){
		 return this.Passport_No;
	}
}
