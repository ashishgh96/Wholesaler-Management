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
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String message=null;
		HttpSession session=request.getSession();
		RequestDispatcher rd=request.getRequestDispatcher("/DeleteAccount.jsp");
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
		java.sql.Statement stmt1=null;
		try
		{
			stmt1=con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//Display data from database
		
		String sql="delete FROM retailer_list where r_id='"+session.getAttribute("user_code")+"'";
		try
		{
			stmt1.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		//step 5-
		try
		{
			con.close();
			stmt1.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		message="Account deleted succesfully";
		rd=request.getRequestDispatcher("/Login.jsp");
		request.setAttribute("key",message);
		rd.forward(request, response);
	}

}
