<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<html>
 <head><title>USER_LOGIN</title></head>
 <body>
 <body style="background-color:#D8D8D8;">
      <!--  <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1><br>
		<h3 style="background-color:#666699;color:#E6E6B8;text-align:center;">User Details</h3> -->
		<%
		//int userid = Integer.parseInt((String)request.getAttribute("user_id"));
		//int userid = (Integer) request.getAttribute("user_id");
		//out.println(userid);
    String username = request.getParameter("user_name");   
    String pwd = request.getParameter("user_password");
	String phn=request.getParameter("user_phone");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select sup_id from tblsupplier where username='" + username + "' and password='" + pwd + "' and phone= '"+phn+"'  ");
    if (rs.next()) {
        session.setAttribute("username", username);
        //out.println("welcome " + username);
        //out.println("<a href='user_logout.jsp'>Log out</a>");
        response.sendRedirect("user_detail.jsp");
		
    } else { %>
	    <%@include file="user_login.jsp" %> 
        <h4 style="color:#666699;text-align:center;"> Invalid USER.ID or PASSWORD... try again</h4>
  <%   
  }
%>

 </body>
 
</html>