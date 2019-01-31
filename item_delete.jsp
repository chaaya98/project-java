<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITEMS DELETION</title>
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
	  </nav><br><br>
	  <form method="POST" action="item_deletedb.jsp" >
	  <table style="color:#666699;font-family:cursive;">
	  <tr>
	   <td>ITEM.NO<br><br></td><td><input type="text" name="ditem_no" required="required" placeholder="item no."><br><br></td>
	  </tr>
	  </table>
      <input type="submit" value="DELETE ITEM" style="color:#666699;font-family:cursive;">		  
	  </form>
	  </center>
	   <% } %>
	   </body>
	   
	   </html>