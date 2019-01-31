<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>






<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String consultant=request.getParameter("search").toString(); 
String buff1="<div id='hint'>";
String buff2="<input type='text' name='user_raitem_no' value=''>";
String buff3="<input type='text' name='user_raqty_req' value=''>";
String buff4="<input type='text' name='user_raest_rt' value=''>";
String buff5="<input type='text' name='user_radly_dt' value=''>";
String buff6="<input type='text' name='user_ra_strt_date' value=''>";
String buff7="<input type='text' name='user_ra_end_date' value=''>";


try{
  Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ra",
            "root","");
			
    Statement st = con.createStatement(); 
ResultSet rs = st.executeQuery("Select item_no,qty_reqd,est_rate,dely_date,ra_start_date,ra_stop_date from tblita where ita_no= '"+consultant+"'" ); 

while(rs.next())
{  
  buff1="ita no.  exists"+"<br>";
  
  buff2="<input type='text' name='user_raitem_no' value='"+rs.getString(1)+"'>";
  buff3="<input type='text' name='user_raqty_req' value='"+rs.getString(2)+"'>";
  buff4="<input type='text' name='user_raest_rt' value='"+rs.getString(3)+"'>";
  buff5="<input type='text' name='user_radly_dt' value='"+rs.getString(4)+"'>";
  buff6="<input type='text' name='user_ra_strt_date' value='"+rs.getString(5)+"'>";
  buff7="<input type='text' name='user_ra_end_date' value='"+rs.getString(6)+"'>";
  
 
} 
buff1=buff1+"</div>";
buff2=buff2+"</input></div>"; 
buff3=buff3+"</input>";
buff4=buff4+"</input>";
buff5=buff5+"</input>";
buff6=buff6+"</input>";
buff7=buff7+"</input>";
response.getWriter().println(buff1+"brk"+buff2+"brk"+buff3+"brk"+buff4+"brk"+buff5+"brk"+buff6+"brk"+buff7);
}
catch(Exception e)
{
    System.out.println(e);
}
%>


</body>

</html>