
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 
<%
 
            String ita_no=request.getParameter("ver");
 
                    Class.forName("com.mysql.jdbc.Driver");
		            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/ra","root","");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from tblpo where ita_no='"+ita_no+"' ");  // this is for name
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("ITA NO. already exist in PURCHASE ORDER check in [LIST OF PO's]");
                        out.println("</font>");
 
                    }else {
 
                        out.println("<font color=green>");
                        out.println("Not available in PURCHASE ORDER,generate P.O.");
                        out.println("</font>");
 
                    }
 
rs.close();
st.close();
con.close();
 
%>