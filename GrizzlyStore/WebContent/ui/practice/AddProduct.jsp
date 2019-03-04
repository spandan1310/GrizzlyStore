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
<title>Add Product</title>
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
      <li><a href="logout.jsp"><button class="but" type="button" class="btn btn-default">Logout</button></a></li>

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
    <div class="entire-thing">
    <div class="ad-left " style="background-color:#f2f2f2; position:absolute; width:120%; height:550%; text-align:center;">
    <img src="images/addimage2.png" style="width:50%; margin-top:80px;"><br/>
    <p id="Addimage">Add Images</p>
    </div>
    <div class="ad-right" style=" position: absolute; display: inline-block;">
    <div class="form-group">
  	<input type="text" class="w3-input w3-border-0" id="usr1" style="width:100%; font-color:solid black; border-style:none; outline:none" placeholder="Enter Product ID">
	</div>
	<hr>
	<div id="categorydrop" class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="font-weight:bold; padding:0px; background-color:white; font-size:20px; color:black; border-color:white; outline:none;">Category&emsp;&emsp;
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#">Electronics</a></li>
    <li><a href="#">Appliances</a></li>
    <li><a href="#">Healthcare</a></li>
    <li><a href="#">Furniture</a></li>
    <li><a href="#">Automobile</a></li>
  </ul>
</div>
	<hr>
	<div class="form-group">
  	<input type="text" class="w3-input w3-border-0" id="pwd1" style="width:100%;font-color:solid black; border-style:none; outline:none;"placeholder="Name">
	</div>
	<hr>
	<div class="form-group">
  	<input type="text" class="w3-input w3-border-0" id="pwd2" style="width:100%;font-color:solid black; border-style:none; outline:none;"placeholder="Description">
	</div>
	<hr>
	<div class="form-group">
  	<input type="text" class="w3-input w3-border-0" id="pwd3" style="width:100%;font-color:solid black; border-style:none; outline:none;"placeholder="Price">
	</div>
	<hr>
	<form style="position:relative; top:100px; left:500px;">
	<input type="submit" class="btn btn-default" value="Add" style="width:180px; color:#e5e5e5; background-color:#2a2a2a" formaction="NextPage.jsp"><br/>
	<input type="submit" class="btn btn-default" value="Cancel" style="width:180px; color:#e5e5e5; background-color:#727272" formaction="NextPage.jsp">
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
</body>
</html>