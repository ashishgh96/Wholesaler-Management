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


public class ValidRetailer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		int flag=0;
		String ID=request.getParameter("RUname");
		String pwd=request.getParameter("RPass");
		
		RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
		
		String message=null;
		try
		{
				Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		//Step 2
		String dbuserId = getServletConfig().getServletContext().getInitParameter("DB_USER");
		String dbpassword = getServletConfig().getServletContext().getInitParameter("DB_PASS");
		String url = getServletConfig().getServletContext().getInitParameter("DB_URL");
		
		Connection con=null;
		try {
			con = DriverManager.getConnection(url, dbuserId, dbpassword);
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		// step 3-
		
		java.sql.Statement stmt=null;
		try
		{
			stmt=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//Display data from database
		
		String sql="SELECT *FROM RETAILER_LIST";
		try
		{
			ResultSet rs=stmt.executeQuery(sql);
			if("".equals(ID.trim()) && "".equals(pwd.trim()))
				message="Empty Retailer's Password And UserID";
			else if("".equals(ID.trim()))
				message="Empty Retailer's UserID";
			else if("".equals(pwd.trim()))
				message="Empty Retailer's Password";
			else
			{
				while(rs.next())
				{
					String r_username=rs.getString("r_username");
					String r_password=rs.getString("r_password");
					if(r_username.equals(ID))
					{
						if(r_password.equals(pwd))
						{
							rd=request.getRequestDispatcher("/RetailerHome.jsp");
							flag=1;
							HttpSession session=request.getSession();
							session.setAttribute("user_code",rs.getString(1));
							session.setAttribute("user_id",r_username);
							session.setAttribute("user_name",rs.getString(2));
							session.setAttribute("user_contact",rs.getString(5));
							session.setAttribute("user_address",rs.getString(6));
							break;
						}
					}
				}
				if(flag==0)
				{
					message = "Invalid Retailer's Password/UserID";
					rd=request.getRequestDispatcher("/Login.jsp");
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//step 5-
		try
		{
			con.close();
			stmt.close();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}				
		request.setAttribute("key",message);
		rd.forward(request, response);
	}
}
