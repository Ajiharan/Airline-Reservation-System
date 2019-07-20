<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="service.LoginDao" %>
    <%@page import="service.IAirlineInterface"%>
<%@page import="model.Customer"%>
<%@page import="model.Flight"%>
<%@page import="model.Book" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel = "stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel = "stylesheet" type="text/css" href="css/nav.css">
		<link rel = "stylesheet" type="text/css" href="fontss/css/all.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 
		  
		
<title>Insert title here</title>
</head>

<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
String getid=(String)session.getAttribute("myid");
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myid")==null){
		 response.sendRedirect("Login.jsp");
	}



%>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
	<h2 class="page-header text-center text-success">Booked Tickets</h2>
	<% IAirlineInterface air=new LoginDao();
					ArrayList<Book> list = air.getNotification(getid);
					Collections.reverse(list);
					
					for(Book book:list){
						
					
					
				%>
		<div class="row">
			
			
			<div class="col-md-3"></div>
			
			<div class="col-md-6 well">
				
				<h3 class="page-header">Ticket Details</h3>
				<p>Customer Name :<%=book.getName() %> </p>
				<p>Passport Number :<%=book.getPassportNo() %>
				<p>Arrival Date :<%=book.getArrival() %>
				<p>Country : <%=book.getCountry() %>
			
			
			
			
			</div>
			
			<div class="col-md-3"></div>
		
		</div>
<%} %>
	</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>