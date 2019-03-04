<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@ page import="com.bean.ConnectionProvider" %>
<%String name=null; %>
<%String id=null; %>
<%String desig=null; %>
<%String office=null; %>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product View</title>
<link rel="icon" href="images/icon.png" type="image/png">
<link rel="stylesheet" type="text/css" href="styles/add_product.css" />
 <link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>
<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(session.getAttribute("username")==null)
	{
	response.sendRedirect("index.html");
	}
	try{  
	Connection con = ConnectionProvider.getCon();  
	PreparedStatement ps1=con.prepareStatement(  
	    "select firstname,id,designation,officeadd from AdminTable where username=?");  
	  String user=String.valueOf(session.getAttribute("username"));
	  System.out.println(user);
	ps1.setString(1,user);                
	ResultSet rs1=ps1.executeQuery(); 
	while (rs1.next()) {
	name=rs1.getString(1);
	id=rs1.getString(2);
	desig=rs1.getString(3);
	office=rs1.getString(4);
	}
	              
	}catch(Exception e){}  
%>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid" id="navdiv">
    <div class="navbar-header">
      <img src="images/NavBarLogo.PNG" style="width:70%; height:70%;">
    </div>
  
<div class="col-sm-3 col-md-3">

      <form class="navbar-form" role="search">
    <div class="form-group has-feedback">
      <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
      <span class="glyphicon glyphicon-search form-control-feedback"></span>
    </div>
  </form>
  
    </div>
    <ul class="nav navbar-nav navbar-right">
    <li><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i><span class="badge">0</span></a>
    <ul class="dropdown-menu" role="menu">
    </ul></li>
    <li>&nbsp;&nbsp;&nbsp;<li>
    <li style="margin-top:5px;"><h4>Welcome <%= session.getAttribute("username") %></h4></li>
    <li>&nbsp;&nbsp;&nbsp;<li>
      <li><a href="logout.jsp"><form action="logout.jsp" id="btnform"><button class="but" type="button" class="btn btn-default">Logout</button></form></li>

    </ul>
    
  </div>
  </nav>
  <br/>
  <div id="bodydiv" class="row">
  <div class="col-sm-3 ">
  <div class="well">
  <div id="Heading" style="background-color:#aeaeae; font-weight=bold; padding:7px; color:white;">
  <h4>PROFILE</h4>
  </div>
  <div style="padding:5px; text-align:center;">
  <br/>
  <img src="images/profilepic.png" style="width:50%;"alt="User Profile Image">
  <br/>
  <h3><% out.print(name); %></h3>
  <br/>
  <label>ID</label><br/>
  <% out.print(id); %>
  <br/><br/>
  <label>Designation</label><br/>
  <% out.print(desig); %>
  <br/><br/>
  <label>Office</label><br/>
  <% out.print(office); %>
  <br/><br/>
  </div>
  </div>
 
  </div>
  <div class="col-sm-3 ">
  
  <ul id="pill" class="nav nav-pills nav-justified">
  <li class="nav-item pill-1 active" style="text-align:left;"><a class="nav-link" id="products" data-toggle="tab"href="#home">PRODUCTS</a></li>
  <li class="nav-item pill-2" id="id1" style="text-align:left;"><a class="nav-link" id="vendors"  data-toggle="tab" href="#menu1">VENDORS</a></li>
  <li class="nav-item pill-3" id="id1" style="text-align:left;"><a class="nav-link" id="category"  data-toggle="tab" href="#menu1">CATEGORY</a></li>
</ul>

<br/>
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <!-- WRITE HERE !!!!!!!!!!!!!!!!!!!!!!! -->
    <p class="prodtitle"><font style="bold" size="6px">Trimmer&nbsp;</font><font size="4px">by Philips&nbsp;&nbsp;</font><font style="bold" size="5px"><span class="glyphicon glyphicon-pencil"></span></font></p>
    <p class="ratingsmall"><font><span class="glyphicon glyphicon-star"></span>&nbsp;4.7</font></p>
    <div class="entire-thing">
    <div class="ad-left " style="background-color:#f2f2f2; position:absolute; width:120%; height:350%; text-align:center;">
    
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:90%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" >
    <div class="item active">
      <img src="https://images-na.ssl-images-amazon.com/images/I/61XNa2865lL._SY450_.jpg" style="width:70%;">
    </div>

    <div class="item" >
      <img src="https://images-na.ssl-images-amazon.com/images/I/61oosK63kOL._SY879_.jpg" style="width:50%;">
    </div>

    <div class="item" >
      <img src="https://images.philips.com/is/image/PhilipsConsumer/QT4006_15-IMS-en_IN?wid=494&hei=435&$pnglarge$" style="width:100%;">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
  
</div>
<h3 class="titleproduct">Product Image Carousel</h3>
    </div>
    <div class="ad-right" style=" position: absolute; display: inline-block;">
<p class="prodtitle"><font style="bold" size="6px">Product Description&nbsp;</font><font style="bold" size="5px"><span class="glyphicon glyphicon-pencil"></span></font></p>    <br/>
    <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	<br/><br/>
	<p class="prodtitle" style="margin-top:180px;"><font style="bold" size="6px">Rs. XXXX/-&nbsp;</font><font size="4px">15% off &nbsp;</font><font style="bold" size="4px"><span class="glyphicon glyphicon-pencil"></span></font></p>
	<form style="position:absolute; top:400px; left:500px;">
	<input type="submit"  formaction="NextPage.jsp" class="btn btn-default" value="Finish" style="width:180px; color:#e5e5e5; background-color:#2a2a2a">
	<input type="submit"  formaction="NextPage.jsp" class="btn btn-default" value="Cancel" style="width:180px; color:#e5e5e5; background-color:#727272">
	</form>
    </div>
    </div>

  </div>
  <div id="menu1" class="tab-pane fade">
    <h3></h3>
    <p></p>
  </div>
 
</div>
  </div>
  </div>
</body>
</html>