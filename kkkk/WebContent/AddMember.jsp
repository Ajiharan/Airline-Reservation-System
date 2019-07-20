<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="model.Customer" %>
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
String fnameError=(String)request.getAttribute("fnameError");
String lnameError=(String)request.getAttribute("lnameError");
String emailError=(String)request.getAttribute("emailError");
String passError=(String)request.getAttribute("PassError");
String repassError=(String)request.getAttribute("RePassError");
Customer emp=(Customer)request.getAttribute("Objects");
%>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
		<div class="col-lg-12">
				<h2 class="page-header text-center">Add Members</h2>
			
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
			<form action="AdminAdd" method="post" class="form-horizontal" >
					<div class="form-group form-group-sm">
						<label class="col-sm-2 control-label"><i class="fa fa-user" aria-hidden="true"></i> First Name</label>
					  	<div class="col-sm-6">
					  	 <input type="text" name="fname" class="form-control" value="<%if(fnameError !=null){out.println(emp.getF());} %>">
					  	 </div>
					  </div>
			
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%if(fnameError !=null){
										out.println(fnameError);
									} %>	
								</p>
						</div>
				</div>
						
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-user" aria-hidden="true"></i> Last Name</label>	 
					<div class="col-sm-6">
					<input type="text" name="lname" class="form-control" value="<%if(lnameError !=null){out.println(emp.getL());} %>">
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										if(lnameError !=null){
											out.println(lnameError);
										}
				
									%>
								</p>
						</div>
				</div>   
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Email_id</label>	 
					<div class="col-sm-6">
					 <input type="text" class="form-control"  name="fmail" value="<%if(emailError !=null){out.println(emp.getE());} %>" >
					</div>
				</div>
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										if(emailError !=null){
											out.println(emailError);
										}
										
									%>
								</p>
						</div>
				</div>    	
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-key" aria-hidden="true"></i> Password</label>	 
					<div class="col-sm-6">
					  <input type="password" class="form-control" name="fpassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain
											at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
					</div>
				</div>
					
				
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										if(passError !=null){
											out.println(passError);
										}
									%>
								</p>
						</div>
				</div>   
				
				
				
				
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"><i class="fa fa-key" aria-hidden="true"></i>Re_password</label>	 
					<div class="col-sm-6">
					<input type="password" class="form-control" name="refpassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain
											at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
					</div>
				</div>
				 
				<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%
										if(repassError !=null){
											out.println(repassError);
										}
									%>
								</p>
						</div>
				</div>   
				<div class="form-group form-group-sm">
					<div class="col-sm-2"></div>
					<div class="col-sm-6">
					<input type="submit" value="Add Member"
						class="btn btn-sm btn-info" style="width:100%;"></a>
					</div>
				</div>
				
				
					
					
				
				</form>
			</div>
			
		</div>
	
	</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>