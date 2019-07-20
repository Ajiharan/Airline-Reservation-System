package dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SelectEmployeeServlet
 */
@WebServlet("/SelectEmployeeServlet")
public class SelectEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String employee_Id=request.getParameter("employee_Id");
		
		HttpSession session=request.getSession();
		session.setAttribute("my_employee_id", employee_Id);
		response.sendRedirect("UpdateEmployee.jsp");
		
	}

}
