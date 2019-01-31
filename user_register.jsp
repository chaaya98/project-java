

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER_REGISTER</title>
        <script>
            function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(pass1.value == pass2.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  
 function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("sup_username").value;
var urls="newuser_availability.jsp?ver="+k;
 
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
		<nav>
		 <a href="index.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">HOME</a> |
		 <a href="user_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">USER</a> | 
		 <a href="admin_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">ORGANIZATION</a> |
		 </nav>
	<br><br>
    <center><form action="user_page.jsp" method="POST">
             <table style="color:#666699;font-family:cursive;">
            <tr> <td> Name<br><br></td><td><input type="text" name="sup_name" required="required"><br><br></td></tr>
            <tr><td> Address<br><br></td><td><textarea name="sup_address" rows="2" cols="30" required="required"></textarea><br><br></td>
            <tr><td>Phone.No<br><br></td><td><input type="text" name="sup_phone" required="required"><br><br></td></tr>
            <tr><td>City<br><br></td><td><input type="text" name="sup_city" required="required"><br><br></td></tr>
            <tr><td>State<br><br></td><td><input type="text" name="sup_state" required="required"><br><br></td></tr>
            <tr><td>Pin Code<br><br></td><td><input type="text" name="sup_pin" required="required"><br><br></td></tr>
            <tr><td>Email<br><br></td><td><input type="email" name="sup_email" required="required"><br><br></td></tr>
            <tr><td>UserName<br><br></td><td><input type="text" name="sup_username" id="sup_username" required="required"  onkeyup="loadXMLDoc()"><br><span id="err"> </span><br></td></tr>
		<!--	<tr><td>ID.no<br></td><td><input type="text" name="sup_idno" required="required"><br></td></tr> -->
            <tr><td>Password<br><br></td><td><input type="password" id="pass1" name="sup_password" required="required"><br><br></td></tr>
            <tr><td>Conform Password<br><br></td><td><input type="password" id="pass2" name="sup_conformpassword" required="required" onkeyup="checkPass(); return false;"><br><span id="confirmMessage"></span><br></td></tr>
             </table>
            <br><input type="submit" value="REGISTER IN" style="color:#666699;font-family:cursive;"><br><br>
            </form> </center>
			
    </body>
</html>
