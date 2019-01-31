<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITA INSERT</title>
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
	  </nav><br><br></center>
	<%
	   
	   
	  
	  String itano = request.getParameter("ita_no");
	  int nitano=Integer.parseInt(itano);
	 
	  SimpleDateFormat formata = new SimpleDateFormat("yyyy-MM-dd");
	  formata.setLenient(false);
      Date itadate = formata.parse(request.getParameter("ita_date"));
	  java.sql.Date sqlDate1 = new java.sql.Date(itadate.getTime());
	  String itemno = request.getParameter("item_no");
	  String itemdescription = request.getParameter("item_description");
	  String  itemtechspec = request.getParameter("item_tech_specification");
	  String itaqtyreq = request.getParameter("ita_qty_req");
	  int nitaqtyreq=Integer.parseInt(itaqtyreq);
	  String itaestrate = request.getParameter("ita_est_rate");
	  int nitaestrate=Integer.parseInt(itaestrate);
	 
	  SimpleDateFormat formatb = new SimpleDateFormat("yyyy-MM-dd");
	  formatb.setLenient(false);
      Date itadelydate = formatb.parse(request.getParameter("ita_dely_date"));
	  java.sql.Date sqlDate2 = new java.sql.Date(itadelydate.getTime());
	  
	  
	  SimpleDateFormat formatc = new SimpleDateFormat("yyyy-MM-dd");
	  formatc.setLenient(false);
      Date itarastrtdate = formatc.parse(request.getParameter("ita_ra_strt_date"));
	  java.sql.Date sqlDate3 = new java.sql.Date(itarastrtdate.getTime());
	  
	  SimpleDateFormat formatd = new SimpleDateFormat("yyyy-MM-dd");
	  formatd.setLenient(false);
      Date itaraenddate = formatd.parse(request.getParameter("ita_ra_end_date"));
	  java.sql.Date sqlDate4 = new java.sql.Date(itaraenddate.getTime());
	  String itaremarks = request.getParameter("ita_remarks");
	  
	try{  
	  Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
		PreparedStatement ps= con.prepareStatement("insert into tblita values(?,?,?,?,?,?,?,?,?,?,?)");	
        ps.setInt(1,nitano);
		ps.setDate(2,sqlDate1);
		ps.setString(3,itemno);
		ps.setString(4,itemdescription);
		ps.setString(5,itemtechspec);
		ps.setInt(6,nitaqtyreq);
		ps.setInt(7,nitaestrate);
		ps.setDate(8,sqlDate2);
		ps.setDate(9,sqlDate3);
		ps.setDate(10,sqlDate4);
		ps.setString(11,itaremarks);
		
       int row=ps.executeUpdate();
	   if(row >0)
	   {
		   out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>GENERATED THE ITA SUCCESSFULLY</h4>");
	   }
	   else
	   {
		  out.println(" <h4 style='color:#666699;text-align:center;font-family:cursive;'>PLEASE ENTER THE ITEM.NO OR DATA CORRECTLY.</h4>");
	   }
	   
	   con.close();
	}
	catch(Exception ex){
		out.println(ex.getMessage());
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
	}
	   
	 %>
	
  <% } %>
  </body>
 
  </html>