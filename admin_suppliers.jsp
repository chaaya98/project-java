<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ABOUT SUPPLIERS</title>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;">ABOUT SUPPLIERS</h2>
<%
    if (adminuser == null || adminuser == "")
 		{  
	      response.sendRedirect("admin_login.jsp");
%>
<!-- You are not logged in<br/>
<a href="admin_login.jsp">Please Login</a> -->
<% }  
   else 
  {
%>
         
		<nav>
		 <a href="admin_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">HOME ( <% out.println(adminuser); %> ) </a> |
		 <a href="admin_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
	   <%
  try{
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select sup_id,name,address,phone,city,state,pin,email,username from tblsupplier order by sup_id asc");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL REGISTERED SUPPLIERS</h4> "); %>
	<table border="1" width=100% style="font-family:cursive;text-align:center;color:#666699;">
	  <tr>
	    <th>SUPPLIER.ID</th>
	    <th>NAME</th>
	    <th>ADDRESS</th>
	    <th>PHONE</th>
	    <th>CITY</th>
	    <th>STATE</th>
	    <th>PIN CODE</th>
	    <th>EMAIL.ID</th>
	    <th>USER NAME</th>
	 </tr>
	<% while (rs.next()){ %>
		<tr>
		  <td><%=rs.getString(1) %></td>
		  <td><%=rs.getString(2) %></td>
		  <td><%=rs.getString(3) %></td>
		  <td><%=rs.getString(4) %></td>
		  <td><%=rs.getString(5) %></td>
		  <td><%=rs.getString(6) %></td>
		  <td><%=rs.getInt(7) %></td>
		  <td><%=rs.getString(8) %></td>
		  <td><%=rs.getString(9) %></td>
		 </tr>
 <%	}	 %>
	 </table>
       <br>
 <%
  con.close();
  }
  catch(Exception ex){
	  out.println(ex.getMessage());
	  out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
	  
  }
 
 
 }	 %>
 </body>
 
 </html>