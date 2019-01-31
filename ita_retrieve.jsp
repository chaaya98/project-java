<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITA DATA</title>
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
	  </nav></center><br><br>
	  <%
  try{
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
	          Integer itano=rs.getInt("ita_no");        
	          Date itadate=rs.getDate("ita_date");        
	          String itemno=rs.getString("item_no");        
	          String itemdesc=rs.getString("item_desc");        
	          String techspec=rs.getString("tech_spec");        
	          Integer qtyreqd=rs.getInt("qty_reqd");        
	          Integer estrate=rs.getInt("est_rate");        
	          Date delydate=rs.getDate("dely_date");              
	          Date rastartdt=rs.getDate("ra_start_date");        
	          Date rastopdt=rs.getDate("ra_stop_date");        
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
               <TD> <%=rastopdt %> </TD>
               <TD> <%=remarks %> </TD>
           </TR>
       <% 
           
			}		   
       %>	
    </TABLE>
       <BR>
		
 <% 
 con.close();
  }
  catch(Exception ex){
	  out.println(ex.getMessage());
	  out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
  }
  
 
 
 
 } %>	   
<body>	
	
</html>
