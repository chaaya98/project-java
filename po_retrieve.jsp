<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>PURCHASE ORDER</title>
</head>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> PURCHASE ORDER PORTAL</h2>
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
        <a href="admin_po.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [GENERATE PO]</a> 
        <a href="po_retrieve.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [LIST OF PO's]</a>
	  </nav><br><br>
	  <%
	  try{
	  Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement(); 
	ResultSet rs = st.executeQuery("Select * from tblpo " );
	
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL PURCHASE ORDERS</h4> "); 
	  %>
	  
	  <table border="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">  
	   <tr>
	    <th>P.O. NO.</th>
	    <th>P.O. DATE</th>
	    <th>RA SL.No</th>
	    <th>ITA NO.</th>
	    <th>ITEM NO</th>
	    <th>USERNAME</th>
	    <th>QUANTITY ORDERED</th>
	    <th>DELIVERY DATE</th>
	    <th>RATE </th>
	   </tr>
	   
	   <%
	   while(rs.next()){
		%>   
		<tr>
		  <td><%=rs.getInt("po_no") %></td>
		  <td><%=rs.getDate("po_date") %></td>
		  <td><%=rs.getInt("ra_sl_no") %></td>
		  <td><%=rs.getInt("ita_no") %></td>
		  <td><%=rs.getString("item_no") %></td>
		  <td><%=rs.getString("username") %></td>
		  <td><%=rs.getInt("qty_ordered") %></td>
		  <td><%=rs.getString("dely_date") %></td>
		  <td><%=rs.getInt("unit_rate") %></td>
		</tr>
		   
	 <%  }
	   
	   %>
	   </table>
	   </br>
	   
	  </center>
  <% 
  con.close();
  }
  catch(Exception ex){
	  out.println(ex.getMessage());
	       out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
  }
  
  } %>
  </body>
 
  </html>