<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<%@page import="java.lang.Comparable" %>

<% 
  String adminuser=(String)session.getAttribute("adminuser");
%>

<html>
<head>
<title>PURCHASE ORDER</title>
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
	   <%
	   String poita_no=request.getParameter("po_itano");
	   int npoita_no=Integer.parseInt(poita_no);
	  try{ 
	   Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
		  Statement st=con.createStatement();
			ResultSet rs =st.executeQuery("select * from tblra where  ita_no='"+npoita_no+"' ");
			out.println(rs.next());
			
if(rs.next()){
	       Statement stt=con.createStatement();
			ResultSet rst =stt.executeQuery("select * from tblra  where rate_quoted = (select MIN(rate_quoted) as rate from tblra where ita_no= '"+npoita_no+"') ");
			if(rst.next()){
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			Date rastrtdt= rs.getDate("ra_start_date");
			Date rastpdt= rs.getDate("ra_stop_date");
			
			Date newdt=new Date();
			String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(newdt);
			
			java.util.Date d1=dateFormatter.parse(rastrtdt.toString());
			java.util.Date d2=dateFormatter.parse(rastpdt.toString());
			java.util.Date d3=dateFormatter.parse(modifiedDate);
			
			//java.util.Date ndt=dateFormatter.format(d3);
			
			int comparison = d3.compareTo(d2);
            //int comparison2 = d2.compareTo(d3);
            //int comparison3 = d3.compareTo(d3);
			
			
   if( comparison >= 0){
				
			    String poitemno= rst.getString("item_no");
		        String pousername= rst.getString("username");
		        Integer poqtyorder= rst.getInt("qty_quoted");
		        String podelydt= rst.getDate("dely_date").toString();
		        Integer porate= rst.getInt("rate_quoted");
		        Integer poraslno= rst.getInt("ra_sl_no");
		        Integer poitano= rs.getInt("ita_no");
			
			String sql="insert into tblpo values(NULL,NOW(),?,?,?,?,?,?,?) ";	
	      PreparedStatement ps= con.prepareStatement(sql);
		  ps.setString(1,poitemno);
		  ps.setString(2,pousername);
		  ps.setInt(3,poqtyorder);
		  ps.setString(4,podelydt);
		  ps.setInt(5,porate);
		  ps.setInt(6,poraslno);
		  ps.setInt(7,poitano);
		  
		  int row=ps.executeUpdate();
			if(row > 0){
				out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>INSERTED THE  NEW PO SUCCESSFULLY</h4>");
			}
			
		 }
		  else
		  {
			out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>AT PRESENT NEW P.O.CANNOT BE GENERATED because TIME not expired</h4>");
		  }		
		
			}
}
        else
		{
			out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>AT PRESENT NEW P.O.CANNOT BE GENERATED </h4>");
		}
	
		
		con.close();
	  }
catch(Exception ex){
	out.println(ex.getMessage());
	       out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
	
}	  
	 
	   
	   
	   %>
	   </center>
  <% } %>
  </body>
  
  </html>