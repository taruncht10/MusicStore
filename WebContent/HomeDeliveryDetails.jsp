<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Registration</title>
<script type="text/javascript" src="Order_Validation.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Home Delivery </font>

<div class="content">
<form name="OrderRegistration" method="post" action="OrderManagementController" onsubmit="return Order_Validation()">
<table>

<%
    	Music  music = (Music) session.getAttribute("musicDelivery");%>

<tr>
<td>Music Title</td>
<td><%=music.getMusicTitle() %></td>
</tr>


<tr>
<td>Quantity<sup>*</sup></td>
<td><input type="text" name="Quantity" id="Quantity"></td>
</tr>


<tr>
<td>Delivery Address<sup>*</sup></td>
<td><textarea name="DeliveryAddress" id="DeliveryAddress"></textarea></td></tr>
</table>
<input type="hidden" name="action" value="HomeDeliveryDetails">
<input type="submit" value="submit"></input>
</form>
</div>
</center>

<div class="footer" style="margin-top: 200px;">
<a href="SecondHomePage.jsp" style="color: orange;"> Navigate to Home Page </a><br/>
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