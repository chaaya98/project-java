<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head><title>ORGANIZATION LOGIN</title></head>
 <body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
 <nav>
		 <a href="index.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive;">HOME</a> |
		 <a href="user_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive;">USER</a> | 
		 <a href="admin_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive;">ORGANIZATION</a> |
		 </nav>
 <center> <p style="color:#666699;font-family:cursive;">ORGANIZATION LOGIN</p>
		 <form method="POST" action="admin_loggedin.jsp">
		 <table style="color:#666699;font-family:cursive;">
		   <tr>
		   <td>USER.ID<br><br></td><td><input type="text" name="admin_id"><br><br></td>
		   </tr>
		   <tr>
		   <td>USER NAME<br><br></td><td><input type="text" name="admin_name"><br><br></td>
		   </tr>
		   <tr>
		   <td>PASSWORD<br><br></td><td><input type="password" name="admin_password"><br><br></td>
		   </tr>
		   </table>
		  <input type="submit" value="SUBMIT" style="color:#666699;font-family:cursive;" >
		 </form></center>
 </body>	
<footer style="text-align:center;font-family:cursive; position: absolute;
    bottom: 0; 
     width: 1350px;
    height: 27px;">
&copy Designed & Developed by A-TEAM

</footer> 
</html>