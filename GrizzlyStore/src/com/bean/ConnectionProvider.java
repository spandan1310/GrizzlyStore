package com.bean;

import java.sql.*;  

  
public class ConnectionProvider {  

private static Connection con=null;  
static{  
try{  
Class.forName("oracle.jdbc.driver.OracleDriver");  
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","password1$");  
}catch(Exception e){
	System.out.println("connection error");
}  
}  
  
public static Connection getCon(){  
    return con;  
}  
  
}  