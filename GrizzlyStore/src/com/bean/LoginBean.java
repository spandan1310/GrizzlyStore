package com.bean;

public class LoginBean {  
private String username,password;  
  
public String getEmail() {  
    return username;}
  
public void setusername(String username) {  
    this.username = username;  
}  
  
public LoginBean(String username, String password) {
	super();
	this.username = username;
	this.password = password;
	System.out.println("okay");
}

public String getPass() {  
    return password;  
}  
  
public void setPass(String password) {  
    this.password = password;  
}  
  
  
}  