<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>
<html>
<head>
 <title>ITEMS PORTAL</title>
</head>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> ITEMS PORTAL</h2>
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
       <center><nav>
        <a href="item_insert.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [INSERT]</a> 
        <a href="item_update.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [UPDATE]</a> 
        <a href="item_delete.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [DELETE]</a> 
        <a href="item_retrieve.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [TOTAL ITEMS]</a>
		</center>
		
 <% } %>	   
</body>

</html>