<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String username=(String)session.getAttribute("username");
%>

<html>
<head><title>ITA DATA</title>
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
	  <%
  
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from tblita order by ita_no asc");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL ITA's PLACED</h4> "); %>
	
	<table border="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">
	  <tr>
	    <th>ITA .NO</TH>
	    <th>ITA DATE</TH>
	    <th>ITEM .NO</TH>
	    <th>ITEM DESCRIPTION</TH>
	    <th>TECHNICAL SPECIFICATION</TH>
	    <th>QTY REQUIRED</TH>
	    <th>ESTIMATED RATE</TH>
	    <th>DELIVERY DATE</TH>
	    <th>RA START DATE</TH>
	    <th>RA END DATE</TH>
	    <th>REMARKS</TH>
	 </tr>
	 
	 <%	while(rs.next()){	
	          String itano=rs.getString("ita_no");        
	          Date itadate=rs.getDate("ita_date");        
	          String itemno=rs.getString("item_no");        
	          String itemdesc=rs.getString("item_desc");        
	          String techspec=rs.getString("tech_spec");        
	          String qtyreqd=rs.getString("qty_reqd");        
	          String estrate=rs.getString("est_rate");        
	          Date delydate=rs.getDate("dely_date");               
	          Date rastartdt=rs.getDate("ra_start_date");        
	          Date raenddt=rs.getDate("ra_stop_date");        
	          String remarks=rs.getString("remarks");               
	    
        %>

           <TR>
               <TD> <%=itano %> </TD>
               <TD> <%=itadate %> </TD>
               <TD> <%=itemno %> </TD>
               <TD> <%=itemdesc %> </TD>
               <TD> <%=techspec  %> </TD>
               <TD> <%=qtyreqd %> </TD>
               <TD> <%=estrate %> </TD>
               <TD> <%=delydate %> </TD>
               <TD> <%=rastartdt %> </TD>
               <TD> <%=raenddt %> </TD>
               <TD> <%=remarks %> </TD>
           </TR>
       <% 
           
			}		   
       %>	
    </TABLE>
       <BR>
		
 <% } %>	   
</body>	
	
</html>
