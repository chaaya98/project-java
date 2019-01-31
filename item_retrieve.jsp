<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITEMS DATA</title>
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
	</center>
    		
<%
  try{
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select * from tblitem order by unit desc,qty_on_hand asc");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>TOTAL ITEMS</h4> "); %>
	<TABLE BORDER="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">
            <TR>
               <TH>ITEM.NO</TH>
               <TH>ITEM DESCRIPTION</TH>
               <TH>UNIT</TH>
               <TH>TECH SPECIFICATION</TH>
               <TH>UNIT RATE</TH>
               <TH>QTY ON HAND</TH>
               <TH>REMARKS</TH>
           </TR>
	<%	while(rs.next()){	
	          String itemno=rs.getString("item_no");        
	          String itemdesc=rs.getString("item_desc");        
	          Integer unit=rs.getInt("unit");        
	          String techspec=rs.getString("tech_spec");        
	          Integer unitrate=rs.getInt("unit_rate");        
	          Integer qtyonhand=rs.getInt("qty_on_hand");        
	          String remarks=rs.getString("remarks");        
	    
        %>

           <TR>
               <TD> <%=itemno %> </TD>
               <TD> <%=itemdesc %> </TD>
               <TD> <%=unit %> </TD>
               <TD> <%=techspec %> </TD>
               <TD> <%=unitrate  %> </TD>
               <TD> <%=qtyonhand %> </TD>
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
</body>	
	
</html>