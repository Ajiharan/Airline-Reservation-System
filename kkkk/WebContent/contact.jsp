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
 		
<title>Contact Us</title>
</head>
<body>
<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myid")==null){
		 response.sendRedirect("Login.jsp");
	}



%>
<% String error=(String)request.getAttribute("error"); %>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form action="ContactServlet" method="post" class="form-horizontal" autocomplete="on">
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-6"><input type ="email" name="myemail" class="form-control"></div>
						</div>
						<div class="form-group form-group-sm">
						<div class="col-sm-2"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%if(error !=null){
										out.println(error);
									} %>	
								</p>
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label">Subject</label>
							<div class="col-sm-6"><input type ="text" name="mysubject" class="form-control"></div>
						</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-2"></div>
								<div class="col-sm-6">
										<p></p>
								</div>
							</div>
						<div class="form-group form-group-sm">
							<label class="col-sm-2 control-label">Comment</label>
							<div class="col-sm-6"><textarea name="message" rows="5" cols="70" class="form-control"></textarea></div>
						</div>
						<div class="form-group form-group-sm">
							<div class="col-sm-2"></div>
							<div class="col-sm-6">
								<input type="submit" value="Submit" class="btn btn-sm btn-info"style="width:100%;">
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