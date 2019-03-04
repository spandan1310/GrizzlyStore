<%@page import="com.bean.LoginDao"%>  
<%@page import="com.bean.LoginBean"%>  
<%-- <jsp:useBean id="obj" class="com.bean.LoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>   --%>
  
<%  
String username=request.getParameter("email");
String password=request.getParameter("password");
LoginBean ob=new LoginBean(username,password);
boolean status=LoginDao.validate(ob); 
System.out.println(status);
if(status){  
request.getSession(false);
session.setAttribute("username",username); 
response.sendRedirect("NextPage.jsp");

}  
else  
{  
	
out.print("Sorry, email or password error");  
%>  
<%-- <jsp:include page="index.jsp"></jsp:include>  --%> 
<%-- <%@include  file="index.html" %> --%>
<%  
}  
%>  