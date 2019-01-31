<%
session.setAttribute("adminuser", null);
session.invalidate();
response.sendRedirect("admin_login.jsp");
%>