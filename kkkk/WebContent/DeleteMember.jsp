<%@page import="service.IAirlineInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="service.LoginDao" %>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
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
<title>Admin console</title>
</head>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myids")==null){
		 response.sendRedirect("Login.jsp");
	}



%>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
		<div class="col-lg-12">
				<h2 class="page-header text-center">Delete Members</h2>
			
			</div>
			<div class="col-md-3">
			<ul class="navbar nav navbar-default">
					<li><a href="#lists" data-toggle="collapse"><i class="fas fa-user"></i> Members</a>
						<ul class="nav collapse" id="lists">
							<li><a href="AddMember.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Members</a></li>
							<li><a href="DeleteMember.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Members</a></li>
							<li><a href="SelectMember.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Members</a></li>
						</ul>
					</li>
					<li><a href="#lists1" data-toggle="collapse"><i class="fa fa-plane"></i> Flight</a>
						<ul class="nav collapse" id="lists1">
								<li><a href="AddFlight.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Flight</a></li>
								<li><a href="DeleteFlight.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Flight</a></li>
								<li><a href="SelectFlight.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Flight</a></li>
						</ul>
					</li>
					<li><a href="#lists2" href="#lists1" data-toggle="collapse"><i class="fa fa-suitcase"></i> Employee</a>
					
					<ul class="nav collapse" id="lists2">
								<li><a href="AddEmployee.jsp"><div class="col-sm-1"></div><i class="fa fa-plus"></i> Add Employee</a></li>
								<li><a href="DeleteEmployee.jsp"><div class="col-sm-1"></div><i class="fa fa-trash"></i> Delete Employee</a></li>
								<li><a href="SelectEmployee.jsp"><div class="col-sm-1"></div><i class="fas fa-edit"></i> Update Employee</a></li>
					</ul>
					
					</li>
					<li><a href="#"><i class="fas fa-desktop"></i>Notification</a></li>
					
				</ul>
			</div>
			<div class="col-md-9">
				<div class="row">
				<% IAirlineInterface face=new LoginDao();
						
							ArrayList<Customer> list=face.getCustomers();
							if(list.size()==1){%>
							<h2 class="text-success text-center">Oops! There are No Members Here.....</h2>	
								
							<% }else{%>
					<table class="table table-hover ">
						<thead>
							
							
							
							<tr class="success">
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email Id</th>
								<th>Action</th>
							
							</tr>
						</thead>
						<tbody>
						<% 
						for(Customer emp:list){ %>
							<% if(emp.getPr().equals("1")){ %>
							<tr>
								<td><%=emp.getF()  %></td>
								<td><%=emp.getL() %></td>
								<td><%=emp.getE() %></td>
								<td><form method="post" action="AdminDelete"><input type="button" onclick="confSubmit(this.form);" class="btn btn-danger" value="Delete">
								<input type="hidden" name="CustomerID" value="<%= emp.getI()%>"/></form></td>
								<%} %>
							</tr>
						<% }%>
						</tbody>
					</table>
					
					<%} %>
				</div>
			<script>


			function confSubmit(form) {
				if (confirm("Are you sure you want to Delete this Member?")) {
				form.submit();
				}
			}

			
			</script>
			
			
			</div>
			
		</div>
	
	</div>

<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
</body>
</html>