<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("MRM")){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MRM Music Registration</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
   <div class="header">
		<img alt="" src="Images/logo.png"
			style="float: left; background-color: black ;opacity: 0.8; height: 125px;z-index: 3"><img alt="Images/headImage" src="Images/head1.jpg"
			style="height: 125px; width: 84.8%; float: right ;z-index: 1;"></div>
			<center>
	<font color="yellow" size = "10" style="font-family: cursive; font-style: italic;">MRM</font></center>
       <center>
			  <div class="content" id="center">
   <form action="MusicRegistrationPage.jsp">
        <input type="submit" value="Music Registration"></input>
   </form>
   <form action="MusicController" method="post">
         <input type="submit" value="View Suggestions"></input>
          <input type="hidden" name="action" value="ViewSuggestions"></input>
   
   </form>  
   </div>
   <div class="footer">
         <a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a>
         <br/>
           copyright © 2014 Online Music Store My Tunes
       </div>
</body>
</html>
<%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>