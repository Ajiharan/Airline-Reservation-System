<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
	<div class="col-md-9">
			<div class="w3-content w3-section" style="max-width:100%">
		 
				<div class="thumbnail">
				  <img class="mySlides w3-animate-fading" src="images/pla5.jpg" style="width:100%">
				  <img class="mySlides w3-animate-fading" src="images/pla2.jpg" style="width:100%">
				  <img class="mySlides w3-animate-fading" src="images/pla6.jpg" style="width:100%">
				  <img class="mySlides w3-animate-fading" src="images/pla3.jpg" style="width:100%">
				  <img class="mySlides w3-animate-fading" src="images/pla4.jpg" style="width:100%">
				  <img class="mySlides w3-animate-fading" src="images/pla7.jpg" style="width:100%">
				 </div>
			</div>
		
			<script>
			var myIndex = 0;
			carousel();
			
			function carousel() {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";  
			  }
			  myIndex++;
			  if (myIndex > x.length) {myIndex = 1}    
			  x[myIndex-1].style.display = "block";  
			  setTimeout(carousel, 8000);    
			}
			</script>
		</div>
		<div class="col-md-3">
		
		<!--<div class="row">
	
		  <% String mes=(String)request.getAttribute("correct"); %>
			
			<div class="alert alert-success fade in">
				<a href="#" class="close" data-dismiss="alert">X</a>
				<strong><%=mes %></strong>
			
			</div>
			
		</div>-->
		
		<div class="row">
				<div class="thumbnail">
					<img src="images\pla6.jpg" id="img1">
					<div class="caption">
						<h3>Ticket Reservation</h3>
						<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#article1">View More Details</button>
						<p id="article1" class="collapse in">
						<br><br>
						Register To Become Member:<br><br>
						An airline ticket is a document or electronic record, issued by an airline or a travel agency, that confirms that an individual 
						is entitled to a seat on a flight on an aircraft. The airline ticket may be one of two types: a paper ticket, which comprises 
						coupons or vouchers; and an electronic ticket (commonly referred to as an e-ticket).

						The ticket, in either form, is required to obtain a boarding pass during check-in at the airport. Then with the boarding pass
						 and the attached ticket, the passenger is allowed to board the aircraft.<br><br> 
						 <% if(session.getAttribute("myid")==null){ %>
							 <a href="Register.jsp"><button class="btn btn-warning">Join Member</button></a>
						
						<% }%>
						 <% if(session.getAttribute("myid") !=null){ %>
							 <a href="Booking.jsp"><button class="btn btn-warning">Book Ticket</button></a>
						
						<% }%>
						
					</div>
				
				</div>
			</div>
			
		</div>
		
	</div>
</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>