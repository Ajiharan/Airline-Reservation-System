package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import service.LoginDao;

import model.Flight;
import util.AirlineSql;

/**
 * Servlet implementation class AddFlightServlet
 */
@WebServlet("/AddFlightServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		Flight flight=new Flight();
		flight.addflight_Name(request.getParameter("flight_name"));
		flight.addflight_Id(request.getParameter("flight_id"));
		flight.addDestination(request.getParameter("flight_destination"));
		flight.addStart_Point(request.getParameter("flight_start"));
		flight.addTime(request.getParameter("flight_time"));
		flight.addClassA(request.getParameter("flight_seatA"));
		flight.addClassB(request.getParameter("flight_seatB"));
		flight.addClassC(request.getParameter("flight_seatC"));
		flight.addPayment(request.getParameter("flight_payment"));
		
	         AirlineSql myair=new AirlineSql();
	        InputStream inputStream = null; // input stream of the upload file
	        
		
	         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("photos");
	        boolean isTrue=false;
	       
	        if(!isTrue) {
	        	
	       
		        if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType());
		             
		            // obtains input stream of the upload file
		            inputStream = filePart.getInputStream();
		        }
		         
		        Connection conn = null; // connection to the database
		        String message = null;  // message will be sent back to client
		         
		        try {
		            // connects to the database
		            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		            conn = DriverManager.getConnection( myair.url, myair.username, myair.password);
		 
		            // constructs SQL statement
		            String sql = "insert into flight(flight_id,flightname,destination,start_point,arrival_time,classA_seats,classB_seats,classC_seats,booking_payment,photo) values(?,?,?,?,?,?,?,?,?,?)"; 
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setString(1, flight.getflight_Id());
		            statement.setString(2, flight.getflight_Name());
		            statement.setString(3, flight.getflight_destination());
		            statement.setString(4, flight.getStart_Point());
		            statement.setString(5, flight.getTime());
		            statement.setString(6, flight.getClassA());
		            statement.setString(7, flight.getClassB());
		            statement.setString(8, flight.getClassC());
		            statement.setString(9, flight.getPayment());
		          
		            if (inputStream != null) {
		                // fetches input stream of the upload file for the blob column
		                statement.setBlob(10, inputStream);
		            }
		 
		            // sends the statement to the database server
		            int row = statement.executeUpdate();
		            if (row > 0) {
		                message = "File uploaded and saved into database";
		                response.sendRedirect("WelcomeUser.jsp");
		            }
		        } catch (SQLException ex) {
		            message = "ERROR: " + ex.getMessage();
		            System.out.println(message);
		            ex.printStackTrace();
		        } finally {
		            if (conn != null) {
		                // closes the database connection
		                try {
		                	 System.out.println(inputStream);
		                    conn.close();
		                } catch (SQLException ex) {
		                    ex.printStackTrace();
		                    
		                }
		            }
		            // sets the message in request scope
		            
		        }
	        }
	}

}
