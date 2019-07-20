package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Book;
import model.Customer;
import model.Employee;
import model.Feedback;
import model.Flight;
import service.IAirlineInterface;
import util.AirlineSql;

//class LoginDao Implement IAirlineInterface
public class LoginDao implements IAirlineInterface {
	
	
	
	//initialize private and public variables
	private AirlineSql s1;
	public Connection mycon;
	private String myid;
	public static String my_newid;
	public static String myids;
	private static  String myemail;
	public  Customer mycus;
	
	//DB connection
	public void setConnection() {
		
		s1 = new  AirlineSql();
		try {
			Class.forName(s1.connect);
			Connection con=DriverManager.getConnection(s1.url,s1.username,s1.password);
			mycon = con;
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

	
	//getters
	public Customer getCustomer() {
		return mycus;
	}
	
	
	public boolean CheckBook_Details(String name,String country,String passport_no) {
		setConnection();//set Connection
		try {
			PreparedStatement st=mycon.prepareStatement("select * from passport where Name=? and passport=? and country=?");
			st.setString(1,name );
			st.setString(2,passport_no);
			st.setString(3, country);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	//check email that  already in DB
	public boolean check(String uemail,String pass) {
		
		
			try {
				PreparedStatement st=mycon.prepareStatement(s1.sql);
				//set String method
				st.setString(1,uemail );
				st.setString(2,pass);
				ResultSet rs=st.executeQuery();
				if(rs.next()) {
					//get values from DB
					myid=rs.getString(1);
					my_newid=rs.getString(1);
					
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		return false;
	}
	
	
	//update flight details
	public boolean updateFlightDetails(String fli_id,Flight flight) {
		setConnection();//set connection

		try {
			PreparedStatement st=mycon.prepareStatement("update flight set flight_id=?,flightname=?,destination=?,start_point=?,arrival_time=?,classA_seats=?,classB_seats=?,classC_seats=?,booking_payment=? where fid=?");
			st.setString(1,flight.getflight_Id());
			st.setString(2,flight.getflight_Name());
			st.setString(3, flight.getflight_destination());
			st.setString(4, flight.getStart_Point());
			st.setString(5, flight.getTime());
			st.setString(6, flight.getClassA()+"");
			st.setString(7, flight.getClassB()+"");
			st.setString(8, flight.getClassC()+"");
			st.setString(9, flight.getPayment()+"");
			st.setString(10, fli_id);
			st.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			return false;
		}
		
		
	}
	
	
	//get max book id for perticular customer
	public String getBook_id() {
		setConnection();
		String mysql="Select * from book where book_id=(select max(book_id) from book)";
		try {
			PreparedStatement st=mycon.prepareStatement(mysql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				
				return rs.getString(1);
	
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "false";
	}
	
	//add payment details in DB
	
	public boolean add_pay(String book_id,String cus_id,String pay_amount,String card_no) {
		setConnection();
		try {
			String mysql="insert into payment(book_id,cus_id,pay_amount,card_no) values(?,?,?,?)";
			PreparedStatement st=mycon.prepareStatement(mysql);
			
			st.setString(1,book_id);
			st.setString(2, cus_id);
			st.setString(3,	pay_amount);
			st.setString(4, card_no);
		
			
			int rowsAffected=st.executeUpdate();
			
			if(rowsAffected > 0) {
				
				return true;
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//Add feedback details in DB
	public boolean addFeedback(Feedback feed,String cus_id) {
		
		setConnection();
		try {
			String mysql="insert into feedback(cus_id,comment,email_id) values(?,?,?)";
			PreparedStatement st=mycon.prepareStatement(mysql);
			
			st.setString(1,cus_id);
			st.setString(2, feed.getComment());
			st.setString(3,	feed.getEmail_id());
			
		
			
			int rowsAffected=st.executeUpdate();
			
			if(rowsAffected > 0) {
				
				return true;
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//Add book details in DB
	public boolean addBook(String id,Book book1) {
		setConnection();
		
		try {
			String mysql="insert into  book(cus_id,flight_name,start_point,destination,full_name,seat_type,arrival_date,country,Passport_number) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement st=mycon.prepareStatement(mysql);
			
			st.setString(1,id);
			st.setString(2, book1.getflight_name());
			st.setString(3,	book1.getFrom());
			st.setString(4, book1.getTo());
			st.setString(5, book1.getName());
			st.setString(6, book1.getSeatType());
			st.setString(7, book1.getArrival());
			st.setString(8, book1.getCountry());
			st.setString(9, book1.getPassportNo());
			
			int rowsAffected=st.executeUpdate();
			
			if(rowsAffected > 0) {
				
				return true;
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//get password from DB from particular customer Id
	public String getPassword(String id) {
		setConnection();
		
		try {
			PreparedStatement st=mycon.prepareStatement(s1.PASS_GET);
			st.setString(1, id);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				
				return rs.getString(5);
	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "false";
	}
	
	//add Employee details in DB
	public boolean addEmployee_Details(Employee emp) {
		
		setConnection();
		try {
			
			String mysql="insert into  employee(name,address,job,email_id) values(?,?,?,?)";
			PreparedStatement st=mycon.prepareStatement(mysql);
			st.setString(1, emp.getname());
			st.setString(2, emp.getAddress());
			st.setString(3, emp.getJob());
			st.setString(4, emp.getEmail());
			
			int rowsAffected=st.executeUpdate();
			
			//if data insert in DB--->return true
			if(rowsAffected > 0) {
				
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//get customer details
	public Customer getDetails(String CustomerId) {
		setConnection();
		
		Customer cus=new Customer();
		
		
		try {
			PreparedStatement st=mycon.prepareStatement(s1.selMember);
			st.setString(1, CustomerId);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				
				cus.addI(rs.getString(1) + "");
				cus.addF(rs.getString(2));
				cus.addL(rs.getString(3));
				cus.addE(rs.getString(4));
				cus.addP(rs.getString(5));
				cus.addPr(rs.getString(6) + "");
			
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mycus=cus;
		return cus;
	}
	
	//update customer details
	public Customer UpdateDetails(String CustomerId) {
		
		setConnection();
		
		Customer cus=new Customer();
		
		
		try {
			PreparedStatement st=mycon.prepareStatement(s1.selMember);
			st.setString(1, CustomerId);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				
				cus.addI(rs.getString(1) + "");
				cus.addF(rs.getString(2));
				cus.addL(rs.getString(3));
				cus.addE(rs.getString(4));
				cus.addP(rs.getString(5));
				cus.addPr(rs.getString(6) + "");
				myemail=rs.getString(4);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cus;
}
	
	//update customer password(reset password)
	public boolean Customer_Password_Update(String uid,String password) {
		
		setConnection();
		
		try {
			PreparedStatement st = mycon.prepareStatement(s1.PASS_UPD);
			st.setString(1, password);
			st.setString(2, uid);
			st.executeUpdate();
			return true;
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//update customer details
	public boolean CustomerUpdate(String eid,String fname,String lname) {
		setConnection();
		try {
			PreparedStatement st = mycon.prepareStatement(s1.empUpdate);
			st.setString(1, fname);
			st.setString(2, lname);
			
			st.setString(3,eid);
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//update Customer details
	public boolean UpdateCustomer(String eid,String fname,String lname,String email,String password) {
		setConnection();
		
		try {
			PreparedStatement st = mycon.prepareStatement(s1.selUpdate);
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, email);
			st.setString(4, password);
			st.setString(5,eid);
			st.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	//check validity payment
	public boolean Check_Payment(String name,String card,String cvc) {
		setConnection();
		try {
			PreparedStatement st=mycon.prepareStatement("select * from card where name=? and card_no=? and cvc=?");
			st.setString(1,name );
			st.setString(2,card);
			st.setString(3,cvc);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//list Employee details using collection(ArrayList)
	public ArrayList<Employee>getEmployeDetails(){
		
		ArrayList<Employee> list=new ArrayList<Employee>();
		setConnection();
		try {
			Statement st=mycon.createStatement();
			ResultSet rs=st.executeQuery("select * from employee");
			while(rs.next()) {
				Employee emp=new Employee();
				emp.addemployeeEid(rs.getString(1));
				emp.addname(rs.getString(2));
				emp.addAddress(rs.getString(3));
				emp.addJob(rs.getString(4));
				emp.addEmail(rs.getString(5));
				list.add(emp);//add employee object
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	//update Employee details
	public boolean update_EmployeeDetails(Employee emp) {
		setConnection();
		String emp_id=emp.geteid();
		try {
			PreparedStatement st=mycon.prepareStatement("update employee  set name=?,address=?,job=?,email_id=? where emp_id=?");
			
			st.setString(1, emp.getname());
			st.setString(2, emp.getAddress());
			st.setString(3, emp.getJob());
			st.setString(4, emp.getEmail());
			st.setString(5, emp.geteid());
			st.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			return false;
		}
	}
	
	//delete employee details
	public boolean deleteEmployees(String emp_id) {
		setConnection();
		if(!emp_id.isEmpty() &&emp_id !=null) {
			try {
					PreparedStatement st=mycon.prepareStatement("delete from employee where emp_id=?");
					st.setString(1, emp_id);
					st.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		return false;
		
		
		
	}
	//list Flight details using ArrayList
	public ArrayList<Flight> getFlightDetails(){
		
		setConnection();
		ArrayList<Flight> mylist=new ArrayList<>();
		try {
			Statement st=mycon.createStatement();
			ResultSet rs=st.executeQuery(s1.GET_FLIGHT);
			while(rs.next()) {
				Flight flight=new Flight();
				flight.addfid(rs.getString(1)+"");
				flight.addflight_Id(rs.getString(2));
				flight.addflight_Name(rs.getString(3));
				flight.addDestination(rs.getString(4));
				flight.addStart_Point(rs.getString(5));
				flight.addTime(rs.getString(6));
				flight.addClassA(rs.getString(7)+"");
				flight.addClassB(rs.getString(8)+"");
				flight.addClassC(rs.getString(9)+"");
				flight.addPayment(rs.getString(10));
				mylist.add(flight);//Add flight object to ArrayList
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mylist;
	}
	//list Customer Details uing ArrayList
	public ArrayList<Customer> getCustomers(){
		setConnection();
		ArrayList<Customer>list=new ArrayList();
		
		
		
		try {
			Statement st=mycon.createStatement();
			ResultSet rs=st.executeQuery(s1.sqlSelect);
			while(rs.next()) {
				Customer cus=new Customer();
				cus.addI(rs.getString(1) + "");
				cus.addF(rs.getString(2));
				cus.addL(rs.getString(3));
				cus.addE(rs.getString(4));
				cus.addP(rs.getString(5));
				cus.addPr(rs.getString(6) + "");
				list.add(cus);//Add customer object 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//Search destination
	public ArrayList<Flight>getSearchDetails(String name){
		setConnection();
		String myquery="select * from flight where destination LIKE '" + name + "%" + "'";
		ArrayList<Flight>searchList = new ArrayList<>();
		try {
			Statement st=mycon.createStatement();
			ResultSet rs=st.executeQuery(myquery);
			while(rs.next()) {
				Flight flight=new Flight();
				flight.addfid(rs.getString(1)+"");
				flight.addflight_Id(rs.getString(2));
				flight.addflight_Name(rs.getString(3));
				flight.addDestination(rs.getString(4));
				flight.addStart_Point(rs.getString(5));
				flight.addTime(rs.getString(6));
				flight.addClassA(rs.getString(7)+"");
				flight.addClassB(rs.getString(8)+"");
				flight.addClassC(rs.getString(9)+"");
				flight.addPayment(rs.getString(11));
				searchList.add(flight);
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return searchList;
	}
	
	//get all notifications from a particular customer_id
public ArrayList<Book> getNotification(String mycus_id){
		
		setConnection();
		
		ArrayList<Book> list=new ArrayList<Book>();
		
		
		try {
			PreparedStatement st=mycon.prepareStatement(s1.GET_NOT);
			st.setString(1,mycus_id );
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				Book book=new Book();
				book.addflight_name(rs.getString(3));
				book.addArrival(rs.getString(8));
				book.addCountry(rs.getString(9));
				book.addPassportNo(rs.getString(10));
				book.addName(rs.getString(6));
				book.addFrom(rs.getString(4));
				book.addTo(rs.getString(5));
				list.add(book);
			}
			
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//delete flight Details
	public boolean deleteFlight(String flight_id) {
		
		
		setConnection();
		if(!flight_id.isEmpty() &&flight_id !=null) {
			try {
					PreparedStatement st=mycon.prepareStatement(s1.DEL_FLIGHT);
					st.setString(1, flight_id);
					st.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		return false;
	}
	
	//delete particular Member
	public boolean deleteMember(String eid) {
		setConnection();
		if(!eid.isEmpty() && eid !=null) {
			try {
					PreparedStatement st=mycon.prepareStatement(s1.delMember);
					st.setString(1, eid);
					st.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		return false;
		
		
	}
	
	//check Admin email_id when login to the System
	public boolean chekAdmin(String uemail,String password) {
		try {
			PreparedStatement st=mycon.prepareStatement(s1.AdminSql);
			st.setString(1, uemail);
			st.setString(2, password);
			st.setString(3, "0");
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				myid=rs.getString(1);
				myids=rs.getString(1);
				 my_newid=rs.getString(1);
				myemail=rs.getString(4);
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	//check mail_id
	public boolean checkMail(String uemail) {
		try {
			PreparedStatement st=mycon.prepareStatement(s1.regsql);
			st.setString(1,uemail );
			
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				myid=rs.getString(1);
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//check when Update mail address
	public boolean checkUpdateMail(String uemail) {
		try {
			PreparedStatement st=mycon.prepareStatement(s1.regsql);
			st.setString(1,uemail );
			
			ResultSet rs=st.executeQuery();
			if(rs.next() ) {
				myid=rs.getString(1);
				if(myemail.equals(uemail)) {
					return false;
				}
			
				return true;
			}
			this.myemail=uemail;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	//customer register details
	
	public boolean addDetails(String fname,String lname,String email,String password) {
		setConnection();
		try {
			
			String mysql="insert into  register(firstname,lastname,email_id,password) values(?,?,?,?)";
			PreparedStatement st=mycon.prepareStatement(mysql);
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, email);
			st.setString(4, password);
			
			int rowsAffected=st.executeUpdate();
			
			if(rowsAffected > 0) {
				myemail=email;
				return true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	
	//getters
	public String getId() {
		return myid;	
	}
	
	public String getIds() {
		return myids;	
	}
	
	public String getEmail() {
		return myemail;
	}
	

}
