<%@page import="java.io.*"%>
<%@page import="java.sql.*" %> 
<%
try{
		Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
	    out.println("Successfully connected");
}
catch(Exception ex){
	 out.println("not connected successfully");
	 out.println(ex.getMessage());
}
		%>