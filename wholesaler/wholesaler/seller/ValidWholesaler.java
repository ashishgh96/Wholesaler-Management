package com.wholesaler.seller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;


public class ValidWholesaler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int flag=0;
		String ID=request.getParameter("WUname");
		String pwd=request.getParameter("WPass");
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
		
		String sql="SELECT *FROM WHOLESALER_1";
		try
		{
			ResultSet rs=stmt.executeQuery(sql);
			if("".equals(ID.trim()) && "".equals(pwd.trim()))
				message="Empty Wholesaler's Password And UserID";
			else if("".equals(ID.trim()))
				message="Empty Wholesaler's UserID";
			else if("".equals(pwd.trim()))
				message="Empty Wholesaler's Password";
			else
			{
				while(rs.next())
				{
					String r_username=rs.getString("w_username");
					String r_password=rs.getString("w_password");
					if(r_username.equals(ID))
					{
						if(r_password.equals(pwd))
						{
							rd=request.getRequestDispatcher("/WholesalerHome.jsp");
							HttpSession session=request.getSession();
							session.setAttribute("user_name",rs.getString(1));
							session.setAttribute("user_id",r_username);
							flag=1;
							break;
						}
					}
				}
				if(flag==0)
				{
					message = "Invalid Wholesaler's Password/UserID";
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
