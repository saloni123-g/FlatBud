package com.code.flatmate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conn.ConnectionProvider;

@WebServlet("/ProfileVerified")
public class ProfileVerified extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileVerified() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String request_for = request.getParameter("request_for");
		System.out.println("Request Id:= "+email+request_for);
		
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE `booking_request` SET flatmate_reply='Accept' WHERE email='"+email+"' AND request_for='"+request_for+"'");
			ps.executeUpdate();
			response.sendRedirect("CustomerRequest.jsp?update");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
