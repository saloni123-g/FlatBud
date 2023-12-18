<%@page import="com.code.customer.DateTimeDifference"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.code.admin.GlobalFunction"%>
<%@page import="jdk.nashorn.internal.objects.Global"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.conn.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
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
						<jsp:include page="Header/CustomerHeader.jsp"></jsp:include>						
						</div>
					</div>
				</div>
			</div>		
			
<%
	if(request.getParameter("delete")!=null)
	{
	out.println("<script>alert('Product remove from Cart...!')</script>");	
	}
%>
			
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
							
							<%
							LocalDate localDate = LocalDate.now();
							%>
							<div class="span7">
								<h2>Welcome To FlatBud </h2>
								<h3>Search Flat Availability </h3>
								<hr class="soft" />
									<div class="control-group">
										<label class="control-label"><span><b>Check-In Date :</b> </span></label>
										<input type="date" placeholder="Enter Check-In Date" class="form-control" name="p_name" value="<%=localDate %>" required="required">
									</div>
									
									<div class="control-group">
										<label class="control-label"><span><b>Location :</b> </span></label>
										<input type="text" placeholder="Enter Location" class="form-control" name="p_name" required>
									</div>
									
									<div class="control-group"><button type="button" class="btn btn-success">
										<a href="CustViewProducts.jsp"><b class="shopBtn"><u>Check Availability</u></b></a></button>
									</div>
								</div>
							</div>
				
							<hr class="softn clr" />
							
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