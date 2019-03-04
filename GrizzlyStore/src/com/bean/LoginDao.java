package com.bean;

import java.sql.*;  
public class LoginDao {  
  
public static boolean validate(LoginBean bean)
{  
boolean status=false;  
try
{  
	Connection con=ConnectionProvider.getCon();  
	              
	PreparedStatement ps=con.prepareStatement(  
	    "select * from AdminTable where username=? and password=?");  
	
	System.out.println(bean.getEmail());
	System.out.println(bean.getPass());
	
	ps.setString(1,bean.getEmail());  
	ps.setString(2, bean.getPass());  
	              
	ResultSet rs=ps.executeQuery(); 
	
	//System.out.println(rs);

	
	status= rs.next();  
              
}
catch(Exception e)
{}  
  
return status;
  
}  
}  