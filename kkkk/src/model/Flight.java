package model;
import java.util.*;
//model class Flight
public class Flight {
	//private variables
	private String fid;
	private String flight_id;
	private String flight_Name;
	private String destination;
	private String start_Point;
	private String time;
	private String classA;
	private String classB;
	private String classC;
	private String payment;
	//public variables
	public  static String myflight_id;
	public static String flight_payment;
	
	public static ArrayList<Flight> myflightlist=new ArrayList<>();//arrayList
	
	//setters
	public void addfid(String fid) {
		this.fid = fid;
	}
	
	public void addflight_Id(String flight_Id) {
		this.flight_id =flight_Id;
	}
	
	public void addflight_Name(String flight_Name) {
		this.flight_Name=flight_Name;
	}
	public void addDestination(String destination) {
		this.destination=destination;
	}
	public void addStart_Point(String start_Point) {
		this.start_Point=start_Point;
	}
	
	public void addTime(String time) {
		this.time=time;
	}
	
	public void addClassA(String countA) {
		this.classA=countA;
	}
	public void addClassB(String countB) {
		this.classB=countB;
	}
	public void addClassC(String countC) {
		this.classC=countC;
	}
	public void addPayment(String payment) {
		this.payment=payment;
	}
	
	//getters
	public String getfid() {
		return this.fid;
	}
	public  String getflight_Id() {
		return this.flight_id;
	}
	public String getflight_Name() {
		return this.flight_Name;
	}
	public String getflight_destination() {
		return this.destination;
	}
	public String getStart_Point() {
		return this.start_Point;
	}
	public String getTime(){
		return this.time;
	}
	public String getClassA() {
		return this.classA;
	}
	public String getClassB() {
		return this.classB;
	}
	public String getClassC() {
		return this.classC;
	}
	public String getPayment() {
		return this.payment;
	}

}
