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
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String message=null;
		RequestDispatcher rd=request.getRequestDispatcher("/ForgotPassword.jsp");
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
		try
		{
			stmt=con.createStatement();
			stmt1=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		 // STEP 4 EXECUTE THE QUERY
		
		//INSERTION
		
		String sql1="select *from retailer_list";
		String user_ID=request.getParameter("UID");
		String sql="update retailer_list set r_password='"+request.getParameter("UPassword")+"' where r_username='"+user_ID+"'";
		int flag=0;
		try
		{
			ResultSet rs=stmt.executeQuery(sql1);
			while(rs.next())
			{
				if(rs.getString(3).equals(user_ID))
				{
					stmt1.executeUpdate(sql);
					flag=1;
					break;
				}
			}
			if(flag==1)
			{
				message="Password updated successfully";
				rd=request.getRequestDispatcher("/Login.jsp");
			}
			else
			{
				message="Retailer not found in database. Try again!";
				rd=request.getRequestDispatcher("/ForgotPassword.jsp");
			}
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
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		request.setAttribute("key",message);
		rd.forward(request, response);
	}

}
