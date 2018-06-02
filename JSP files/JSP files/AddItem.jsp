<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Item</title>
<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
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
	<form action="LogoutW" method="post">
	<div align="right">  <input class="button" type="submit" value="Logout"></a></div>
	</form>
	<ul>
  <li><a class="active" href="WholesalerHome.jsp">Home</a></li>
  <li><a href="RList.jsp">Retailer's List</a></li>
  <li><a href="Orders.jsp">Order list</a></li>
  <li><a href="Items.jsp">Items list</a></li>
</ul>
	<div align="center">
			<h1>Please enter new item details: </h1>
			<form action="NewItem" method="post">
				<table border="0" cellspacing="10" align="center">
					<tr>
						<td> Enter Item Name</td>
						<td> <input type="Text" name="IName" ></td>
					</tr>
					<tr>
						<td> Enter Item Brand</td>
						<td> <input type="Text" name="IBrand" ></td>
					</tr>
					<tr>
						<td> Enter Item Details</td>
						<td> <input type="Text" name="IDetails" ></td>
					</tr>
					<tr>
						<td> Enter Unit of measurement</td>
						<td> <input type="Text" name="IUOM" ></td>
					</tr>
					<tr>
						<td> Enter Rate</td>
						<td> <input type="Text" name="IPrice" ></td>
					</tr>
					
				
				</table>
				
				
						<input class="button" type="Submit" value="submit"/>
						<input class="button" type="reset" value="Reset"/>
						<a href="Items.jsp"><input class="button" type="button" value="Cancel"/></a>
					
			</form>
		</div>
		<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
</body>
</html>