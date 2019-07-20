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
 * Servlet implementation class PasswordUpdate
 */
@WebServlet("/PasswordUpdate")
public class PasswordUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordUpdate() {
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
		Customer newcus = new Customer();
		newcus.addI(request.getParameter("myprid"));
		newcus.addP(request.getParameter("mypass"));
		newcus.addRP(request.getParameter("myrepass"));
		String new_Password=request.getParameter("mynewpass");
		LoginDao log = new LoginDao();
		
		String Old_Password= log.getPassword(newcus.getI());
		
		boolean isCorrect = false;
		if(newcus.getP().isEmpty()) {
			request.setAttribute("PassError", "*Password is Mandatory*");
			isCorrect=true;
		}
		else if(newcus.getP().equals(newcus.getRP())==false) {
			request.setAttribute("PassError", "*Password is Not match*");
			isCorrect=true;
		}
		else if(newcus.getP().equals(Old_Password)==false) {
			request.setAttribute("PassError", "*Incorrect Password*");
			isCorrect=true;
		}
		else {
			request.setAttribute("PassError"," ");
		}
		
		
		if(newcus.getRP().isEmpty()) {
			request.setAttribute("RePassError", "*Re_Password is Mandatory*");
			isCorrect=true;
		}
		else if(newcus.getRP().equals(newcus.getP())==false) {
			request.setAttribute("RePassError", "*Password is Not match*");
			isCorrect=true;
		}
		else if(newcus.getRP().equals(Old_Password)==false) {
			request.setAttribute("RePassError", "*Incorrect Password*");
			isCorrect=true;
		}
		else {
			request.setAttribute("RePassError"," ");
		}
		
		if(new_Password.isEmpty()) {
			request.setAttribute("NewPassError", "*Password is Mandatory*");
			isCorrect=true;
			
		}
		
		if(isCorrect) {
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/EditPassword.jsp");
			
			
			dispatcher.forward(request, response);
		}
		else {
			
			if(log.Customer_Password_Update(newcus.getI(), new_Password)) {
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('Password Changeed Successfully...!!!');");
				out.println("location='ViewProfile.jsp';");
				out.println("</script>");
		
			}
			
		}
		
		
	}

	

}
