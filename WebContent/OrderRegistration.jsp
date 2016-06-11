<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Registration</title>
<script type="text/javascript" src="MusicRegistrationValidation.js"></script>
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
	style="font-family: cursive; font-style: italic;">Order Registration</font>

<div class="content" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white;
	opacity: 0.8; width: 55%; height: 350px;">

<form name="OrderRegistration" method="post" action="">
<table>

<tr>
<td>Order_ID</td>
<td><input type="text" name="OrderID" ID="OrderID"></input></td>
</tr>

<tr>
<td>Music_ID</td>
<td><input type="text" name="MusicID" ID="MusicID"></input></td>
</tr>

<tr>
<td>Store_ID</td>
<td><input type="text" name="StoreID" ID="StoreID"></input></td>
</tr>

<tr>
<td>User_ID</td>
<td><input type="text" name="UserID" ID="UserID"></input></td>
</tr>

<tr>
<td>Quantity<sup>*</sup></td>
<td><input type="text" name="Quantity" ID="Quantity"></td>
</tr>

<tr>
<td>Date of Order<sup>*</sup></td>
<td><input type="date" name="OrderDate" id="OrderDate"></td>
</tr>

<tr>
<td>Payment Type<sup>*</sup></td>
<td><input type="radio" name="PaymentType" value="COD">COD
<input type="radio" name="PaymentType"  value="Credit">Credit</td>
</tr>


<tr>
<td>Delivery Type<sup>*</sup></td>
<td><input type="radio" name="DeliveryType" value="Online ">Online
<input type="radio" name="DeliveryType"  value="Home Delivery">Home Delivery</td>
</tr>


<tr>
<td>Delivery Address<sup>*</sup></td>
<td><textarea name="DeliveryAddress" id="DeliveryAddress"></textarea></td></tr>
</table>

<input type="submit" value="submit" onClick="return Order_Validation()"></input>"



</form>
</div>
</center>
<center>
<div class="footer">
<a href="SecondHomePage.jsp"> Navigate to Home Page </a><br/>
copyright © 2014 Online Music Store My Tunes
</div>
</center>
</body>
</html>
<%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>