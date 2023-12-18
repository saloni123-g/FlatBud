<%@page import="com.db.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title><jsp:include page="projectTitle.jsp"></jsp:include></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="style.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div id="gototop"></div>
		<header id="header">
		<div class="row">
			<div class="span4">
				<h1>
					<a class="logo" href="index.jsp"><span><jsp:include
								page="projectTitle.jsp"></jsp:include></span> <img
						src="assets/img/umai.png"
						alt="bootstrap sexy shop"> </a>
				</h1>
			</div>
			<div class="span4 alignR"></div>
		</div>
		</header>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<jsp:include page="Header/FlatMateHeader.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
				<div class="span12">
					<div class="well well-small">
						<div class="row-fluid">
							<div class="span5">
								<div id="myCarousel">
									<div class="carousel-inner">
										<div class="item active">
											<a href="#"> <img src="products/img11.png" alt=""
												style="width: 90%; height:50%"></a>
										</div>
									</div>
								</div>
							</div>
							
							<!-- <h4>Bidding Time</h4> -->
							<div class="span7">
								<h2>Welcome To FlatBud </h2>
								<h3>Check Customer Profile</h3>
								
								<%
									String email=request.getParameter("email"); 
									String request_for=request.getParameter("request_for"); 
									System.out.println("Cust Req= "+request_for);
									Connection con=ConnectionProvider.getConnection();
									PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `customer_details` where email='"+email+"'");
									ResultSet rs1 = ps1.executeQuery();
									int i=0;
									if(rs1.next()) 
									{
										PreparedStatement ps = con.prepareStatement("SELECT * FROM `booking_request` where request_for='"+request_for+"'");
										ResultSet rs = ps.executeQuery();
										if(rs.next()) 
										{
										i=i+1;
										String flatmate_reply = rs.getString("flatmate_reply");
										System.out.println(flatmate_reply);
								%>
										<table id="customers" style="width:65%;">
											<tr>
												<th>Name</th>
												<td class="techSpecTD1"><%=rs1.getString("name")%></td>
											</tr>
											<tr>
												<th>Address</th>
												<td class="techSpecTD1"><%=rs1.getString("address")%></td>
											</tr>
											<tr>
												<th>Email ID</th>
												<td class="techSpecTD1"><%=rs1.getString("email")%></td>	
											</tr>
											<tr>
												<th>Mobile No</th>										
												<td class="techSpecTD1"><%=rs1.getString("mobile")%></td>
											</tr>
											<tr>
												<%-- <td colspan="2" align="center"><a class="button" href="ProfileVerified?email=<%=rs1.getString("email")%>&&request_for=<%=rs.getString("request_for")%>" title="Edit"><input type="submit" value="Send Respond to Owner" class="button"></a></td> --%>
												<%if(flatmate_reply.equals("Pending")){ %>
												<td colspan="2" align="center"><a class="button" href="ProfileVerified?email=<%=rs1.getString("email")%>&&request_for=<%=rs.getString("request_for")%>" style="background: yellow;"><input type="submit" value="Send Respond to Owner" class="button"></a></td>
												<%}else{ %>
												<td colspan="2" align="center" style="background: Pink;color: white;">Conform</td>
											</tr>
											<%}}}%>
										</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<div class="copyright">
			<div class="container">
				<p class="pull-right"></p>
				<span>Copyright &copy; FlatBud: The Flatmate Searching Website
				</span>
			</div>
		</div>
		<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script src="assets/js/shop.js"></script>
</body>
</html>