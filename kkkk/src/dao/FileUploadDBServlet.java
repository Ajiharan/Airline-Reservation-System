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
import util.AirlineSql;
 
@WebServlet("/FileUploadDBServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
	 // database connection settings
   
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
      String mes="*No profile Image Selected*";
         AirlineSql myair=new AirlineSql();
        InputStream inputStream = null; // input stream of the upload file
        
		String myid=request.getParameter("id");
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        boolean isTrue=false;
        if(request.getPart("photo").getSize()==0) {
        	isTrue=true;
        	response.sendRedirect("EditProfile.jsp?mes="+mes+"");
        }
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
	            String sql = "INSERT INTO profile (eid,photo) values (?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, myid);
	          
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(2, inputStream);
	            }
	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "File uploaded and saved into database";
	            }
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
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
	            request.setAttribute("Message", message);
	             
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/ViewProfile.jsp").forward(request, response);
	        }
        }
    }
}