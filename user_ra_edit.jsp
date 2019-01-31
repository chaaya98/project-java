<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
  String username=(String)session.getAttribute("username");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER_DETAILS</title></head>
	    <body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> USER AUCTION PORTAL</h2>
		<%
   if (username == null || username == "")
 		{  
	      response.sendRedirect("user_login.jsp");
%>
<!--You are not logged in<br/>
<a href="user_login.jsp">Please Login</a> -->
<%} else {
%>

<!--<a href='user_logout.jsp'>Log out</a> -->
      <nav>
		 <a href="user_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">USER HOME ( <%=session.getAttribute("username")%> ) </a> |
		 <a href="user_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
  <center>
     <nav>
	   <a href="user_data.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">MY DATA</a> | 
	   <a href="user_ita_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">ITA details</a> |
	   <a href="user_ra_edit.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION EDIT </a> | 
	   <a href="user_ra.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">APPLY TO AUCTION</a> |
	   <a href="user_ra_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION APPLIED DETAILS</a> |
     <a href="user_ra_delete.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">DELETE</a> |
	</nav>	   <br><br>
	
	<form method="POST" action="user_ra_editdb.jsp">
	 <table style="color:#666699;font-family:cursive;">
	 <tr>
	  <td>ITA_NO<br><br></td><td><input type="text" name="user_ra_itano" required="required"></br></br></td>
	  </tr>
	  <tr>
	  <td>DELIVERY DATE<br><br></td><td><input type="text" name="user_radly_dt" placeholder="YYYY-MM-DD" required="required"></br></br></td>
	  </tr>
	  <tr>
	  <td>QUANTITY QUOTED<br><br></td><td><input type="text" name="user_raqty_qut" required="required"></br></br></td>
	  </tr>
	  <tr>
	  <td>RATE QUOTED<br><br></td><td><input type="text" name="user_rarate_qut" required="required"></br></br></td>
	  </tr>
	 </table>
	 <input type="submit" value="UPDATE RA" style="color:#666699;font-family:cursive;" >
	</form>
	</center>
	<%
    }
%>
</body>
</html>