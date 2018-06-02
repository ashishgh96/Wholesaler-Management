<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
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
		<h2>Orders Enlisted:</h2>
	</div>
	
	<% 
			String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
			String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");
			String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
            Connection connection = DriverManager.getConnection(url, dbuserId, dbpassword);
            Statement statement = connection.createStatement() ;
            Statement stmt=connection.createStatement() ;
            Statement stmt2=connection.createStatement() ;
	%>

	<div align="center">
		
		<form action="ReflectOrder" method="post">
		 <TABLE BORDER="1">
            <TR>
            	<th>Sl. No.</th>
            	<th>check</th>
            	<th>Order ID</th>
            	<th>Retailer Name</th>
                <TH>Product ID</TH>
                <TH>Product Name</TH>
                <TH>Product Brand</TH>
                <TH>Unit of measurement</TH>
                <TH>Rate</TH>
                <th>Quantity</th>
                
            </TR>
            <% 
            ResultSet resultset = statement.executeQuery("select * from wholesaler_orders") ;
            ResultSet rs1=null;
            ResultSet rs=null;
            int count=0;
            while(resultset.next()){ count++;%>
            
            <TR>
            	<td><%=count %>.</td>
            	<td><input type="checkbox" name="order_<%=resultset.getString(1)%>"/></td>
            	
            	<td><%=resultset.getString(1) %></td>
                 <%
                 String ProdName="";
                 String ProdBrand="";
                 String ProdUom="";
                 String ProdRate="";
                 String RetName="";
                 rs1=stmt.executeQuery("select * from retailer_list");
                 int f1=0;
                 while(rs1.next() && f1==0)
                 {
                	 if(resultset.getString(2).equals(rs1.getString(1)))
                	 {
                		 RetName=rs1.getString(2);
               			 f1=1;
                	 }
                 }
                 
               	 rs=stmt2.executeQuery("select * from products ");
               	 int f2=0;
               	 while(rs.next() && f2==0)
               	 {
               		 if(resultset.getString(3).equals(rs.getString(1)))
               		 {
               			  ProdName=rs.getString(2);
			 	 		ProdBrand=rs.getString(4);
			 	 		ProdUom=rs.getString(6);
			 	 		ProdRate=rs.getString(3);
					 	 f2=1;
               		 }
               	 }
                %>
                <td><%=RetName %></td>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= ProdName %></TD>
                <TD> <%= ProdBrand %></TD>
                <TD> <%= ProdUom %></TD>
                <TD> Rs.<%= ProdRate %></TD>
                <TD> <%= resultset.getString(4) %></TD>
            </TR>
            <% } 
           		connection.close();
            	statement.close();
            	stmt.close();
            	 stmt2.close();
            	%>
            <br>
        </TABLE>
        
       <input class="button" type="submit"  value="Confirm delivery">
       </form>
	</div> 
	<div style="footer">
		<%@include file="footer.jsp" %>
	</div>
</body>

</html>