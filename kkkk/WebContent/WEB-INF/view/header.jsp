<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.Customer" %>
      <%@page import="service.LoginDao" %>
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


<%
LoginDao log = new LoginDao();

String prid=(String)session.getAttribute("myid");

request.setAttribute("mynoid",prid);
Customer emp=log.getDetails(prid);



%>
<div class="row">
	<div class="jumbotron">
		<div class="row">
			
			<div class="col-md-10">
				<h2 class="text-left">Airline Reservation System</h2>
			</div>	
			<% if(session.getAttribute("myid")==null){ %>
			<div class="col-md-2">
				<a href="Login.jsp"><button type="button" class="btn btn-info"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</button></a>
			</div>	
			
			<% }%>
			<% if(session.getAttribute("myid") !=null){ String uid=(String)session.getAttribute("myid"); %>
			<div class="col-md-2">
				<div class="dropdown">
		<button class="btn btn-info  dropdown-toggle" type="button" data-toggle="dropdown" id="menu1"><img class="thumbnail" alt="NoImage" src="./view.jsp"
		style="width:70px;height:70px;color:red;"><%=emp.getL() %>
		<span class="caret"></span></button>
		<ul class="dropdown-menu">
		
			<li><a href="ViewProfile.jsp"><i class="fa fa-eye" aria-hidden="true"></i> View Profile</a></li>
			<li><a href="EditProfile.jsp"><i class="far fa-edit"></i> Edit Profile</a></li>
			<li><a href="EditPassword.jsp"> <i class="fa fa-key" aria-hidden="true"></i> Edit Password</a></li>
			<li><a href="logout.jsp"> <i class="fa fa-sign-out" aria-hidden="true"></i> LogOut</a></li>
			<li class="divider"></li>
		</ul>
	</div>

			</div>	
			<% }%>
			
			
		</div>
		
	</div>

</div>
<div class="row">
	<nav class="navbar navbar-inverse navbar-fixed">
		<div class="container-fluid">
		
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
			<div class="navbar-header" >
				<a href="index.jsp" class="navbar-brand " style="background-color:orange;">Airline</a>
			</div>
			<div id="myNavbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-nav">
					<li class="active"><a href="index.jsp" ><i class="glyphicon glyphicon-home"></i > Home</a></li>
					<li><a href="Aboutus.jsp"><i class="glyphicon glyphicon-briefcase"></i> About us</a></li>
					<% if(session.getAttribute("myids")!=null){ %>
					<li><a href="Admin.jsp" ><i class="glyphicon glyphicon-cog"></i > Admin</a></li>
					
					<% }%>
								
							<% if(session.getAttribute("myid")!=null){ %>
							<li><a href="contact.jsp"><i class="glyphicon glyphicon-earphone"></i> Contact Us</a></li>
							<li><a href="WelcomeUser.jsp"><i class="glyphicon glyphicon-user"></i> Welcome</a></li>
							
						
												
						 <li class="dropdown">
					        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-bell"></i> Notification
					        <span class="caret"></span></a>
					        <ul class="dropdown-menu">
					          <li><a href="MyNotification.jsp">My Notification<span class="badge">10</span></a></li>
					          <li><a href="#">Preferences</a></li>
					          <li><a href="#">My Activity</a></li>
					        </ul>
					      </li>
												
							<li> <form action="SearchServlet" method="post">
									    <div class="input-group" style="margin-top:6px;">
									      <input type="text" class="form-control" placeholder="Search Destination" name="search" style="width:auto">
									      <div class="input-group-btn" style="float:left;">
									        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
									      </div>
									    </div>
									  </form>
								</li>
							<% }%>
				</ul>
			</div>
		
		</div>
	</nav>
</div>
	<script  src="js/bootstrap.min.js"></script>
<script  src="js/jquery.js.js"></script>
</body>
</html>