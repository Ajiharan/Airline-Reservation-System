 package dao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import service.LoginDao;

/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/AdminUpdate")
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdate() {
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
		Customer cus = new Customer();
		cus.addI(request.getParameter("fid"));
		cus.addF(request.getParameter("fname"));
		cus.addL(request.getParameter("lname"));
		cus.addE(request.getParameter("fmail"));
		cus.addP(request.getParameter("fpassword"));
		
		 String regx = "^[a-zA-Z]*$";
		String validEmail="^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
		LoginDao d1 = new LoginDao();
		d1.setConnection();
			boolean isCorrect = false;
			if(cus.getF().isEmpty()) {
				request.setAttribute("fnameError","*First Name is Mandatory*");
				isCorrect =true;
			}
			else if(cus.getF().matches(regx)==false) {
				request.setAttribute("fnameError","*First Name must be in Alphabet*");
				isCorrect =true;
			}
			else {
				request.setAttribute("fnameError"," ");
			}
			
			
			if(cus.getL().isEmpty()) {
				request.setAttribute("lnameError", "*Last Name is Mandatory*");
				isCorrect=true;
			}
			else if(cus.getL().matches(regx)==false) {
				request.setAttribute("lnameError", "*Last Name must be in Alphabet*");
				isCorrect =true;
			}
			else {
				request.setAttribute("lnameError", " ");
			}
			
			
			if(cus.getE().isEmpty()) {
				request.setAttribute("emailError","*Email_id is Mandatory*");
				isCorrect=true;
			}
			else if(cus.getE().matches(validEmail)==false)  {
				request.setAttribute("emailError","*Invalid Email_id*");
				isCorrect=true;
			}
			else if(d1.checkUpdateMail(cus.getE())) {
				System.out.println(cus.getE());
				isCorrect=true;
				request.setAttribute("emailError","*Email_id is already in use*");
				
			}
			else {
				request.setAttribute("emailError", " ");
			}
			
			
			
			if(cus.getP().isEmpty()) {
				request.setAttribute("PassError", "*Password is Mandatory*");
				isCorrect=true;
			}
			
			else {
				request.setAttribute("PassError"," ");
			}
			
			
			
			
			if(isCorrect) {
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/UpdateMember.jsp");
				request.setAttribute("CustomerObject", cus);
				
				dispatcher.forward(request, response);
			}
			else {
				
					if(d1.UpdateCustomer(cus.getI(),cus.getF(),cus.getL(),cus.getE(),cus.getP())) {
					RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/SelectMember.jsp");
				
					dispatcher.forward(request, response);
					}
					else {
						RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/UpdateMember.jsp");
						request.setAttribute("CustomerObject", cus);
						dispatcher.forward(request, response);
					}
			}
	}

}
