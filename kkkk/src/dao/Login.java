package dao;



import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.*;

import model.Customer;
import service.LoginDao;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static HttpSession mysession;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email =request.getParameter("uemail");
		String password=request.getParameter("fpass");
		
		
			PrintWriter out=response.getWriter();
			LoginDao d1 = new LoginDao();
			d1.setConnection();
			
			//check admin
			if(d1.chekAdmin(email, password)) {
				HttpSession session=request	.getSession();
				String id=d1.getId();
				String ids=d1.getIds();
				session.setAttribute("myid", id);
				session.setAttribute("myids", ids);
				response.sendRedirect("Admin.jsp?id="+ids+"");
				
			}
			
			//check user
			else if(d1.check(email, password)) {
				HttpSession session=request	.getSession();
				
				String id=d1.getId();
				
				session.setAttribute("myid", id);
				
				 this.mysession=session;
				response.sendRedirect("WelcomeUser.jsp?id="+id+"");
			}
			else if(email.isEmpty() || password.isEmpty()) {
				String error="Some Fields are Empty Please Fill It";
				response.sendRedirect("Login.jsp?name="+error+"");
			}
			else {
				
				String error="Invalid Email_id/Password";
				response.sendRedirect("Login.jsp?name="+error+"");
			}
		
		
		
		
		
		
	}

}
