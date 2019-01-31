<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head><title>ITEMS INSERT</title>
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
   String itemno = request.getParameter("item_no");
   String itemdescription = request.getParameter("item_description");
   String unit = request.getParameter("item_unit");
   int nunit=Integer.parseInt(unit);
   String techspecification = request.getParameter("item_tech_specification");
   String unitrate = request.getParameter("item_unit_rate");
   int nunitrate=Integer.parseInt(unitrate);
   String qtyonhand = request.getParameter("item_qty_on_hand");
   int nqtyonhand=Integer.parseInt(qtyonhand);
   String remarks = request.getParameter("item_remarks");
   try{
   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
    Statement st = con.createStatement();
	int i = st.executeUpdate("insert into tblitem(item_no,item_desc,unit,tech_spec,unit_rate,qty_on_hand,remarks) values ('"+itemno+"','"+itemdescription+"','"+nunit+"','"+techspecification+"','"+nunitrate+"','"+nqtyonhand+"','"+remarks+"') ");
	if (i > 0)
	{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>INSERTED THE ITEMS SUCCESSFULLY</h4>");
	}else{
		out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'> PLEASE INSERT THE REQUIRED DATA CORRECTLY</h4>");
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