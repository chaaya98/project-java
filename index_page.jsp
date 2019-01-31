<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<html>
<head></head>
<body>
<%
  try{
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from tblita order by ita_no asc");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL ITA's PLACED</h4> "); %>
	<center><table border="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">
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
	          Date raenddt=rs.getDate("ra_stop_date");        
	          String remarks=rs.getString("remarks");               
	    
        %>

           <TR>
             <a href="user_apply_auction.jsp">  <TD> <%=itano %> </TD></a>
             <a href="user_apply_auction.jsp">  <TD> <%=itadate %> </TD></a>
              <a href="user_apply_auction.jsp"> <TD> <%=itemno %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=itemdesc %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=techspec  %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=qtyreqd %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=estrate %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=delydate %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=rastartdt %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=raenddt %> </TD></a>
               <a href="user_apply_auction.jsp"><TD> <%=remarks %> </TD></a>
           </TR>
       <% 
           
			}
			con.close();
  }
catch(Exception ex){
	out.println(ex.getMessage());
	out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
}  
 

       %>	
    </TABLE></center>
       <BR>
</body>

</html>