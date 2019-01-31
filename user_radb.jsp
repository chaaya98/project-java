<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>

<% 
  String username=(String)session.getAttribute("username");
%>

<html>
<head><title>RA GENERATE</title>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> USER AUCTION PORTAL</h2>
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
         <a href="user_ra_delete.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">DELETE</a> |
		 </nav><br><br>
	  <%
	   String itano=request.getParameter("user_raita_no");
	   int nitano=Integer.parseInt(itano);
	   String itemno=request.getParameter("user_raitem_no");
	   String qtyreqd=request.getParameter("user_raqty_req");
	   int nqtyreqd=Integer.parseInt(qtyreqd);
	   String estrate=request.getParameter("user_raest_rt");
	   int nestrate=Integer.parseInt(estrate);
	   //String delydate=request.getParameter("user_radly_dt");
	   SimpleDateFormat formata = new SimpleDateFormat("yyyy-MM-dd");
	  formata.setLenient(false);
      Date delydate = formata.parse(request.getParameter("user_radly_dt"));
	  java.sql.Date sqlDate1 = new java.sql.Date(delydate.getTime());
	   
	   SimpleDateFormat formatb = new SimpleDateFormat("yyyy-MM-dd");
	  formatb.setLenient(false);
      Date rastrtdate = formata.parse(request.getParameter("user_ra_strt_date"));
	  java.sql.Date sqlDate2 = new java.sql.Date(rastrtdate.getTime());
	  
	  SimpleDateFormat formatc = new SimpleDateFormat("yyyy-MM-dd");
	  formatc.setLenient(false);
      Date rastpdate = formata.parse(request.getParameter("user_ra_end_date"));
	  java.sql.Date sqlDate3 = new java.sql.Date(rastpdate.getTime());
	  
	   //String username1=request.getParameter("user_rausername");
	   String qtyquote=request.getParameter("user_raqty_qut");
	   int nqtyquote=Integer.parseInt(qtyquote);
	   String ratequote=request.getParameter("user_rarate_qut");
	   int nratequote=Integer.parseInt(ratequote);
	  try{ 
	   Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
	 
	  
	  PreparedStatement psx=con.prepareStatement("select ita_no from tblra where ita_no = ? and username= ? ");
	 
	  psx.setInt(1,nitano);
	  psx.setString(2,username);
	 ResultSet  rex=psx.executeQuery();
	  out.println(rex.next());
	  
      if(!rex.next()) 
	  {
	  out.println(rex.next());
   		
      
	  PreparedStatement ps= con.prepareStatement("insert into tblra values(NULL,?,?,?,?,?,?,?,?,?,?,NOW())");
	  ps.setInt(1,nitano);
	  ps.setString(2,itemno);
	  ps.setString(3,username);
	  ps.setInt(4,nqtyreqd);
	  ps.setDate(5,sqlDate1);
	  ps.setInt(6,nestrate);
	  ps.setInt(7,nqtyquote);
	  ps.setInt(8,nratequote);
	  ps.setDate(9,sqlDate2);
	  ps.setDate(10,sqlDate3);
	  int row=ps.executeUpdate();
	 
	
	   //out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>APPLIED THE AUCTION SUCCESSFULLY</h4>");
	 if(row >0)
	   {
		   out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>APPLIED THE AUCTION SUCCESSFULLY</h4>");
	   }
	   else
		 
	   {
		  out.println(" <h4 style='color:#666699;text-align:center;font-family:cursive;'>PLEASE ENTER THE  DATA CORRECTLY.</h4>");
	   }
   
   
	}	
	else
		 
		
   {
	   out.println(rex.next());
	   out.println(" <h4 style='color:#666699;text-align:center;font-family:cursive;'>SORRY YOU HAVE ALREADY REGISTERED TO THIS AUCTION SUCCESSFULLY.</h4>");
   }
   
   psx.close();
    rex.close();
	con.close();
	  }
	  catch(Exception ex){
		 out.println(ex.getMessage());
	 out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
	  }
	  
	  %>
	  </center>
	  
 <% } %>	   
<body>		
</html>