<!DOCTYPE html>

<html>
<head>

</head>


<body>
	<p>Hello world</p>



<%@page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%

String query = "select name from student where id=10";
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/inform","root","root");
Statement st =con.createStatement();
ResultSet rs =st.executeQuery(query);

rs.next();
String name =rs.getString("name");
out.println(name);


%>
<%="Welcome to jsp" %>
<br>
<%! int data=10;

int cube(int n){
	return n*n*n;
}
%>

<%="Total : " + cube(data) %>
</body>

</html>