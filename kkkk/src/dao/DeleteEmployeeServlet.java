package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.LoginDao;

/**
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
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
		String emp_id=request.getParameter("employee_Id");
		
		LoginDao log = new LoginDao();
		if(log.deleteEmployees(emp_id)) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('Delete Successfully...!!!');");
			out.println("location='DeleteEmployee.jsp';");
			out.println("</script>");
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('Delete unSuccessfull...!!!');");
			out.println("location='DeleteEmployee.jsp';");
			out.println("</script>");
		}
	}

}
