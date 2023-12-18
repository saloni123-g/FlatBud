package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.db.conn.ConnectionProvider;

@WebServlet("/SendRequest")
public class SendRequest extends HttpServlet {
		private static final long serialVersionUID = 1L;

	    public SendRequest() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			HttpSession session=request.getSession();
			String id = request.getParameter("id");
			String email=session.getAttribute("email").toString();
			System.out.println("Request Id:= "+id);
			
			DateFormat df = new SimpleDateFormat("dd/MM/yy");
			Date dateobj = new Date();
			String c_date = df.format(dateobj);
			System.out.println("Date1= "+c_date);
			
			try {
				Connection con = ConnectionProvider.getConnection();
				PreparedStatement ps = con.prepareStatement("UPDATE `product_details` SET action='BookingRequest' WHERE id = '"+id+"'");
				ps.executeUpdate();
				
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `booking_request`(`email`, `request_for`, `request_date`) VALUES ('"+email+"', '"+id+"','"+c_date+"')");
				System.out.println("Insert= "+ps1);
				ps1.executeUpdate();
				response.sendRedirect("CustViewProducts.jsp?update");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
