<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>

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
</center>
<%
  String itano=request.getParameter("user_ra_itano");
  int eitano=Integer.parseInt(itano);
  SimpleDateFormat formata = new SimpleDateFormat("yyyy-MM-dd");
	  formata.setLenient(false);
      Date itadate = formata.parse(request.getParameter("user_radly_dt"));
	  java.sql.Date sqlDate1 = new java.sql.Date(itadate.getTime());

	  String qtyquoted=request.getParameter("user_raqty_qut");
	  int eqtyquoted=Integer.parseInt(qtyquoted);
	  String ratequoted=request.getParameter("user_rarate_qut");
	  int eratequoted=Integer.parseInt(ratequoted);
	  try{
	   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int i = st.executeUpdate("update tblra  set dely_date = '"+sqlDate1+"',qty_quoted= '"+eqtyquoted+"' ,rate_quoted= '"+eratequoted+"' where ita_no= '"+eitano+"' AND username='"+username+"' ");
	if (i > 0)
	{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>UPDATED THE REQUIRED DATA FOR  APPLIED AUCTION SUCCESSFULLY</h4>");
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

<% } %>	   
<body>		
</html> 