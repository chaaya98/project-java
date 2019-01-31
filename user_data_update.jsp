<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String username=(String)session.getAttribute("username");
%>

<html>
<head><title>USER UPDATE</title>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> USER PORTAL</h2>
<%
    if (username == null || username == "")
 		{  
	      response.sendRedirect("user_login.jsp");
%>
<!-- You are not logged in<br/>
<a href="admin_login.jsp">Please Login</a> -->
<% }  
   else 
  {
%>
       <nav>
		 <a href="user_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">USER HOME ( <% out.println(username); %> ) </a> |
		 <a href="user_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
       <center><nav>
         <a href="user_data.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">MY DATA</a> | 
	     <a href="user_data_update.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">EDIT/UPDATE</a> | 
	     <a href="user_ita_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">ITA details</a> |
		 <a href="user_ra.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">APPLY TO AUCTION</a> |
	  </nav></center><br><br>
	  
	 <center><form action="user_data_updatedb.jsp" method="POST">
             <table>
            <tr> <td> Name<br><br></td><td><input type="text" name="sup_name" required="required"><br><br></td></tr>
            <tr><td> Address<br><br></td><td><textarea name="sup_address" rows="2" cols="30" required="required"></textarea><br><br></td>
            <tr><td>Phone.No<br><br></td><td><input type="text" name="sup_phone" required="required"><br><br></td></tr>
            <tr><td>City<br><br></td><td><input type="text" name="sup_city" required="required"><br><br></td></tr>
            <tr><td>State<br><br></td><td><input type="text" name="sup_state" required="required"><br><br></td></tr>
            <tr><td>Pin Code<br><br></td><td><input type="text" name="sup_pin" required="required"><br><br></td></tr>
            <tr><td>Email<br><br></td><td><input type="email" name="sup_email" required="required"><br><br></td></tr>
            <!--<tr><td>UserName<br><br></td><td><input type="text" name="sup_username" id="sup_username" required="required"  onkeyup="loadXMLDoc()"><br><span id="err"> </span><br><br></td></tr>
		<!--	<tr><td>ID.no<br></td><td><input type="text" name="sup_idno" required="required"><br></td></tr> -->
         <!--   <tr><td>Password<br><br></td><td><input type="password" id="pass1" name="sup_password" required="required"><br><br></td></tr>
            <tr><td>Conform Password<br><br></td><td><input type="password" id="pass2" name="sup_conformpassword" required="required" onkeyup="checkPass(); return false;"><br><span id="confirmMessage"></span><br><br></td></tr>
             -->
			 </table>
            <br><input type="submit" value="UPDATE DATA" style="color:#666699;font-family:cursive;"><br><br>
            </form> </center>
	 

	  
	<% } %>	   
</body>	
	
</html>  