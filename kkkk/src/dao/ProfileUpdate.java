package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import service.LoginDao;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet("/ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdate() {
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
		Customer cus1 = new Customer();
	
		cus1.addF(request.getParameter("fname"));
		cus1.addL(request.getParameter("lname"));
		cus1.addI(request.getParameter("fid"));
	
		 String regx = "^[a-zA-Z]*$";
	
		LoginDao d1 = new LoginDao();
		d1.setConnection();
			boolean isCorrect = false;
			if(cus1.getF().isEmpty()) {
				request.setAttribute("fnameError","*First Name is Mandatory*");
				isCorrect =true;
			}
			else if(cus1.getF().matches(regx)==false) {
				request.setAttribute("fnameError","*First Name must be in Alphabet*");
				isCorrect =true;
			}
			else {
				request.setAttribute("fnameError"," ");
			}
			
			
			if(cus1.getL().isEmpty()) {
				request.setAttribute("lnameError", "*Last Name is Mandatory*");
				isCorrect=true;
			}
			else if(cus1.getL().matches(regx)==false) {
				request.setAttribute("lnameError", "*Last Name must be in Alphabet*");
				isCorrect =true;
			}
			else {
				request.setAttribute("lnameError", " ");
			}
			
			
			
			if(isCorrect) {
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/EditProfile.jsp");
							
				dispatcher.forward(request, response);
			}
			else {
				
					if(d1.CustomerUpdate(cus1.getI(),cus1.getF(),cus1.getL())) {
						
						PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('Changeed Successfully...!!!');");
						out.println("location='ViewProfile.jsp';");
						out.println("</script>");
				
					}
					else {
						RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/EditProfile.jsp");
						
						dispatcher.forward(request, response);
					}
			}
	}

}
