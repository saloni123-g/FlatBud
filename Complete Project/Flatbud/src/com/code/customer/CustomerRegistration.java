package com.code.customer;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet("/CustomerRegistration")
public class CustomerRegistration extends HttpServlet {
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
	
		String name= request.getParameter("name");
		String address = request.getParameter("address");
		String mobile= request.getParameter("mobile");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `customer_details`(`name`, `address`, `email`, `mobile`, `password`) VALUES ('"+name+"', '"+address+"','"+email+"','"+mobile+"','"+password+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Registration Done");
				response.sendRedirect("CustomerLogin.jsp?Done");

			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("CustomerRegistration.jsp?fail=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}