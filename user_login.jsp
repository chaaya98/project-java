

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USERS_LOGIN</title>
        
    </head>
    <body style="background-color:#D8D8D8;">
        <h1 align="center" style="background-color:#666699;color:#E6E6B8;">VISAKHAPATNAM STEEL PLANT<br>REVERSE AUCTION PORTAL</h1>
        <nav>
		 <a href="index.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">HOME</a> |
		 <a href="user_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">USER</a> | 
		 <a href="admin_login.jsp" style="color:#666699;text-decoration:none;font-size:27px;font-family:cursive">ORGANIZATION</a> |
		 </nav>
		 
            <form action="user_loggedin.jsp" method="POST" style="text-align:center;">
                    <center><table style="color:#666699;font-family:cursive;">
                    <tr>
                        <td>USER-NAME<br></td>
                    <td><input type="text" name="user_name" required="required"><br></td>
                    </tr> 
					<!--<tr>
                        <td>USER-ID<br></td>
                    <td><input type="text" name="user_id" required="required"><br></td>
                    </tr> -->
                    <tr>
                        <td>PASSWORD<br></td>
                    <td><input type="password" name="user_password" required="required"><br></td>
                    </tr>
					    <td>PHONE.NO<br></td>
                    <td><input type="text" name="user_phone" required="required"><br></td>
                    </tr>
                        </table></center>
                <input type="submit" value="LOGIN" name="user_login" style="color:#666699;font-family:cursive;"><br><br>
                <a href="user_register.jsp" style="align:center;text-decoration:none;">NEW then REGISTER HERE?</a><br><br>
                <a href="user_chnge_password.jsp" style="align:center;text-decoration:none;">FORGET PASSWORD change HERE?</a>
                </form>
           
		   
    </body>
    <!--<br><br> <footer style="text-align:center;">Copy rights:VSP RINL</footer> -->
<footer style="text-align:center;font-family:cursive; position: absolute;
    bottom: 0; 
     width: 1350px;
    height: 27px;">
&copy Designed & Developed by A-TEAM

</footer> 	
</html>
