package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import service.LoginDao;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		
		
		Book book1 = (Book)request.getSession().getAttribute("mybook");
	
		String holder=request.getParameter("fholder");
		String card=request.getParameter("fcard");
		String payment=request.getParameter("fpay");
		String date=request.getParameter("fcvc");
		String id=request.getParameter("id");
		LoginDao log=new LoginDao();
		if(log.Check_Payment(holder, card, date)) {
			if(log.addBook(id,book1)) {
				
				String book_id=log.getBook_id();
				
				if(log.add_pay(book_id, id, payment, card)) {
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('Booked Successfully...!!!');");
					out.println("location='MyNotification.jsp';");
					out.println("</script>");
				}
			}
			else {
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('Booked Failed...!!!');");
				out.println("location='Payment.jsp';");
				out.println("</script>");
			}
			
		}
		else {
			String pay_error="*Invalid cardNo/Holder Name/cvc*";
			response.sendRedirect("Payment.jsp?pay_error="+pay_error+"");
		}
		
	}

}
