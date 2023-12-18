
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
						<jsp:include page="Header/mainHeader.jsp"></jsp:include>						
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
											<a href="#"><br> <img src="Images/AC_Hotel_Valencia.jpg" alt=""
												style="width: 90%; height:90%"></a>
										</div>
									</div>
								</div>
							</div>
							
							<!-- <h4>Bidding Time</h4> -->
							<div class="span7">
								<h2>Welcome To Hotel Umai Restaurant </h2>
								<!-- <h3>Feel Free to Contact Us </h3> -->
								<hr class="soft" />
																	
									<!-- <div class="control-group">
										<label class="control-label"><span><b>Hotel Name : </b> </span></label>
										<label class="control-label"><span><b>Hotel Valencia</b> </span></label>
									</div> -->
									<div class="control-group">
										<p>A hotel reservation system is a software application that is implemented by hotels to allow guests to create secure online reservations. 
										The hotel reservation system can be synced, not only with your current website, but also with Facebook. This allows guests to reserve rooms in a way that is convenient for them via social media.
										In addition to allowing guests to book online directly, these reservation systems can also provide hotel operators with additional resources.
										For example, a channel manager may be a part of the reservation system, giving hotel operators the chance to distribute their products and live availability simultaneously to their entire network of online agents.</p>
									</div>
									<!-- <div class="control-group">
										<label class="control-label"><span><b>Address :</b> </span></label>
										<label class="control-label"><span>Hotel Valencia, ABC Junction, UK (United Kingdom) </span></label>
									</div>
									
									<div class="control-group">
										<label class="control-label"><span><b>Contact No. :</b> </span></label>
										<label class="control-label"><span>+91 8888888888</span></label>
									</div> -->
									
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
			<p class="pull-right"><a href="https://www.google.com/maps/"><img style="width: 20%" src="Images/map.jpg"></a></p>
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