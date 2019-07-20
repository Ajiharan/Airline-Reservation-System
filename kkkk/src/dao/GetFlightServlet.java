package dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Flight;

import java.util.*;
import service.LoginDao;

/**
 * Servlet implementation class GetFlightServlet
 */
@WebServlet("/GetFlightServlet")
public class GetFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flight_id =request.getParameter("Flight_Id");
		
		LoginDao log=new LoginDao();
		ArrayList<Flight>list=log.getFlightDetails();
		
		HttpSession session=request.getSession();
		session.setAttribute("get_flight", list);
		session.setAttribute("flid", flight_id);
		response.sendRedirect("UpdateFlight.jsp");
	}

}
