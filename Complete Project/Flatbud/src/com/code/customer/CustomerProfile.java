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
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;

@WebServlet("/CustomerProfile")
public class CustomerProfile extends HttpServlet {

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
		
			String name= request.getParameter("name");
			String address = request.getParameter("address");
			String mobile= request.getParameter("mobile");
			//String email= request.getParameter("email");
			//String password= request.getParameter("password");
			
			HttpSession session=request.getSession();
			String email=session.getAttribute("email").toString();
			System.out.println("Email ID: "+email);
			
			try 
			{
				
				PreparedStatement ps1 = con.prepareStatement("UPDATE `customer_details` SET name='"+name+"', address='"+address+"', email='"+email+"', mobile='"+mobile+"' where email='"+email+"'");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Updation Done");
					response.sendRedirect("CustomerHome.jsp?Don");

				}
				else 
				{
					System.out.println("fail");
					response.sendRedirect("Profile.jsp?fail=done");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}
		}
	}