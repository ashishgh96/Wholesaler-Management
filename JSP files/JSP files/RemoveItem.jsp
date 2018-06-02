<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items</title>
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
	<form action="LogoutW" method="post">
	<div align="right">  <input class="button" type="submit" value="Logout"></a></div>
	</form>
	<ul>
  <li><a class="active" href="WholesalerHome.jsp">Home</a></li>
  <li><a href="RList.jsp">Retailer's List</a></li>
  <li><a href="Orders.jsp">Order list</a></li>
  <li><a href="Items.jsp">Items list</a></li>
</ul>
	 <%
	 

String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");

String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
            Connection connection = DriverManager.getConnection(url, dbuserId, dbpassword);
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from products"); 
     %>
	<div align="center">
		<h2>Enlisted Items</h2>
		<br><br>
		 <form action="RemoveItems" method="post">
	 <TABLE BORDER="1">
            <TR>
            	<th></th>
                <TH>ID</TH>
                <TH>Name</TH>
                <TH>Cost</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
            	<td><input type="checkbox" name="prod_<%=resultset.getString(1)%>"/></td>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
            </TR>
            <% } %>
        </TABLE>
        <br>
        <input class="button" type="submit"value="Remove Items">    
     </form>
	</div>
	<div style="footer">
	
		<%@include file="footer.jsp" %>
	
	</div>
</body>
</html>