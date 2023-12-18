package com.db.conn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ContentBasedFilter")
public class ContentBasedFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentBasedFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String city = session.getAttribute("city").toString();
		String category=request.getParameter("category");
		String p_name=request.getParameter("p_name");
		String seller=request.getParameter("seller");

		
		CBFAlgorithm cbfAlgo = new CBFAlgorithm();
		cbfAlgo.algorithm(city,category,p_name,seller);
		response.sendRedirect("CustViewProducts.jsp?result");
	}

}
