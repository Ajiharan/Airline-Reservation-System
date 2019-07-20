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
		<div class="row">
			
			<div class="col-md-6">
			<h3 class="page-header text-center">Book Ticket</h3>
				<div class="col-lg-12">
					
						<a class="thumbnail" href="#">
						
							<img class="img-responsive" src="viewFlight.jsp" alt="Haran">
	
						</a>
					
				</div>
			
			</div>
			
		
			
			<div class="col-md-6">
			
			<form  method="post"  action="AddBookServlet" class="form-horizontal" >
							<% IAirlineInterface face1=new LoginDao();
							String fid=(String)session.getAttribute("myffid");
						ArrayList<Flight> list=face1.getFlightDetails();
						
						for(Flight myflight:list){
							if(myflight.getfid().equals(fid)){
						 %>
						<div class="form-group form-group-sm">
							<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i> Flight Name</label>
						  	<div class="col-sm-6">
						  		 <input type="text"   name="flight_name"  class="form-control" value="<%=myflight.getflight_Name() %>">
						  		 <input type="hidden" name="fpay" value="<%=myflight.getPayment()%>">
						  		 <input type="hidden" name="cid" value="<%=getid %>">
						  	</div>
						 </div>
				
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p>
										
									</p>
							</div>
					</div>
							
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i>From</label>	 
						<div class="col-sm-6">
						<input type="text"   name="flight_start" class="form-control"  value="<%=myflight.getStart_Point() %>">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div> 
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i> Destination</label>	 
						<div class="col-sm-6">
						<input type="text"   name="flight_destination" class="form-control" value="<%=myflight.getflight_destination()%>">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div>     
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-envelope" aria-hidden="true"></i>Your Name</label>	 
						<div class="col-sm-6">
						 <input type="text" class="form-control"  name="fname">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
											
										%>
									</p>
							</div>
					</div>    	
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i> Seat Type</label>	 
						<div class="col-sm-6">
							<select class="form-control" id="sel1" name="ftype">
							    <option>Class A</option>
							    <option>Class B</option>
							    <option>Class C</option>
							 </select>
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div>   
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i> Arrival Date</label>	 
						<div class="col-sm-6">
						<input type="date" name="fdate" class="form-control">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div>     
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Country</label>	 
						<div class="col-sm-6">
						 <input type="text" class="form-control"  name="fcountry">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
											
										%>
									</p>
							</div>
					</div>  
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Passport No</label>	 
						<div class="col-sm-6">
						 <input type="text" class="form-control"  name="fpassport">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
							<%
								String name=request.getParameter("book_error");
											
							%>
								<p style="color:red;">
									<%if(name !=null){ %>
										<%=name %> <%} %>
								</p>
							</div>
					</div>    	
					
					<div class="form-group form-group-sm">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
						<input type="submit" value="Book Ticket"
							class="btn btn-sm btn-info" style="width:100%;"></a>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
						<a href="WelcomeUser.jsp"><input type="button" value="Cancel"
							class="btn btn-sm btn-primary" style="width:100%;"></a>
						</div>
					</div>
					
						
					<%}
							} %>	
					
					</form>
			
			
			
			
			</div>
			
			
		
		</div>

	</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>