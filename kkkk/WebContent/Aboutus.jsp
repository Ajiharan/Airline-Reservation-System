<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div class="container">
	<div class="row">
	<h2 class="page-header text-center">About Airline Reservation System</h2>
		<div class="col-md-4">
			<div class="row">
				<div class="thumbnail">
					<img src="images\pla1.jpg" id="img1">
					<div class="caption">
						<h3>Details About Our System</h3>
						<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#article1">View More Details</button>
						<p id="article1" class="collapse out">
						<br><br>
						About System :<br><br>
						Airline reservation systems incorporate airline schedules, fare tariffs, passenger reservations and ticket records.
						 An airline's direct distribution works
						 within their own 
						reservation system, as well as
						 pushing out information to the GDS.
						  The second type of direct distribution channel are consumers who use the internet or mobile applications to make their
						   own reservations. Travel agencies and other indirect distribution channels access the same GDS as those accessed by
						    the airline reservation systems, and all messaging is transmitted by a standardized messaging system that functions
						     on two types of messaging that transmit on SITA's high level network (HLN). These messaging types are called Type A
						      [usually EDIFACT format] for real time interactive communication and Type B [TTY] for informational and booking type 
						      of messages. Message construction standards set by IATA and ICAO, are global, and apply to more than air transportation.
						       Since airline reservation systems are business critical applications, and they are functionally quite complex, the operation
						        of an in-house airline reservation system is relatively expensive.

									Prior to deregulation, airlines owned their own reservation systems with travel agents subscribing to them. Today, 
									the GDS are run by independent companies with airlines and travel agencies being major subscribers.

							As of February 2009, there are only four major GDS providers in the market: Amadeus, Travelport (which operates the Apollo, Worldspan
							 and Galileo systems), Sabre and Shares. There is one major Regional GDS, Abacus, serving the Asian market and a number of regional players
							  serving single countries, including Travelsky (China), Infini and Axess (both Japan) and Topas (South Korea). Of these, Infini is hosted 
							  within the Sabre complex, Axess is in the process of moving into a partition within the Worldspan complex, and Topas agencies will be migrating into Amadeus.

							Reservation systems may host "ticket-less" airlines and "hybrid" airlines that use e-ticketing in addition to ticket-less to accommodate code-shares and interlines.

							In addition to these "standardized" GDS, some airlines have proprietary versions which they use to run their flight operations. A few examples are Delta's OSS and
							 Deltamatic systems and EDS SHARES. SITA Reservations remains the largest neutral multi-host airline reservations system, with over 100 airlines currently managing inventory.
					</div>
				
				</div>
			</div>
			
		
		</div>
		<div class="col-md-8">
			<div class="caption">
				<h3>Inventory management</h3><hr>
				<br>
				<p>In the airline industry, available seats are commonly referred to as inventory. The inventory of an airline is generally classified into
				 service classes (e.g. first, business or economy class) and up to 26 booking classes, for which different prices and booking conditions apply.
				  Inventory data is imported and maintained through a schedule distribution system over standardized interfaces. One of the core functions of 
				  inventory management is inventory control. Inventory control steers how many seats are available in the different booking classes, by opening 
				  and closing individual booking classes for sale. In combination with the fares and booking conditions stored in the Fare Quote System, the 
				  price for each sold seat is determined. In most cases, inventory control has a real time interface to an airline's Yield management system to support a permanent
				 optimization of the offered booking classes in response to changes in demand or pricing strategies of a competitor.</p>
				
						
			</div>
			<div class="caption">
				<h3>Availability display and reservation (PNR)</h3><hr>
				<br>
				<p>Users access an airlines inventory through an availability display. It contains all offered flights for a particular city-pair with their available seats in the
				 different booking classes. This display contains flights which are operated by the airline itself as well as code share flights which are operated in co-operation with
				  another airline. If the city pair is not one on which the airline offers service, it may display a connection using its own flights or display the flights of other airlines
				  . The availability of seats of other airlines is updated through standard industry interfaces. Depending on the type of co-operation, it supports access to the last seat
				   (last seat availability) in real-time. Reservations for individual passengers or groups are stored in a so-called passenger name record (PNR). Among other data, the PNR
				    contains personal information such as name, contact information or special services requests (SSRs) e.g. for a vegetarian meal, as well as the flights (segments) and issued tickets.
				     Some reservation systems also allow to store customer data in profiles to avoid data re-entry each time a new reservation is made for a known passenger. In addition, most systems have
				      interfaces to CRM systems or customer loyalty applications (aka frequent traveler systems). Before a flight departs, the so-called passenger name list (PNL) is handed over to the departure
				       control system that is used to check-in passengers and baggage. Reservation data such as the number of booked passengers and special service requests is also transferred to flight 
				       operations systems, crew management and catering systems. Once a flight has departed, the reservation system is updated with a list of the checked-in passengers (e.g. passengers who had 
				       a reservation but did not check in (no shows) and passengers who checked in, but did not have a reservation (go shows)). Finally, data needed for revenue accounting and reporting is handed
				        over to administrative systems.</p>
				
						
			</div>
			<div class="caption">
				<h3>Fare quote and ticketing</h3><hr>
				<br>
				<p> The Fares data store contains fare tariffs, rule sets, routing maps, class of service tables, and some tax information that construct the price  "the 
				fare". Rules like booking conditions (e.g. minimum stay, advance purchase, etc.) are tailored differently between different city pairs or zones, and assigned
				 a class of service corresponding to
				 its appropriate inventory bucket. Inventory control can also be manipulated manually through the availability feeds, dynamically controlling how many seats are
				  offered for a particular price by
				  opening and closing particular classes.

					The compiled set of fare conditions is called a fare basis code. There are two systems set up for the interchange of fares data  ATPCO and SITA,
					 plus some system to system direct connects. This system distributes the fare tariffs and rule sets to all GDSs and other subscribers. Every airline
					  employs staff who code air fare rules in accordance with yield management intent. There are also revenue managers who watch fares as they are filed
					   into the public tariffs and make competitive recommendations. Inventory control is typically manipulated from here, using availability feeds to
					    open and close classes of service.

					The role of the ticketing complex is to issue and store electronic ticket records and the very small number of paper tickets that are still issued.
					 Miscellaneous charges order (MCO) is still a paper document; IATA has working groups defining the replacement document the electronic multipurpose
					  document (EMD) as at 2010. The electronic ticket information is stored in a database containing the data that historically was printed on a paper
					   ticket including items such as the ticket number, the fare and tax components of the ticket price or exchange rate information. In the past, 
					   airlines issued paper tickets; since 2008, IATA has been supporting a resolution to move to 100% electronic ticketing. So far, the industry has
					    not been able to comply due to various technological and international limitations. The industry is at 98% electronic ticket issuance today,
					     although electronic processing for MCOs was not available in time for the IATA mandate.</p>
				
						
			</div>
			
		</div>
	
	</div>

</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>