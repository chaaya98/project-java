
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
  String username=(String)session.getAttribute("username");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER_DETAILS</title>
		<script type="text/javascript">
var xmlHttp1 ;
function searchSuggest(str)
{
 if (typeof XMLHttpRequest != "undefined")
 {
  xmlHttp1= new XMLHttpRequest();
        }
   else if (window.ActiveXObject)
   {
  xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
   }
 if (xmlHttp1==null)
 {
  alert ("Browser does not support XMLHTTP Request");
  return
 }
 var url="search.jsp";
 url += "?search=" +str;
 xmlHttp1.onreadystatechange = stateChange1;
 xmlHttp1.open("GET", url, true);
 xmlHttp1.send();
}
function stateChange1()
{ 
  if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete")
  {
    var strResponse=xmlHttp1.responseText;
     if (strResponse != "")
     {
  
    //Split response into array
     var arrResponse = strResponse.split("brk"); 
  
     var arrLen = arrResponse.length;
     for(i=0;i<arrLen;i++)
     {
      document.getElementById("hint").innerHTML=arrResponse[0]; 
      document.getElementById("user_raitem_no").innerHTML=arrResponse[1]; 
      document.getElementById("user_raqty_req").innerHTML=arrResponse[2];
      document.getElementById("user_raest_rt").innerHTML=arrResponse[3];
      document.getElementById("user_radly_dt").innerHTML=arrResponse[4];
      document.getElementById("user_ra_strt_date").innerHTML=arrResponse[5];
      document.getElementById("user_ra_end_date").innerHTML=arrResponse[6];
     }
     }
  }
}

function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("user_raita_no").value;
var urls="raita_availability.jsp?ver="+k;
 
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
        <h2 align="center" style="background-color:#666699;color:#E6E6B8;"> USER AUCTION PORTAL</h2>
		<%
   if (username == null || username == "")
 		{  
	      response.sendRedirect("user_login.jsp");
%>
<!--You are not logged in<br/>
<a href="user_login.jsp">Please Login</a> -->
<%} else {
%>

<!--<a href='user_logout.jsp'>Log out</a> -->
      <nav>
		 <a href="user_detail.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">USER HOME ( <%=session.getAttribute("username")%> ) </a> |
		 <a href="user_logout.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">LOG-OUT</a> |
	   </nav><br><br>
  <center>
     <nav>
	   <a href="user_data.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">MY DATA</a> | 
	   <a href="user_ita_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">ITA details</a> |
	   <a href="user_ra_edit.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION EDIT </a> | 
	   <a href="user_ra.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">APPLY TO AUCTION</a> |
	   <a href="user_ra_retrieve.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">AUCTION APPLIED DETAILS</a> |
       <a href="user_ra_delete.jsp" style="color:#666699;text-decoration:none;font-family:cursive;">DELETE</a> |
	   </nav>	   <br><br>
	 <span id="err" style="font-family:cursive;"> </span>
	<form method="POST" action="user_radb.jsp">
	<table style="font-family:cursive;color:#666699;">
	<tr>
	<td>ITA NO. <br><br></td><td><div ><input type="text" name="user_raita_no" id="user_raita_no" onkeyup="searchSuggest(this.value);loadXMLDoc();" required="required"></div><div id="hint"></div></td>
	</tr>
	<tr>
	<td>ITEM NO. <br><br></td><td><div id="user_raitem_no"><input type="text" name="user_raitem_no" required="required"></div><br></td>
	</tr>
	<tr>
	<td>QUANTITY REQUIRED. <br><br></td><td><div id="user_raqty_req"><input type="text" name="user_raqty_req" required="required"></div><br></td>
	</tr>
	<tr>
	<td>ESTIMATED RATE <br><br></td><td><div id="user_raest_rt"><input type="text" name="user_raest_rt" required="required"></div><br></td>
	</tr>
	<tr>
	<td>DELIVERY DATE. <br><br></td><td><div id="user_radly_dt"><input type="text" name="user_radly_dt" placeholder="yyyy-mm-dd" required="required"></div><br></td>
	</tr>
	<tr>
   <td>AUCTION STARTING DATE<br><br></td><td><div id="user_ra_strt_date"><input type="text" name="user_ra_strt_date" placeholder="yyyy-mm-dd" required="required"></div><br></td>
	</tr>
	<tr>
	<td>AUCTION ENDING DATE<br><br></td><td><div id="user_ra_end_date"><input type="text" name="user_ra_end_date" placeholder="yyyy-mm-dd" required="required"></div><br></td>
	</tr>
	<tr>
	<td>USERNAME<br><br></td><td><div id="user_rausername"><input type="text" name="user_rausername" required="required"></div><br></td>
	</tr>
	<tr>
	<td>QUANTITY QUOTED <br><br></td><td><input type="text" name="user_raqty_qut" required="required"><br><br></td>
	</tr>
	<tr>
	<td>RATE QUOTED <br><br></td><td><input type="text" name="user_rarate_qut" required="required"><br><br></td>
	</tr>
	</table>
	<input type="submit" value="APPLY" style="color:#666699;font-family:cursive;">
	</form>
	   </center>

<%
    }
%>
</body>
</html>