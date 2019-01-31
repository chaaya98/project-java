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
	ResultSet rs= st.executeQuery("select * from tblsupplier where username= '"+username+"' ");
	out.println("<h4 style='font-family:cursive;text-align:center;color:#666699;'>MY DATA PLACED</h4> "); %>
     <table BORDER="1"  width=100% style="font-family:cursive;text-align:center;color:#666699;">
	   <tr>
	     <th>SUPPLIER_ID</th>
	     <th>NAME</th>
	     <th>ADDRESS</th>
	     <th>PHONE</th>
	     <th>CITY</th>
	     <th>STATE</th>
	     <th>PIN</th>
	     <th>EMAIL_ID</th>
	   </tr>
	 <%	while(rs.next()){	
	       int supid=rs.getInt("sup_id")  ;
           String name=rs.getString("name");		   
           String address=rs.getString("address");		   
           String phone=rs.getString("phone");		   
           String city=rs.getString("city");		   
           String state=rs.getString("state");		   
           int pin=rs.getInt("pin");		   
           String email=rs.getString("email");		   
	    
        %>

          <tr>
		   <td><%= supid %></td>
		   <td><%= name %></td>
		   <td><%= address %></td>
		   <td><%= phone %></td>
		   <td><%= city %></td>
		   <td><%=state %></td>
		   <td><%= pin %></td>
		   <td><%= email %></td>
		  </tr>
       <% 
           
			}		   
       %>	
    </TABLE>
       <BR>  
	 


		
 <% } %>	   
</body>		

</html>