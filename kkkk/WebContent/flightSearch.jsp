<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="service.LoginDao" %>
    <%@page import="service.IAirlineInterface"%>
<%@page import="model.Customer"%>
<%@page import="model.Flight"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
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
	<div class="row">
		
		<div class="col-sm-12">
		
		
			
							
		<% IAirlineInterface face1=new LoginDao();
		ArrayList<Flight> list=(ArrayList)session.getAttribute("myArraylist");
						if(list.size() > 0){int count=list.size();%>	
						<h4 class="text-center text-warning">Search Results <%=count %> found</h4>
					<table class="table table-hover ">
						<thead>
							<tr class="success">
							
								
								<th>From</th>
								<th>To</th>
								<th>ArrivalTime</th>
								<th>View Details</th>
							</tr>
						</thead>
						<tbody>
					
		
						<% for(Flight myflight:list){
						 %>
							
							<tr>
								
								
								<td><%=myflight.getStart_Point() %></td>
								<td><%=myflight.getflight_destination() %></td>
								<td><%=myflight.getTime() %></td>
								
								<td><form method="post" action="BookingServlet"><input type="submit" class="btn btn-success" value="Select">
								<input type="hidden" name="Flight_Id" value="<%= myflight.getfid()%>"/></form></td>
							</tr>
						<% }
						
						}else{%> <h3 class="text-center text-success">No results Found</h3><%  }%>
						</tbody>
					</table>
			
		</div>
		
	
	</div>

</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>