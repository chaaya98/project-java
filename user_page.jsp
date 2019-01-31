<%@page import="java.io.*"%>
<%@page import="java.sql.*" %> 

<html>
<head><title>AuctionUserPage</title></head>
<body>
<% 
   String name=request.getParameter("sup_name");
   String address=request.getParameter("sup_address");
   String phone=request.getParameter("sup_phone");
   String city=request.getParameter("sup_city");
   String state=request.getParameter("sup_state");
   String pin=request.getParameter("sup_pin");
   int npin=Integer.parseInt(pin);
   String email=request.getParameter("sup_email");
   String username=request.getParameter("sup_username");
   String password=request.getParameter("sup_password");
   //String sup_id=request.getParameter("sup_idno");
   //out.println("hello world \n");
   Connection con= null;
   try{
		 Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
		//out.println("Successfully connected");
		PreparedStatement ps= con.prepareStatement("insert into tblsupplier values(null,?,?,?,?,?,?,?,?,?)");
	//	ps.setInt(1,15000);
		ps.setString(1,name);ps.setString(2,address);ps.setString(3,phone);
        ps.setString(4,city);ps.setString(5,state);ps.setInt(6,npin);
        ps.setString(7,email);ps.setString(8,username);ps.setString(9,password);
		int row=ps.executeUpdate();
		if(row==1) {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select sup_id from tblsupplier where username = '" + username + "' ") ; 
			if(!rs.next()) {
                out.println("Sorry, cannot place the provided user.ID. ");
            } else {
   %>
		
		<%@include file= "user_login.jsp" %>
		<h3 style="color:#666699;text-align:center;">Register Successfully and your UserID is <span style="color:red;"><%= rs.getString(1) %></span>..now <a href="user_login.jsp" style="text-decoration:none">LOG-IN</a></h3>	
	<%	
	   return;
	  } 
	  return;
		}   
    }
	finally{
		try{
			 
			 con.close();
			
		}

    catch(Exception ex){ %>
		
		<%@include file="user_register.jsp" %>
		<h3 style="color:#666699;">Data not entered correctly...Re-enter it please </h3>
	<% out.println(ex.getMessage());
	 
   }
	}
%>
</body>

</html>