<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.conn.ConnectionProvider"%>
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
</head>
<body>
<%
	if(request.getParameter("add")!=null)
	{
	out.println("<script>alert('Product Added Successful ...!')</script>");	
	}

	if(request.getParameter("delete")!=null)
	{
	out.println("<script>alert('Product Deleted Successful ...!')</script>");	
	}

%>
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
						<jsp:include page="Header/adminHeader.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
		
				<div class="well well-small">
					<h3 align="center">View Flats</h3>
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div>
							<div class="carousel-inner">
								<div class="item active" align="center">
									<ul class="thumbnails">
										<%
											Connection con = ConnectionProvider.getConnection();
											PreparedStatement ps = con
													.prepareStatement("select * from product_details where upload_by='Admin'");
											ResultSet rs = ps.executeQuery();
											int count=0;
											while (rs.next()) 
											{
												count=count+1;
												String file_name = rs.getString("file_name");
												String id = rs.getString("id");
										%>

										<li class="span3">

											<div class="thumbnail">
												<div class="caption cntr">
													<h4><%=rs.getString("category")%></h4>
													<img src="products/<%=file_name%>" alt="bootstrap-ring">
													<p><%=rs.getString("p_name")%></p>

													<p>
														<img alt="" src="products/r.jpg" style="width: 15%"><strong><i class="fa fa-inr" style="font-size:14px">&nbsp;<%=rs.getString("base_price")%></strong>
													</p>
													
													<h4>
														<a class="shopBtn"
															href="DeleteAdminProducts?id=<%=rs.getString("id")%>"
															title="add to cart"> Delete Product</a>
														<hr />	
														<a class="shopBtn"
															href="UpdateProduct.jsp?id=<%=rs.getString("id")%>"
															title="Update"> Update Rooms</a>
													</h4>
													<hr />
													<p><%=rs.getString("specification")%></p>
										
													<br class="clr">
												</div>
											</div>
										</li>
										<%
											int rsl=count%4;
											System.out.println("RSL "+rsl);
											if(rsl==0)
											{
												%>
												</ul>
												<hr/>
												<%
											}
										%>

										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	<div class="copyright">
		<div class="container">
			<p class="pull-right"></p>
			<span>Copyright &copy; FlatBud: The Flatmate Searching Website.
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