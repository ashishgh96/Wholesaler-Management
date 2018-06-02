<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Details</title>
<style>
	


table {
    border-collapse: collapse;
    width: 100%;
}

th, td 
{
    text-align: left;
    padding: 8px;
}
tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #404040;
    color: white;
}
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    background-color: #555555;
}
</style>
</head>
<body>
<div style="header">
		<%@include file="header.jsp" %>
	</div>
	<%! String message=null;%>
			<%
				message=(String)request.getAttribute("key");
				if(message==null)
					message="";
			%>
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
	
<ul>
  	<li><a class="active" href="RetailerHome.jsp">Home</a></li>
</ul>
<br>
<div align="center"><font color="RED"><%= message %></font></div>
	<h3><div align="center">Welcome!<%=session.getAttribute("user_name") %></div></h3>
	
	<table>
		<tr><td><h4>Name </td>:<td><%=session.getAttribute("user_name") %></h4></td></tr>
		<tr><td><h4>Contact </td>:<td><%=session.getAttribute("user_contact")  %></h4></td></tr>
		<tr><td><h4>Address </td>:<td><%=session.getAttribute("user_address")  %></h4></td></tr>
	</table>

<form action="LOGOUT" method="post">

	<div align="center">
	
	<a href="UpdateRetailerDetails.jsp"><input class="button" type="button" value="Update Details"></a>
	<input class="button" type="submit" value="Logout">
	<a href="RetailerHome.jsp" ><input class="button" type="button" value="Home"></a>
	<a href="DeleteAccount.jsp"><input class="button" type="button" value="Delete Account"></a>
	</div>
</form>

	<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
</body>
</html>