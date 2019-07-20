package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Employee;
import service.LoginDao;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
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
	Employee emp =new Employee();
		
		emp.addAddress(request.getParameter("eaddress"));
		emp.addEmail(request.getParameter("email_id"));
		emp.addJob(request.getParameter("ejob"));
		emp.addname(request.getParameter("ename"));
		emp.addemployeeEid(request.getParameter("my_emp_id"));
		
		LoginDao log =new LoginDao();
		
		if(log.update_EmployeeDetails(emp)) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('Update Successfully...!!!');");
			out.println("location='Admin.jsp';");
			out.println("</script>");
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('update unsccessfull...!!!');");
			out.println("location='UpdateEmployee.jsp';");
			out.println("</script>");
			
			
			
		}
		
	}

}
