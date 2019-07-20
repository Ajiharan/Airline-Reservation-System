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


String passError=(String)request.getAttribute("PassError");
String repassError=(String)request.getAttribute("RePassError");
String newpassError=(String)request.getAttribute("NewPassError");
%>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-2">
			
	
		</div>
		
		<div class="col-md-9">
		
		<form  method="post" action="PasswordUpdate" class="form-horizontal" >
					
				
				<div class="form-group form-group-sm">
					<label class="col-sm-3 control-label"><i class="fa fa-key" aria-hidden="true"></i>Current Password</label>	 
					<div class="col-sm-6">
					 <input type="password" class="form-control"  name="mypass">
					  <input type="hidden" class="form-control"  name="myprid" value="<%=emp.getI()%>">
					</div>
				</div>
				
				
				<div class="form-group form-group-sm">
						<div class="col-sm-3"></div>
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
					<label class="col-sm-3 control-label"><i class="fa fa-key" aria-hidden="true"></i>Conform Password</label>	 
					<div class="col-sm-6">
					 <input type="password" class="form-control"  name="myrepass">
					</div>
				</div>
				
				
				<div class="form-group form-group-sm">
						<div class="col-sm-3"></div>
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
					<label class="col-sm-3 control-label"><i class="fa fa-key" aria-hidden="true"></i>New Password</label>	 
					<div class="col-sm-6">
					 <input type="password" class="form-control"  name="mynewpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain
											at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
					</div>
				</div>
				
				<br>
				
				<div class="form-group form-group-sm">
					<div class="col-sm-3"></div>
					<div class="col-sm-3"><a href="EditProfile.jsp"
						class="btn btn-sm btn-info" style="width:100%;">cancel</a>
					</div>
					<div class="col-sm-3">
					<input type="button" onclick="conformSubmit(this.form);" value="Reset Password"
						class="btn btn-sm btn-info" style="width:100%;">
					</div>
					
				</div>
				
				<script>


			function conformSubmit(form) {
				if (confirm("Conform to Reset?")) {
				form.submit();
				}
				else{
					
				}
			}

			
			</script>	
			</form>
			
 		
		</div>
		<div class="col-md-1">
			
	
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