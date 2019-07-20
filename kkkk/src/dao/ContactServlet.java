package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Email;

import java.util.Properties;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
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
		
		String email=request.getParameter("myemail");
		String subject= request.getParameter("mysubject");
		String comment=request.getParameter("message");
		
		boolean isCorrect = true;
		if(email.isEmpty()) {
			isCorrect =false;
			request.setAttribute("error", "*Mail_Id is mandatory*");
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/contact.jsp");
			
			dispatcher.forward(request, response);
		}
		if(isCorrect) {
		
			Email mymail=new Email();
			if(mymail.getMail(email, subject, comment)) {
				
				
				
				String mydisplay="Message Sent Sucessfully";
				request.setAttribute("correct",mydisplay );
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/index.jsp");
				
				dispatcher.forward(request, response);
				
				
			}
			else {
				request.setAttribute("error", "*Invalid email_id*");
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/contact.jsp");
				
				dispatcher.forward(request, response);
				
			}
		}
		
		
		
	}

}
