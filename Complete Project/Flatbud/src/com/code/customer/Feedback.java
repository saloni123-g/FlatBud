package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;

@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String feedback= request.getParameter("feedback");
		String stars= request.getParameter("stars");
		
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();

		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `feedback`(`feedback`, `stars`, `email`) VALUES ('"+feedback+"','"+stars+"','"+email+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Feedback Done");
				response.sendRedirect("CustomerHome.jsp?Insert");

			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("RatingFeedback.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}