<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>PURCHASE ORDER</title>
<script>
function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("po_itano").value;
var urls="newitano_availability.jsp?ver="+k;
 
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById("err").innerHTML=xmlhttp.responseText;
 
    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
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
	     <nav>
        <a href="admin_po.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [GENERATE PO]</a> 
        <a href="po_retrieve.jsp"	 style="color:#666699;text-decoration:none;font-family:cursive;"> [LIST OF PO's]</a>
	  </nav><br><br>
	  <form method="POST" action="po_insertdb.jsp" >
	   <table style="color:#666699;font-family:cursive;">
	   <tr>
	   <td>ITA No.<br><br></td><td><input type="text" id="po_itano" name="po_itano" required="required" onkeyup="loadXMLDoc()"><br><br></td>
	   </tr>
	   </table>
	   <input type="submit" value="GENERATE P.O." style="color:#666699;font-family:cursive;">
	  </form>
	  <span id="err"> </span>
	   </center>
  <% } %>
  </body>
 
  </html>
  