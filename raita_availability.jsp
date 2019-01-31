
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<% 
  String username=(String)session.getAttribute("username");
%>
 
<%
 
            String ita=request.getParameter("ver");
			//int sita=Integer.parseInt(ita);
                try{
                    Class.forName("com.mysql.jdbc.Driver");
		            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from tblra where ita_no='"+ita+"' AND username='"+username+"' ");  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("ALREADY APPLIED THIS AUCTION");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("NOT APPLIED TO THIS AUCTION");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
				}
				catch(Exception ex){
					 out.println(ex.getMessage());
	            out.println("<h4 style='color:#666699;text-align:center;font-family:cursive;'>ANY PROBLEM CONTACT TO 9999999999 or<br> Email to xyz@gmail.com</h4>");
 
				}
 
%>