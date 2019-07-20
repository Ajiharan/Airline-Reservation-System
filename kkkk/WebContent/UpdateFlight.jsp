<%@page import="service.IAirlineInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="service.LoginDao" %>
<%@page import="model.Customer"%>
<%@page import='model.Flight' %>
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
<title>Admin console</title>
</head>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myids")==null){
		 response.sendRedirect("Login.jsp");
	}



%>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
		<div class="col-lg-12">
				<h2 class="page-header text-center">Update Flight</h2>
			
			
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
				<div class="row">
				
				<%String fl_id=(String)session.getAttribute("flid"); %>
				
				
				<%ArrayList<Flight> list=(ArrayList<Flight>)session.getAttribute("get_flight"); %>
					
				<%for(Flight flight:list){ if(flight.getfid().equals(fl_id)){ %>
				<form action="UpdateFlightServlet" method="post" class="form-horizontal">
					
					
					 
				
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fas fa-plane"></i> Flight id</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_id" class="form-control" value="<%=flight.getflight_Id()%>" required>
					<input type="hidden" name="pflightid" value="<%=fl_id%>">
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>   
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-plane" aria-hidden="true"></i> Flight Name</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_name" class="form-control" value="<%=flight.getflight_Name() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>    	
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-map-marker" aria-hidden="true"></i> Destination</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_destination" class="form-control" value="<%=flight.getflight_destination() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>   
				
				
				
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fas fa-location-arrow"></i> Start Point</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_start" class="form-control" value="<%=flight.getStart_Point() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-clock-o" aria-hidden="true"></i> Arrival Time</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_time" class="form-control" value="<%=flight.getTime() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fas fa-chair"></i> ClassA Seats</label>	 
					<div class="col-sm-6">
					<input type="number" name="flight_seatA" class="form-control" value="<%=flight.getClassA() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fas fa-chair"></i> ClassB Seats</label>	 
					<div class="col-sm-6">
					<input type="number" name="flight_seatB" class="form-control" value="<%=flight.getClassB() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fas fa-chair"></i> ClassC Seats</label>	 
					<div class="col-sm-6">
					<input type="number" name="flight_seatC" class="form-control" value="<%=flight.getClassC() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div> 
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-cc-visa"></i> Book Payment</label>	 
					<div class="col-sm-6">
					<input type="text" name="flight_payment"  class="form-control" value="<%=flight.getPayment() %>" required>
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										
				
									%>
								</p>
						</div>
				</div>                              
				<div class="form-group form-group-sm">
					<div class="col-sm-2"></div>
					<div class="col-sm-6">
					<input type="submit" value="Update Flight"
						class="btn btn-sm btn-info" style="width:100%;"></a>
					</div>
				</div>
				
				
					
					
				
					</form>
					<%}} %>
				</div>
			
			
			
			</div>
			
		</div>
	
	</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>