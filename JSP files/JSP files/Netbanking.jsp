<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Netbanking details:</title>
<style>
.button {
    background-color: #4CAF50; /* Green */
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
		<%String msg="";
try
{
	if(session.getAttribute("user_id")==null)
		msg="Sign In";
	else
		msg=session.getAttribute("user_name").toString();
}
catch(Exception e){}
if("Sign In".equals(msg))
	response.sendRedirect("Login.jsp");
	 %>
	 <h3><div align="right">Welcome,<a href="LogoutUser.jsp"><%=msg  %></a>&nbsp;&nbsp;</div></h3>
	 <ul>
  		<li><a class="active" href="RetailerHome.jsp">Home</a></li>
	</ul>
	<div align="center">
	<h4><b>Enter netbanking details:</b></h4>
	<select>
	  <option >State Bank of India</option>
	  <option >Allahabad Bank</option>
	  <option >Canara Bank</option>
	  <option >ICICI Bank</option>
	  <option >Yes Bank</option>
	  <option >HDFC Bank</option>
	  <option >Bandhan Bank</option>
	  <option >Punjab National Bank</option>
	</select>
	<br><br>
 
	<form action="CANCEL_ORDER" method="post">
		<a href="OrderConfirmed.jsp" ><input class="button" type="button" value="Proceed"></a>
		<input  class="button" type="submit" value="cancel">
	</form>
	</div>
	<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
</body>
</html>