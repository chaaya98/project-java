<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITA UPDATE</title>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> INVITATION TO AUCTION PORTAL</h2>
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
        <a href="ita_insert.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [GENERATE]</a> 
        <a href="ita_update.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [UPDATE]</a> 
        <a href="ita_delete.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [DELETE]</a> 
        <a href="ita_retrieve.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [LIST OUT ITAs]</a>
	  </nav><br><br>
	  <form method="POST" action="ita_updatedb.jsp" >
	  <table style="font-family:cursive;color:#666699;">
	    <tr>
		<td>ITA.NO<br><br></td><td><input type="text" name="ita_no" required="required"><br><br></td>
		</tr>
		<tr>
		<td>ITA.DATE<br><br></td><td><input type="text" name="ita_date" placeholder="yyyy-mm-dd" required="required"><br><br></td>
		</tr>
		<tr>
		<td>ITEM.NO<br><br></td><td><input type="text" name="item_no" required="required"><br><br></td>
		</tr>
		<tr>
		<td>ITEM DESCRIPTION<br><br></td><td><textarea  name="item_description" rows="2" cols="30" required="required" ></textarea><br><br></td>
		</tr>
		<tr>
		<td>TECHNICAL SPECIFICATION<br><br></td><td><textarea  name="item_tech_specification" rows="2" cols="30" required="required" ></textarea><br><br></td>
		</tr>
		<tr>
		<td>QUANTITY REQUIRED<br><br></td><td><input type="text" name="ita_qty_req" required="required"><br><br></td>
		</tr>
		<tr>
		<td>ESTIMATE RATE<br><br></td><td><input type="text" name="ita_est_rate" required="required"><br><br></td>
		</tr>
		<tr>
		<td>DELIVERY DATE<br><br></td><td><input type="text" name="ita_dely_date" placeholder="yyyy-mm-dd" required="required"><br><br></td>
		</tr>
		<tr>
		<td>AUCTION STARTING DATE<br><br></td><td><input type="text" name="ita_ra_strt_date" placeholder="yyyy-mm-dd" required="required"><br><br></td>
		</tr>
		<tr>
		<td>AUCTION ENDING DATE<br><br></td><td><input type="text" name="ita_ra_end_date" placeholder="yyyy-mm-dd" required="required"><br><br></td>
		</tr>
		<tr>
		<td>REMARKS<br><br></td><td><input type="text" name="ita_remarks" required="required"><br><br></td>
		</tr>
		</table>
		<input type="submit" value="UPDATE ITA" style="color:#666699;font-family:cursive;">
	  </form>
	</center>
	
  <% } %>
  </body>

  </html>