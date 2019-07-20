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
	String id=(String)session.getAttribute("myid");



%>
<body>
<%
LoginDao log = new LoginDao();

String prid=(String)session.getAttribute("myid");

Customer emp=log.getDetails(prid);


String message="";
message=request.getParameter("mes");
String fnameError=(String)request.getAttribute("fnameError");
String lnameError=(String)request.getAttribute("lnameError");
%>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<form method="post" class="form-horizontal" action="FileUploadDBServlet?id=<%=id%>" enctype="multipart/form-data">
			<div class="cards">
		  <img src="view.jsp" alt="John" id ="previewimg" style="width:100%">
		  <h1><%=emp.getL() %></h1>
		   <p class="title"><%=emp.getE() %></p>
		  <p>Harvard University</p>
		  <div style="margin: 24px 0;">
		    <a href="#"><i class="fa fa-dribbble"></i></a> 
		    <a href="#"><i class="fa fa-twitter"></i></a>  
		    <a href="#"><i class="fa fa-linkedin"></i></a>  
		    <a href="#"><i class="fa fa-facebook"></i></a> 
		  </div>
		  <p></p>
		</div>
		
			
		         
		               
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"> Upload Image</label>	 
					<div class="col-sm-10">
					<input type="file" name="photo" id='file' class="form-control" size="50"/>
					</div>
				</div>
				<br>
				<div class="form-group form-group-sm">
					<label class="col-sm-2 control-label"> </label>	 
					<div class="col-sm-6">
					 <input type="submit" value="Save Changes" class="btn btn-sm btn-warning">
					</div>
				</div>
				<br>
				<div class="form-group form-group-sm">
					
					<div class="col-sm-12">
					<%if(message !=null){ %>
					<p style="color:red;"><%=message
					
					%></p>
					<%} %>
					</div>
				</div>
		                
		                
		            
		  </form>
	
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
		<form  method="post" action="ProfileUpdate" class="form-horizontal" >
					
			
			
						
					<div class="form-group form-group-sm">
						<label class="col-sm-3 control-label"><i class="fa fa-user" aria-hidden="true"></i> First Name</label>
					  	<div class="col-sm-6">
					  	 <input type="text" name="fname" class="form-control"  value="<%=emp.getF() %>" >
					  	  <input type="hidden" name="fid" class="form-control"  value="<%= emp.getI() %>">
					  	 </div>
					</div>
					
				<div class="form-group form-group-sm">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%if(fnameError !=null){
										out.println(fnameError);
									} %>	
								</p>
						</div>
				</div>
			
				
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label"><i class="fa fa-user" aria-hidden="true"></i> Last Name</label>	 
					<div class="col-sm-6">
					<input type="text" name="lname" class="form-control"  value="<%=emp.getL() %>" >
					</div>
				</div>
				
				<div class="form-group form-group-sm">
						<div class="col-sm-3"></div>
						<div class="col-sm-6">
								<p style="color:red;">
									<%if(fnameError !=null){
										out.println(fnameError);
									} %>	
								</p>
						</div>
				</div>
				
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label"><i class="fa fa-envelope" aria-hidden="true"></i> Email_id</label>	 
					<div class="col-sm-6">
					 <input type="text" class="form-control"  name="fmail" disabled value="<%=emp.getE() %>">
					</div>
				</div>
				
				<br>
				
				<div class="form-group form-group-sm">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
					<input type="button" onclick="conformationSubmit(this.form);" value="UpdateDetails"
						class="btn btn-sm btn-info" style="width:100%;"></a>
					</div>
				</div>	
			</form>
			<script>


			function conformationSubmit(form) {
				if (confirm("Are you sure you want to Make Changes?")) {
				form.submit();
				}
			}

			
			</script>
 		
		</div>
		
		 <script type="text/javascript">
	$(document).ready(function() {
// Function for Preview Image.
$(function() {
$(":file").change(function() {
if (this.files && this.files[0]) {
var reader = new FileReader();
reader.onload = imageIsLoaded;
reader.readAsDataURL(this.files[0]);
}
});
});
function imageIsLoaded(e) {
$('#message').css("display", "none");

$('#previewimg').attr('src', e.target.result);
};
$("#file").click(function() {


});
});

</script>
	</div>
</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>