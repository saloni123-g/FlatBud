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
<script>
function Validate()
{ 
    var y = document.ureg.card_no.value;
   
   if(isNaN(y)||y.indexOf(" ")!=-1)
   {
	   ureg.card_no.value="";
	   ureg.card_no.focus();
      alert("Enter numeric value");
      return false;
   }
    if (ureg.card_no.value.length!=10)
   {
        alert("enter 12 digits");
        return false;
   } 
   
   if (!y.match(/^[0-9]+$/) 
   		&& y != "") {
   	y = "";
   	ureg.card_no.focus();
       alert("Please Enter only Digits in text");
   }
}

function ValidateNew()
{ 
    var y = document.ureg.cvv.value;
   
   if(isNaN(y)||y.indexOf(" ")!=-1)
   {
	   ureg.cvv.value="";
	   ureg.cvv.focus();
      alert("Enter numeric value");
      return false;
   }
    if (ureg.cvv.value.length!=10)
   {
        alert("enter 3 digits");
        return false;
   } 
   
   if (!y.match(/^[0-9]+$/) 
   		&& y != "") {
   	y = "";
   	ureg.cvv.focus();
       alert("Please Enter only Digits in text");
   }
}

</script>
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
		<div class="row">
			<div class="span12">
				<div class="well np">
					<div id="myCarousel" class="carousel slide homCar">
						
				</div>
				<%
					String id=request.getParameter("id");
					//String base_price=session.getAttribute("base_price").toString(); 
					//String totalPrice=request.getParameter("totalPrice");
					String r_id=request.getParameter("r_id");
					
					Connection con=ConnectionProvider.getConnection();
					PreparedStatement ps = con.prepareStatement("SELECT * FROM `product_details` where id='"+id+"'");
					//System.out.println("PS= "+ps);
					ResultSet rs = ps.executeQuery();
					if (rs.next()) 
					{
						String base_price=rs.getString("base_price");
						System.out.println("Amount= "+base_price);
				%>
				
				<div class="well well-small">
					<hr class="soften" />
					<div class="row-fluid" align="center">
						<div id="newProductCar" class="carousel slide">
							<div class="carousel-inner">
							
								<div class="item active" align="center">
									<h1>Welcome</h1>
									<hr/>
									<form action="PaymentProcess1" name="ureg" method="POST">
										<table style="width: 50%">
											<tr>
												<th>Amount</th>
												<td><input type="hidden" name="p_id">
												<input type="hidden" name="base_price" value="<%=base_price %>"><h3><%=base_price %></h3></td>
											</tr>
											<tr>
												<th>Card Number</th>
												<td><input type="text" class="form-control" name="card_no" maxlength="12" onblur="Validate()" required></td>
											</tr>
											<tr>
												<th>Month and Year</th>
												<td><input type="month" class="form-control" name="month_year" required></td>
											</tr>
											<tr>
												<th>CVV Number</th>
												<td><input type="text" maxlength="3" class="form-control" name="cvv" onblur="ValidateNew()" required></td>
											</tr>
											<tr>
												<th></th>
												<td><button type="submit" class="btn btn-success">Pay</button></td>
											</tr>
										</table>
										</form>
										<%}%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->

		<div class="copyright">
			<div class="container">
				<p class="pull-right"></p>
				<span>Copyright &copy; FlatBud: The Flatmate Searching Website
				</span>
			</div>
		</div>
		<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script src="assets/js/shop.js"></script>
</body>
</html>