<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<html>
 <head><title>ORG_LOGIN</title></head>
 <body>
 <body style="background-color:#D8D8D8;">
      <!--  <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1><br>
		<h3 style="background-color:#666699;color:#E6E6B8;text-align:center;">User Details</h3> -->
		<%
    String adminid = request.getParameter("admin_id");
    String adminuser = request.getParameter("admin_name");	
    String pwd = request.getParameter("admin_password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from tbluser where user_id='" + adminid + "' and user_name='"+adminuser+"' and password='" + pwd + "'   ");
    if (rs.next()) {
        session.setAttribute("adminuser", adminuser);
        //out.println("welcome " + adminuser);
        //out.println("<a href='admin_logout.jsp'>Log out</a>");
        response.sendRedirect("admin_detail.jsp");
		
    } else { %>
	    <%@include file="admin_login.jsp" %> 
        <h4 style="color:#666699;text-align:center;"> Invalid USER.ID or PASSWORD... try again</h4>
  <%   
  }
%>

 </body>

</html>