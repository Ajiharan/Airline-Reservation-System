package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import service.LoginDao;

/**
 * Servlet implementation class AdminAdd
 */
@WebServlet("/AdminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdd() {
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
		cus.addF(request.getParameter("fname"));
		cus.addL(request.getParameter("lname"));
		cus.addE(request.getParameter("fmail"));
		cus.addP(request.getParameter("fpassword"));
		cus.addRP(request.getParameter("refpassword"));
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
			else if(d1.checkMail(cus.getE())) {
				
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
			else if(cus.getP().equals(cus.getRP())==false) {
				request.setAttribute("PassError", "*Password is Not match*");
				isCorrect=true;
			}
			else {
				request.setAttribute("PassError"," ");
			}
			
			
			if(cus.getRP().isEmpty()) {
				request.setAttribute("RePassError", "*Re_Password is Mandatory*");
				isCorrect=true;
			}
			else if(cus.getRP().equals(cus.getP())==false) {
				request.setAttribute("RePassError", "*Password is Not match*");
				isCorrect=true;
			}
			else {
				request.setAttribute("RePassError"," ");
			}
			
			
			if(isCorrect) {
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/AddMember.jsp");
				request.setAttribute("Objects", cus);
				dispatcher.forward(request, response);
			}
			else {
				
					if(d1.addDetails(cus.getF(),cus.getL(),cus.getE(),cus.getP())) {
					
					HttpSession session =request.getSession();
					session.setAttribute("myObject", cus);
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('Changeed Successfully...!!!');");
					out.println("location='Admin.jsp';");
					out.println("</script>");
			
					}
					else {
						RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/AddMember.jsp");
						request.setAttribute("Objects", cus);
						dispatcher.forward(request, response);
					}
			}
		
	}

}
