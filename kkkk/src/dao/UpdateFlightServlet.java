package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Flight;
import service.LoginDao;

/**
 * Servlet implementation class UpdateFlightServlet
 */
@WebServlet("/UpdateFlightServlet")
public class UpdateFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFlightServlet() {
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
		Flight flight=new Flight();
		String fli_id=request.getParameter("pflightid");
		flight.addflight_Name(request.getParameter("flight_name"));
		flight.addflight_Id(request.getParameter("flight_id"));
		flight.addDestination(request.getParameter("flight_destination"));
		flight.addStart_Point(request.getParameter("flight_start"));
		flight.addTime(request.getParameter("flight_time"));
		flight.addClassA(request.getParameter("flight_seatA"));
		flight.addClassB(request.getParameter("flight_seatB"));
		flight.addClassC(request.getParameter("flight_seatC"));
		flight.addPayment(request.getParameter("flight_payment"));
		System.out.println(flight.getClassA());
		LoginDao log = new LoginDao();
		if(log.updateFlightDetails(fli_id,flight)) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('update Successfully...!!!');");
			out.println("location='SelectFlight.jsp';");
			out.println("</script>");
			
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('update unSuccessfully...!!!');");
			out.println("location='UpdateFlight.jsp';");
			out.println("</script>");

			
		}
	}

}
