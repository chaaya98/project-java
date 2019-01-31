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
	  
	<%  
	   String name=request.getParameter("sup_name");		   
           String address=request.getParameter("sup_address");		   
           String phone=request.getParameter("sup_phone");		   
           String city=request.getParameter("sup_city");		   
           String state=request.getParameter("sup_state");		   
           String pin=request.getParameter("sup_pin");
           int upin	=Integer.parseInt(pin);			   
           String email=request.getParameter("sup_email");
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int i = st.executeUpdate("update tblsupplier  set name= '"+name+"',address= '"+address+"' ,phone= '"+phone+"' ,city= '"+city+"' ,state= '"+state+"',pin= '"+upin+"' ,email='"+email+"' where username= '"+username+"' ");
	if (i > 0)
	{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>UPDATED THE REQUIRED DATA  SUCCESSFULLY</h4>");
	}else{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'> PLEASE INSERT THE REQUIRED DATA  CORRECTLY</h4>");
	}	
			   
	    
	
	 %>
	
		<% } %>	   
<body>	

</html>  