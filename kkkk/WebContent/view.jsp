<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%
String getid=(String)session.getAttribute("myid");
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//Http1.1
	response.setHeader("Pragma","no-cache");//Http1.0
	response.setHeader("Expires","0");//Proxies
	if(session.getAttribute("myid")==null){
		 response.sendRedirect("Login.jsp");
	}



%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
try {
Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/air","root","root");
String sqlQuery="select photo from profile where eid=? and id=(select max(id) from profile where eid=?)";
PreparedStatement ps=con.prepareStatement(sqlQuery);
ps.setString(1, getid);
ps.setString(2,  getid);
 rs=ps.executeQuery();
if (rs.next()) {
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
// display the image
response.setContentType("image/jpg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} 
%> 
</body>
</html>