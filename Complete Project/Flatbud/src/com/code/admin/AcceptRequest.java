package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet("/AcceptRequest")
public class AcceptRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AcceptRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		System.out.println("Request Id:= "+id);
		
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE `product_details` SET action='Accept' WHERE id = '"+id+"'");
			ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("UPDATE `booking_request` SET status='Accept' WHERE request_for = '"+id+"'");
			ps1.executeUpdate();
			response.sendRedirect("CustBookings.jsp?update");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
