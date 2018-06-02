<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
      <%@page import=" javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order confirmed</title>
</head>
<body>
	<div style="header">
		<%@include file="header.jsp" %>
	</div>
	<%String msg="";
try
{
	if(session.getAttribute("user_id")==null)
		msg="Sign In";
	else
		msg=session.getAttribute("user_name").toString();
}
catch(Exception e){}
%>
<%
if("Sign In".equals(msg))
	response.sendRedirect("Login.jsp");
%>

<h3><div align="right">Welcome,<a href="LogoutUser.jsp"><%=msg  %></a>&nbsp;&nbsp;</div></h3>
 <ul>
  	<li><a class="active" href="RetailerHome.jsp">Home</a></li>
</ul>
<br><br>
	<div align="center" ><h2><b>Order confirmed</b></h2></div>
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>