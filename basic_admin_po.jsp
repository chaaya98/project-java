<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>PURCHASE ORDER</title>
</head>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> PURCHASE ORDER PORTAL</h2>
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
       <center>
	   <%
	   try{
	   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
			Statement sts=con.createStatement();
			String sqlquery="select * from tblra where DATE(ra_stop_date) >= DATE(CURDATE()) ";
			ResultSet rst =sts.executeQuery(sqlquery);
			out.println(rst.next());
		if(rst.next()){	
		 
		 String poitemno= rst.getString("item_no");
		 String pousername= rst.getString("username");
		 String poqtyorder= rst.getString("qty_quoted");
		 Date podelydt= rst.getDate("dely_date");
		 String porate= rst.getString("rate_quoted");
		 Integer poraslno= rst.getInt("ra_sl_no");
		 String poitano= rst.getString("ita_no");
			
			String sql="insert into tblpo values(NULL,NOW(),?,?,?,?,?,?,?) ";	
	      PreparedStatement ps= con.prepareStatement(sql);
		  ps.setString(1,poitemno);
		  ps.setString(2,pousername);
		  ps.setString(3,poqtyorder);
		  ps.setDate(4,podelydt);
		  ps.setString(5,porate);
		  ps.setInt(6,poraslno);
		  ps.setString(7,poitano);
		  
		  int row=ps.executeUpdate();
	   if(row > 0){
		   out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>inserted THE PO SUCCESSFULLY</h4>");
		   
		   
		   
		   
		   
		   
	   }
	   else{
		   out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>cant inserted PO ITA SUCCESSFULLY</h4>");
	   }
		}
		else{
			
			out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>CAN'T GET THE PO ITA SUCCESSFULLY</h4>");
		}
	   }
	   catch(Exception ex){
		   out.println(ex.getMessage());
	   }
	   %>
	   </center>
  <% } %>
  </body>
  <footer style="text-align:center;font-family:cursive; position: absolute;
    bottom: 0; 
     width: 1350px;
    height: 27px;">
&copy Designed & Develop by A-TEAM

</footer> 
  </html>
  