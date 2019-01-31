<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String username=(String)session.getAttribute("username");
%>
<html>
    <head>
        <title>USER_DETAILS</title>
	</head>
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
<%
 }
 else 
 {
%>

<!--<a href='user_logout.jsp'>Log out</a> -->
      <nav>
		 <a href="user_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">USER HOME ( <%=session.getAttribute("username")%> ) </a> |
		 <a href="user_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
  <center>
     <nav>
	   <a href="user_data.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">MY DATA</a> | 
	   <a href="user_ra_edit.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION EDIT </a> | 
	   <a href="user_ra.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">APPLY TO AUCTION</a> |
	   <a href="user_ra_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION APPLIED DETAILS</a> |
       <a href="user_ra_delete.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">DELETE</a> |
	</nav>	   <br><br>
	<%
	try{
	  Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
    Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from tblra where username='"+username+"' ");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL AUCTION PLACED</h4> "); 
	%>
	
	<table border="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">
	  <tr>
	    <th>RA NO.</TH>
	    <th>ITA NO.</TH>
	    <th>ITEM NO.</TH>
	    <th>USERNAME</TH>
	    <th>QUANTITY REQUIRED</TH>
	    <th>DELIVERY DATE</TH>
	    <th>ESTIMATED RATE</TH>
	    <th>QUANTITY QUOTED</TH>
	    <th>RATE QUOTED</TH>
	    <th>APPLIED DATE</TH>
	 </tr>
	 
	 <%	
	 while(rs.next())
	 {	
	          Integer rano=rs.getInt("ra_sl_no");        
	          Integer itano=rs.getInt("ita_no");        
	          String itemno=rs.getString("item_no");        
	          //String username1=rs.getString("username");                
	          Integer qtyreqd=rs.getInt("qty_reqd"); 
              Date delydate=rs.getDate("dely_date");			  
	          Integer estrate=rs.getInt("est_rate");                        
	          Integer qtyquote=rs.getInt("qty_quoted");        
	          Integer ratequote=rs.getInt("rate_quoted");        
	          Date applied=rs.getDate("applied");               
	    
        %>

           <TR>
               <TD> <%=rano %> </TD>
               <TD> <%=itano %> </TD>
               <TD> <%=itemno %> </TD>
               <TD> <%=username %> </TD>
               <TD> <%=qtyreqd %> </TD>
               <TD> <%=delydate %> </TD>
               <TD> <%=estrate %> </TD>
               <TD> <%=qtyquote %> </TD>
               <TD> <%=ratequote %> </TD>
               <TD> <%=applied %> </TD>
           </TR>
       <% 
           
			}		   
       %>	
    </TABLE></center>
       <br>
	
	

	<%
	con.close();
	
	}
	catch(Exception ex){
		out.println(ex.getMessage());
	 out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
		
	}
	
	
    }
%>
</body>
</html>