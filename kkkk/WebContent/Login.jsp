<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
   
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
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				<h2 class="text-center page-header" id="form">Login Form</h2>
					<form action="Login" method="post" class="form-horizontal" autocomplete="on">
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Email_id</label>
							<div class="col-sm-6"><input type ="email" name="uemail" class="form-control"></div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label"><i class="fa fa-key" aria-hidden="true"></i> Password</label>
						  	<div class="col-sm-6"><input type="password" name="fpass" id="fpass" class="form-control"></div>
						</div>
						<div class="form-group form-group-sm">
							<div class="col-sm-2"></div>
							<div class="col-sm-3">
								<input type="checkbox" onclick="myFunction()">Show Password
							</div>
							<div class="col-sm-3">
								<a href="#">Forgot passoword?</a>
							</div>
						</div>
							<script>
							function myFunction() {
							  var x = document.getElementById("fpass");
							  if (x.type === "password") {
							    x.type = "text";
							  } else {
							    x.type = "password";
							  }
							}
							</script>
						<% 
						
						String name=request.getParameter("name");
						if(session.getAttribute("myid")==null && name !=null){%>
						<div class="form-group form-group-sm">
							<div class="col-sm-2"></div>
							<div class="col-sm-6">
								<p style="color:red;"><%=name %></p>
							</div>
						</div>
							<% }%>
						<div class="form-group form-group-sm">
							<div class="col-sm-2"></div>
							<div class="col-sm-6">
								<button type="submit"  class="btn btn-sm btn-info"style="width:100%;"><i class="fa fa-arrow-right" aria-hidden="true"></i> Login</button>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<div class="col-sm-2"></div>
							<div class="col-sm-6">
								<a href="Register.jsp"><button type="button" class="btn btn-sm btn-primary" style="width:100%;"><i class="fa fa-user" aria-hidden="true"></i> Create An Account
								</button>
								</a>
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