package service;
//Interface 
import java.util.ArrayList;

import model.Book;
import model.Customer;
import model.Employee;
import model.Flight;
import model.Feedback;


public interface IAirlineInterface {
	//public functions
	public void setConnection();
	public boolean check(String uemail,String pass);
	public boolean checkMail(String uemail);
	public boolean checkUpdateMail(String uemail);
	public boolean addDetails(String fname,String lname,String email,String password);
	public boolean chekAdmin(String uemail,String password);
	public ArrayList<Customer> getCustomers();
	public boolean deleteMember(String eid);
	public Customer UpdateDetails(String CustomerId);
	public boolean UpdateCustomer(String eid,String fname,String lname,String email,String password);
	public Customer getDetails(String CustomerId);
	public boolean CustomerUpdate(String eid,String fname,String lname);
	public Customer getCustomer();
	public ArrayList<Flight> getFlightDetails();
	public ArrayList<Flight> getSearchDetails(String name);
	public boolean CheckBook_Details(String name,String country,String passport_no);
	public boolean Check_Payment(String name,String card,String cvc);
	public boolean addBook(String id,Book book1);
	public String getBook_id();
	public boolean add_pay(String book_id,String cus_id,String pay_amount,String card_no);
	public boolean deleteFlight(String flight_id);
	public ArrayList<Book> getNotification(String mycus_id);
	public boolean updateFlightDetails(String fli_id,Flight flight);
	public boolean addEmployee_Details(Employee employee);
	public ArrayList<Employee>getEmployeDetails();
	public boolean deleteEmployees(String emp_id);
	public boolean addFeedback(Feedback feed,String cus_id);
}
