<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>


<html>
<head><title>ITA DATA</title>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <nav>
		 <a href="index.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">HOME</a> |
		 <a href="user_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">USER</a> | 
		 <a href="admin_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">ORGANIZATION</a> |
		 </nav>
		<center> 
		 <%
		 String user =request.getParameter("usernamef");
		 String phn =request.getParameter("phonef");
		 String newpass =request.getParameter("chngepass");
		// String user =request.getParameter("usernamef");
		
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int i = st.executeUpdate("update tblsupplier  set password = '"+newpass+"'  where username= '"+user+"' and phone= '"+phn+"' ");
	if (i > 0)
	{
		//response.sendRedirect("user_login.jsp");
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>CHANGED THE PASSWORD SUCCESSFULLY GOTO <a href='user_login.jsp'>LOGIN PAGE</a> TO SIGN_IN</h4>");
	}else{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'> PLEASE INSERT THE USER NAME CORRECTLY</h4>");
	}	
	
	con.close()	; 
		 %>
 </center>
 </body>
 
 </html>

