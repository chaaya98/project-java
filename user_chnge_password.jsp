<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USERS_LOGIN</title>
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
     </script>   
    </head>
    <body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <nav>
		 <a href="index.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">HOME</a> |
		 <a href="user_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">USER</a> | 
		 <a href="admin_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">ORGANIZATION</a> |
		 </nav>
		<center> 
		 <form method="POST" action="user_chnge_passdb.jsp" >
		 <table style="color:#666699;font-family:cursive">
		 <tr>
		 <td>Username<br><br></td><td><input type="text" name="usernamef"><br><br></td>
		 </tr>
		 <tr>
		 <td>Phone No.<br><br></td><td><input type="text" name="phonef"><br><br></td>
		 </tr>
		 <tr>
		 <td>NEW Password<br><br></td><td><input type="password" id="pass1" name="chngepass"><br><br></td>
		 </tr>
		 <tr>
		 <td>Conform Password<br><br></td><td><input type="password"  id="pass2" name="newchngepass" onkeyup="checkPass(); return false;"><br><span id="confirmMessage"></span><br></td>
		 </tr>
		 </table>
		 <input type="submit" value="CHANGE PASSWORD" style="color:#666699;font-family:cursive;">
		 </form>
		 </center>
		 </body>
		 
</html>