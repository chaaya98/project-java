<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
  String username=(String)session.getAttribute("username");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER_DETAILS</title></head>
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
<%} else {
%>

<!--<a href='user_logout.jsp'>Log out</a> -->
      <nav>
		 <a href="user_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">USER HOME ( <%=session.getAttribute("username")%> ) </a> |
		 <a href="user_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
  <center>
     <nav>
	  
	   <a href="user_ita_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">ITA details</a> |
	   <a href="user_ra_edit.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION EDIT </a> | 
	   <a href="user_ra.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">APPLY TO AUCTION</a> |
	   <a href="user_ra_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION APPLIED DETAILS</a>
       <a href="user_ra_delete.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">DELETE</a> |	   
    </nav>	   <br><br>
	
    
<%
 String itano=request.getParameter("user_ra_itano");\
 int ditano=Integer.parseInt(itano);
 try{
 Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int i = st.executeUpdate("delete from tblra  where ita_no= '"+ditano+"' AND username='"+username+"' ");
	if (i > 0)
	{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>DELETED THE   APPLIED AUCTION SUCCESSFULLY</h4>");
	}else{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'> PLEASE RE-ENTER THE ITA.NO CORRECTLY</h4>");
	}	
	
	con.close();
 }
 catch(Exception ex){
	 out.println(ex.getMessage());
	 out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 }


%>	
	
	</center>
	<%
    }
%>
</body>
</html>