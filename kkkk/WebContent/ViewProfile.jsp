<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="model.Customer" %>
      <%@page import="service.LoginDao" %>
    
   
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
<%
LoginDao log = new LoginDao();

String prid=(String)session.getAttribute("myid");

Customer emp=log.getDetails(prid);



%>
 <div class="container">
 	<div class="row">
 		<div class="col-md-3">
 		
 		<div class="cards">
		  <img src="view.jsp" alt="John" style="width:100%">
		  <h1><%=emp.getL() %></h1>
		  <p class="title"><%=emp.getE() %></p>
		  <p>Harvard University</p>
		  <div style="margin: 24px 0;">
		    <a href="#"><i class="fa fa-dribbble"></i></a> 
		    <a href="#"><i class="fa fa-twitter"></i></a>  
		    <a href="#"><i class="fa fa-linkedin"></i></a>  
		    <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a> 
		  </div>
		  <p><a href="EditProfile.jsp"><button id="mybtn">Edit Profile</button></a></p>
		</div>
 			
 		
 		</div>
 		<div class="col-md-9">
 		<h3 class="page-header text-center">My Details</h3>
			<div class="col-md-3"></div>
			<div class="col-sm-9">
				<div class="btn">
						<a href="ViewProfile.jsp"><button class=" btn-success btn-xs"><i class="fa fa-eye" aria-hidden="true"></i> View Profile</button></a>
						<a href="EditProfile.jsp"><button class=" btn-success btn-xs"><i class="far fa-edit"></i> Edit Profile</button></a>
						<a href="EditPassword.jsp"><button class="btn-success btn-xs"><i class="fa fa-key" aria-hidden="true"></i> Edit Password</button></a>
						
					
					
					
				</div>
			</div>
 		<form  method="post" action="EditProfile.jsp" class="form-horizontal" >
					
			
				
						
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label"><i class="fa fa-user" aria-hidden="true"></i> First Name</label>
					  	<div class="col-sm-6">
					  	 <input type="text" name="fname" class="form-control" disabled value="<%=emp.getF() %>" >
					  	 </div>
					</div>
					<br>
			
				
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label"><i class="fa fa-user" aria-hidden="true"></i> Last Name</label>	 
					<div class="col-sm-6">
					<input type="text" name="lname" class="form-control" disabled value="<%=emp.getL() %>" >
					</div>
				</div>
				<br>
				
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Email_id</label>	 
					<div class="col-sm-6">
					 <input type="text" class="form-control"  name="fmail" disabled value="<%=emp.getE() %>">
					</div>
				</div>
				
				<br>
				
				
				
				
					
					
				
			</form>
 		
 		
 		</div>
 		
 	</div>
 
 </div>
 <jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>