<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
   
  <%@ page import="model.Customer" %>
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
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<% if(session.getAttribute("myid")!=null){ 
	response.sendRedirect("index.jsp");

}%>
<%
String fnameError=(String)request.getAttribute("fnameError");
String lnameError=(String)request.getAttribute("lnameError");
String emailError=(String)request.getAttribute("emailError");
String passError=(String)request.getAttribute("PassError");
String repassError=(String)request.getAttribute("RePassError");
Customer emp=(Customer)request.getAttribute("Object");
%>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<h2 class="text-center page-header" id="form1">Register Form</h2>
				<form action="RegisterServlet" method="post" class="form-horizontal" >
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
					<input type="submit" value="Submit"
						class="btn btn-sm btn-info" style="width:100%;"></a>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<div class="col-sm-2"></div>
					<div class="col-sm-6">
					<a href="Login.jsp"><input type="button" value="I Already have An Account"
						class="btn btn-sm btn-primary" style="width:100%;"></a>
					</div>
				</div>
				
					
					
				
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>