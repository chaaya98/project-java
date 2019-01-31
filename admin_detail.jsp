
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ORG_DETAILS</title>
    </head>
	    <body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
<%
    if ((session.getAttribute("adminuser") == null) || (session.getAttribute("adminuser") == "")) {
		
		response.sendRedirect("admin_login.jsp");
%>
<!--You are not logged in<br/>
<a href="admin_login.jsp">Please Login</a> -->
<%} else {
%>
<!--Welcome --> 


        <nav>
		 <a href="admin_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">HOME ( <%=session.getAttribute("adminuser")%> ) </a> |
		 <a href="admin_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>



<!--<a href='admin_logout.jsp'>Log out</a>-->
 <center><nav >
  <a href="admin_suppliers.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About Suppliers</a> |
  <a href="admin_item.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About Items</a> |
  <a href="admin_ita.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About ITA</a> |
  <a href="admin_ra.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About RA </a> |
  <a href="admin_po.jsp" style="color:#666699;text-decoration:none;font-size:25px;font-family:cursive;">About PO</a> |
 </nav></center>
<%
    }
%>
</body>

</html>
