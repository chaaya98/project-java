<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITA DELETION</title>
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
	  </nav><br><br>
	  </center>
	  <%
   String itano = request.getParameter("dita_no");
   int ditano=Integer.parseInt(itano);
  try{ 
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int rs= st.executeUpdate("delete from tblita where ita_no = '"+ditano+"' ");
	if (rs > 0)
	{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>DELETED THE ITA SUCCESSFULLY</h4>");
	}else{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'> PLEASE INSERT THE REQUIRED ITA NUMBER CORRECTLY</h4>");
	}
	
	con.close();
  }
catch(Exception ex){
	out.println(ex.getMessage());
	out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
}  
	
	
	
	
%>
		
 <% } %>	   
<body>		

</html>