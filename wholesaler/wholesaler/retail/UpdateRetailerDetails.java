package com.wholesaler.retail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UpdateRetailerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String message=null;
		HttpSession session=request.getSession();
		RequestDispatcher rd=request.getRequestDispatcher("/UpdateRetailerDetails.jsp");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
				
		//STEP 2   CREATE THE CONNECTION
		String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
		String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");
		String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
		Connection con=null;
		try {
			con = DriverManager.getConnection(url, dbuserId, dbpassword);
		
		}
		catch(Exception e)
		{
		
		}
		
		// STEP 3- CREATE THE STATEMENT
		java.sql.Statement stmt=null;
		java.sql.Statement stmt1=null;
		java.sql.Statement stmt2=null;
		java.sql.Statement stmt3=null;
		try
		{
			stmt=con.createStatement();
			stmt1=con.createStatement();
			stmt2=con.createStatement();
			stmt3=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		 // STEP 4 EXECUTE THE QUERY
		
		//INSERTION
		
		String sql1="select *from retailer_list";
		String Retailer_name=request.getParameter("Retailer_name");
		String Retailer_contact=request.getParameter("Retailer_contact");
		String Retailer_address=request.getParameter("Retailer_address");
		String ID=session.getAttribute("user_id").toString();
		String sql="update retailer_list set r_name='"+Retailer_name+"' where r_username='"+ID+"'";
		String sql2="update retailer_list set r_contact='"+Retailer_contact+"' where r_username='"+ID+"'";
		String sql3="update retailer_list set r_address='"+Retailer_address+"' where r_username='"+ID+"'";
		session.setAttribute("user_name",Retailer_name);
		session.setAttribute("user_contact",Retailer_contact);
		session.setAttribute("user_address",Retailer_address);
		try
		{
			ResultSet rs=stmt.executeQuery(sql1);
			while(rs.next())
			{
				if(rs.getString(3).equals(ID))
				{
					stmt1.executeUpdate(sql);
					stmt2.executeUpdate(sql2);
					stmt3.executeUpdate(sql3);
					
					break;
				}
			}
				message="Details updated successfully!";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//STEP 5-  RELEASE THE QUERY 

		try
		{
			con.close();
			stmt.close();
			stmt1.close();
			stmt2.close();
			stmt3.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		rd=request.getRequestDispatcher("/LogoutUser.jsp");
		request.setAttribute("key",message);
		rd.forward(request, response);
	}

}
