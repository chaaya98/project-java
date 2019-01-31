<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>AUCTION DATA</title>
</head>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> AUCTION PORTAL</h2>
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
	   <center>
	   <nav>
	   | <a href="admin_ra.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About RA </a> |
	   </nav>
	   <br>
	   <%
	   String ita=request.getParameter("admin_raita_no");
	   int nita=Integer.parseInt(ita);
	   try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement(); 
	ResultSet rs = st.executeQuery("Select * from tblra where ita_no= '"+nita+"' ORDER BY rate_quoted ASC,ra_sl_no ASC " );
	
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL SUPPLIERS APPLIED FOR THIS ("+ ita +")</h4> "); %>

	 <table border="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">  
	   <tr>
	    <th>RA. Sl.no</th>
	    <th>ITEM NO.</th>
	    <th>USERNAME</th>
	    <th>QUANTITY REQUIRED</th>
	    <th>DELIVERY DATE</th>
	    <th>ESTIMATED RATE</th>
	    <th>QUANTITY QUOTED</th>
	    <th>RATE QUOTED</th>
	    <th>APPLIED DATE</th>
	   </tr>
	   
	   <%
	   while(rs.next()){
		%>   
		<tr>
		  <td><%=rs.getInt("ra_sl_no") %></td>
		  <td><%=rs.getString("item_no") %></td>
		  <td><%=rs.getString("username") %></td>
		  <td><%=rs.getInt("qty_reqd") %></td>
		  <td><%=rs.getDate("dely_date") %></td>
		  <td><%=rs.getInt("est_rate") %></td>
		  <td><%=rs.getInt("qty_quoted") %></td>
		  <td><%=rs.getInt("rate_quoted") %></td>
		  <td><%=rs.getDate("applied") %></td>
		</tr>
		   
	 <%  }
	   
	   %>
	   </table>
	   </br>
	   
	   <% 
	   con.close();
	   }
	   catch(Exception ex){
		   out.println(ex.getMessage());
	       out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
		   
	   }
	   
	   
	   } %>
	   </center>
  </body>
  
  </html>