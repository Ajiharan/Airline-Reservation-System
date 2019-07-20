package dao;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Book;
import model.Flight;
import service.LoginDao;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
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
		Book book=new Book();
		book.addflight_name(request.getParameter("flight_name"));
		book.addFrom(request.getParameter("flight_start"));
		book.addTo(request.getParameter("flight_destination"));
		book.addName(request.getParameter("fname"));
		book.addSeatType(request.getParameter("ftype"));
		book.addArrival(request.getParameter("fdate"));
		book.addCountry(request.getParameter("fcountry"));
		book.addPassportNo(request.getParameter("fpassport"));
		
		
		int cus_id=Integer.parseInt(request.getParameter("cid"));
		String myflight_pay=request.getParameter("fpay");
		
		LoginDao log=new LoginDao();
		
		if(log.CheckBook_Details(book.getName(), book.getCountry(), book.getPassportNo())) {
			
			HttpSession session=request.getSession();
			session.setAttribute("mybook", book);
			session.setAttribute("myflight_pay", myflight_pay);
			response.sendRedirect("Payment.jsp");
		}
		else {
			String book_error="*Invalid Name/Passport_no/Country*";
			response.sendRedirect("flightBook.jsp?book_error="+book_error+"");
		}
		
	}

}
