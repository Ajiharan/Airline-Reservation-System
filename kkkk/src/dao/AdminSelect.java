package dao;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;

import service.IAirlineInterface;
import service.LoginDao;

/**
 * Servlet implementation class AdminSelect
 */
@WebServlet("/AdminSelect")
public class AdminSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelect() {
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
		
		String CustomerId=request.getParameter("CustomerID");
		IAirlineInterface line1=new LoginDao();
		Customer cus=line1.UpdateDetails(CustomerId);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/UpdateMember.jsp");
		request.setAttribute("CustomerObject", cus);
		dispatcher.forward(request, response);
		
	}

}
