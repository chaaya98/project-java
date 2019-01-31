
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
            String username=request.getParameter("ver");
 
                    Class.forName("com.mysql.jdbc.Driver");
		            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from tblsupplier where username='"+username+"' ");  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Name already taken");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
 
%>