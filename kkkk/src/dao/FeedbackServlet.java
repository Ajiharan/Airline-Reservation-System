package dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Feedback;
import service.LoginDao;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
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
		String cus_id=request.getParameter("cu_id");
		Feedback feed=new Feedback();
		feed.setComment(request.getParameter("message"));
		feed.setEmail(request.getParameter("myemail"));
		LoginDao log = new LoginDao();
		if(log.addFeedback(feed, cus_id)) {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('Add Successfully...!!!');");
			out.println("location='index.jsp';");
			out.println("</script>");
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert(' Unsuccessfull...!!!');");
			out.println("location='feedback.jsp';");
			out.println("</script>");
		}
	}

}
