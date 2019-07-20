<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="model.Customer" %>
     <%@page import="service.LoginDao" %>
<%@page import="model.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.IAirlineInterface"%>
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
<title>Admin console</title>
</head>
<body>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myids")==null){
		 response.sendRedirect("Login.jsp");
	}



%>

<%

Customer emp=(Customer)request.getAttribute("Objects");
%>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
		<div class="col-lg-12">
				<h2 class="page-header text-center">Delete Flight</h2>
			
			</div>
			<div class="col-md-3">
			<ul class="navbar nav navbar-default">
					<li><a href="#lists" data-toggle="collapse"><i class="fas fa-user"></i> Members</a>
						<ul class="nav collapse" id="lists">
							<li><a href="AddMember.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Members</a></li>
							<li><a href="DeleteMember.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Members</a></li>
							<li><a href="SelectMember.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Members</a></li>
						</ul>
					</li>
					<li><a href="#lists1" data-toggle="collapse"><i class="fa fa-plane"></i> Flight</a>
						<ul class="nav collapse" id="lists1">
								<li><a href="AddFlight.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Flight</a></li>
								<li><a href="DeleteFlight.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Flight</a></li>
								<li><a href="SelectFlight.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Flight</a></li>
						</ul>
					</li>
					<li><a href="#lists2" href="#lists1" data-toggle="collapse"><i class="fa fa-suitcase"></i> Employee</a>
					
					<ul class="nav collapse" id="lists2">
								<li><a href="AddEmployee.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Employee</a></li>
								<li><a href="DeleteEmployee.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Employee</a></li>
								<li><a href="SelectEmployee.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Employee</a></li>
					</ul>
					
					</li>
					<li><a href="#"><i class="fas fa-desktop"></i>Notification</a></li>
					
				</ul>
			</div>
			<div class="col-md-9">
			
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
						
		<% IAirlineInterface face1=new LoginDao();
						
						ArrayList<Flight> list=face1.getFlightDetails();
						for(Flight myflight:list){
						 %>
							
							<tr>
								
								
								<td><%=myflight.getStart_Point() %></td>
								<td><%=myflight.getflight_destination() %></td>
								<td><%=myflight.getTime() %></td>
								
								<td><form method="post" action="DeleteFlightServlet"><input type="submit" class="btn btn-danger" value="delete">
								<input type="hidden" name="Flight_Id" value="<%= myflight.getfid()%>"/></form></td>
							</tr>
						<% }%>
						</tbody>
					</table>
			
	
			</div>
			
		</div>
	
	</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>