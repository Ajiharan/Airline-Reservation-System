<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="service.LoginDao" %>
    <%@page import="service.IAirlineInterface"%>
<%@page import="model.Customer"%>
<%@page import="model.Flight"%>
<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
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

<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
	

	Book book1=(Book)session.getAttribute("mybook");
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	String getid=(String)session.getAttribute("myid");
	String myflight_pay=(String)session.getAttribute("myflight_pay");
	if(session.getAttribute("myid")==null){
		 response.sendRedirect("Login.jsp");
	}else{
		
	}



%>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
			
				<form  method="post" action="PaymentServlet"  class="form-horizontal" >
					
						<div class="form-group form-group-sm">
							<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i>Card Holder</label>
						  	<div class="col-sm-6">
						  	 <input type="text"   name="fholder"  class="form-control" >
						  	  <input type="hidden"   name="id"  class="form-control" value="<%=getid%>">
						  	 </div>
						  </div>
				
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p>
										
									</p>
							</div>
					</div>
							
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true"></i>Credit_Card No</label>	 
						<div class="col-sm-6">
						<input type="text"   name="fcard" class="form-control">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div> 
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-user" aria-hidden="true" ></i> Payment</label>	 
						<div class="col-sm-6">
						<input type="text" value="<%=myflight_pay %>"  name="fpay" class="form-control">
						<input type="hidden" name="myObjectId" value="${book1}" />
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
									<p style="color:red;">
										<%
											
					
										%>
									</p>
							</div>
					</div>     
					
					<div class="form-group form-group-sm">
						<label class="col-sm-6 control-label"><i class="fa fa-envelope" aria-hidden="true"></i>cvc</label>	 
						<div class="col-sm-6">
						 <input type="text" class="form-control"  name="fcvc">
						</div>
					</div>
					<div class="form-group form-group-sm">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<%
									String pay_error=request.getParameter("pay_error");
								%>
									<p style="color:red;">
										<%if(pay_error != null){ %>
										<%=pay_error %>
										<%} %>
									</p>
							</div>
					</div>    	
					
					
					
				
					
					<div class="form-group form-group-sm">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
						<input type="submit" value="Make Payment"
							class="btn btn-sm btn-info" style="width:100%;"></a>
						</div>
					</div>
					<div class="form-group form-group-sm">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
						<a href="WelcomeUser.jsp"><input type="button" value="Cancel"
							class="btn btn-sm btn-primary" style="width:100%;"></a>
						</div>
					</div>
					
						
					
					
					</form>
			
			</div>
		</div>	
	</div>
<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>