<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>AUCTION DATA</title>
<!--<script>
function ShowUser(str)
   {
    
    if (str== "")
	 {
	  document.getElementById("txt").innerHTML="";
	  return;
	 }
	 if(window.XMLHttpRequest)
	  {
	   xmlhttp=new XMLHttpRequest();
	  }
	  else
	   {
	   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	   }
	   xmlhttp.onreadystatechange=function()
	   {
	   if(xmlhttp.readyState==4 && xmlhttp.status==200)
	   {
	    document.getElementById("txt").innerHTML=xmlhttp.responseText;
	  }
	 }
	 xmlhttp.open("get","admin_ra_retrieve.jsp?q="+str,true);
	 xmlhttp.send();
	}
	</script> -->
</head>
<body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> AUCTION PORTAL</h2>
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
	  <form method="POST" action="admin_ra_retrieve.jsp">
	   <table style="color:#666699;font-family:cursive;">
	  <!-- <tr>
	   <td>ITA_NO: <br><br></td><td><input type="text" name="admin_raita_no" onkeyup="ShowUser(this.value)" ><br><br></td>
	   </tr> -->
	   <tr>
	   <td>ITA_NO: <br><br></td><td><input type="text" name="admin_raita_no"  ><br><br></td>
	   </tr>
	   </table>
	  <input type="submit" value="GET DATA" style="color:#666699;font-family:cursive;">
	  </form>
	   <!--<div id="txt"><b style="color:#666699;font-family:cursive;">DATA WILL PRESENTED HERE..</b></div> -->
	</center>
  <% } %>
  </body>
  
  </html>
  