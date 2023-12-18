package com.code.customer;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.conn.ConnectionProvider;
//import com.util.GlobalVariable;


@WebServlet("/FotgetPassword")
public class FotgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		String email = request.getParameter("email");
   		String password = request.getParameter("password");
   		Connection con=ConnectionProvider.getConnection();
		String confirmPassword = request.getParameter("confirmPassword");
		//String user = request.getParameter("user");
		//Boolean	isMailAvailable = GlobalVariable.getEmail(email, user);
   		
   			if(password.equals(confirmPassword))
   			{
   				String query = "update customer_details set password = '"+password+"' where email = '"+email+"'";
   				PreparedStatement prepareStatement;
				try {
					prepareStatement = con.prepareStatement(query);
					prepareStatement.executeUpdate();
					System.out.println("Password changed successfully");
					response.sendRedirect("index.jsp?success");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
   			}
   			else
   			{
   				System.out.println("Password not Match");
   				response.sendRedirect("index.jsp?error");
   			}	
   		}
   			
   	}
