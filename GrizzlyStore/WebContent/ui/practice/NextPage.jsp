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
<title>Main Page</title>
<link rel="icon" href="images/icon.png" type="image/png">
<link rel="stylesheet" type="text/css" href="styles/add_product.css" />
 <link rel="stylesheet" type="text/css" href="styles/style.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="scripts/scripts.js"></script>
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
  <img src="images/profilepic.png" style="width:50%;" alt="User Profile Image">
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
    <table style="width:1300px;">
    <tr>
    <td style="width:33%;">
    <div class="dropdown">
  <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="border-radius:20px; background-color:#aeaeae; width:50%; color:#5f5f5f; font-weight:bold;">Choose Action
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
  </ul>
	</div></td>
	
	<td style="width:33%"><form class="navbar-form" role="search">
    <div class="form-group has-feedback">
      <input class="form-control" placeholder="Product Name/Product ID" name="srch-term" id="srch-term" type="text" style="background-color:#aeaeae; color:#5f5f5f; font-weight:bold;">
      <span class="glyphicon glyphicon-search form-control-feedback"></span>
    </div>
  </form>
	
	</td>
	
<td style="width:33%"><div class="dropdown">
  <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="border-radius:20px; background-color:#aeaeae; width:50%; color:#5f5f5f; font-weight:bold;">Sort By
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
    <li><a href="#"></a></li>
  </ul>
	</div></td>
	<td style="width:33%;">
	<form>
	<input type="submit" formaction="AddProduct.jsp" class="btn btn-default" value="Add Product" style="width:180px; color:#e5e5e5; background-color:#2a2a2a">
	</form></td>
</tr>
    </table>
    <br/>
    
    <table id="products-table" class="table-bordered">
    <tr>
    <th class="regular" style="width:20%;">Products List</th>
    <th class="regular" style="width:20%;">Brand</th>
    <th class="regular" style="width:20%;">Category</th>
    <th class="regular" style="width:10%;">Rating</th>
    <th class="lastcol" style="width:30%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">Trimmer<input type="checkbox" value="" class="productcheck" onchange="document.getElementById('view1').disabled = !this.checked; document.getElementById('block1').disabled = !this.checked; document.getElementById('remove1').disabled = !this.checked;"><span class="checkmark"></span></label>
    </div></td>
    <td class="regular">Philips</td>
    <td class="regular">Personal Care</td>
    <td class="regular-rating">4.7</td>
    <td class="lastcol">
    <form>
    <input type="submit" formaction="ProductPage.jsp" id="view1" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block1" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" onclick="myDeleteFunction(this)" id="remove1" class="btn btn-default" value="Remove" style="width:100px;" disabled>
    </form></td>
    
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">Shaver<input type="checkbox" value="" class="productcheck" onchange="document.getElementById('view2').disabled = !this.checked; document.getElementById('block2').disabled = !this.checked; document.getElementById('remove2').disabled = !this.checked;"><span class="checkmark"></span></label>
    </div></td>
    <td class="regular">Braun</td>
    <td class="regular">Personal Care</td>
    <td class="regular-rating">4.8</td>
    <td class="lastcol">
    <input type="submit" id="view2" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block2" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" id="remove2" class="btn btn-default" onclick="myDeleteFunction(this)" value="Remove" style="width:100px;" disabled></td>
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">MacBook Pro<input type="checkbox" value="" class="productcheck" onchange="document.getElementById('view3').disabled = !this.checked; document.getElementById('block3').disabled = !this.checked; document.getElementById('remove3').disabled = !this.checked;"><span class="checkmark"> </span></label>
    </div></td>
    <td class="regular">Apple</td>
    <td class="regular">Laptops</td>
    <td class="regular-rating">4.9</td>
    <td class="lastcol">
    <input type="submit" id="view3" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block3" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" onclick="myDeleteFunction(this)" id="remove3" class="btn btn-default" value="Remove" style="width:100px;" disabled></td>
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">iMac 27&trade;<input type="checkbox" value="" class="productcheck"
      onchange="document.getElementById('view4').disabled = !this.checked; document.getElementById('block4').disabled = !this.checked; document.getElementById('remove4').disabled = !this.checked;"><span class="checkmark"></span></label>
    </div></td>
    <td class="regular">Apple</td>
    <td class="regular">Laptops</td>
    <td class="regular-rating">4.6</td>
    <td class="lastcol">
    <input type="submit" id="view4" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block4" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" onclick="myDeleteFunction(this)" id="remove4" class="btn btn-default" value="Remove" style="width:100px;" disabled></td>
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">Micron Pens<input type="checkbox" value="" class="productcheck"
      onchange="document.getElementById('view5').disabled = !this.checked; document.getElementById('block5').disabled = !this.checked; document.getElementById('remove5').disabled = !this.checked;"><span class="checkmark"></span></label>
    </div></td>
    <td class="regular">Sakura Pigma</td>
    <td class="regular">Art Supplies</td>
    <td class="regular-rating">4.1</td>
    <td class="lastcol">
    <input type="submit" id="view5" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block5" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" onclick="myDeleteFunction(this)" id="remove5" class="btn btn-default" value="Remove" style="width:100px;" disabled></td>
    </tr>
    <tr>
    <td class="regular"><div class="checkbox">
      <label class="name">Paint Markers<input type="checkbox" value="" class="productcheck"
      onchange="document.getElementById('view6').disabled = !this.checked; document.getElementById('block6').disabled = !this.checked; document.getElementById('remove6').disabled = !this.checked;"><span class="checkmark"></span></label>
    </div></td>
    <td class="regular">Copic</td>
    <td class="regular">Art Supplies</td>
    <td class="regular-rating">4.2</td>
    <td class="lastcol">
    <input type="submit" id="view6" class="btn btn-default" value="View" style="width:100px;" disabled>
    <input type="submit" id="block6" class="btn btn-default" value="Block" style="width:100px;" disabled>
    <input type="submit" onclick="myDeleteFunction(this)" id="remove6" class="btn btn-default" value="Remove" style="width:100px;" disabled></td>
    </tr>

    </table>
    
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3></h3>
    <p></p>
  </div>
 
</div>
  </div>
  </div>
</body>

</body>
</html>