<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*,javax.servlet.RequestDispatcher"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Registration</title>
<script type="text/javascript" src="PurchaseValidation.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<style>
/* visited link */
a:visited {
	color: #00FF00;
}

/* mouse over link */
a:hover {
	color: #FF00FF;
}

/* selected link */
a:active {
	color: #0000FF;
}
</style>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Purchase
</font>
<div class="content">
<form name="OrderRegistration" method="post" action="OrderManagementController" onsubmit="return Purchase_Validation()">
<table>

<%session=request.getSession();
    	ArrayList<Music>  musicList = (ArrayList<Music>) session.getAttribute("cartList");%>

<%  int i=0;
    for(Music music:musicList)
	{  
	     i=i+1;
	     String Qty="Quantity"+i; System.out.println(Qty);%>
   <tr>
       <td>Music Title</td>
               <td><%=music.getMusicTitle() %></td>
   </tr>
   <tr>
       <td>Quantity<sup>*</sup></td>
       <td><input type="text" name="<%=Qty%>" id="<%=Qty%>"></td>
   </tr>
   <%} %>


<tr>
<td>Delivery Address<sup>*</sup></td>
<td><textarea name="DeliveryAddress" id="DeliveryAddress"></textarea></td></tr>
</table>
<input type="hidden" id="count" value="<%=i%>"></input>
<input type="hidden" name="action" value="PurchaseCart">
<input type="submit" value="submit" ></input>"



</form>
</div>
</center>
<div class="footer">
<a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a><br/>
copyright � 2014 Online Music Store My Tunes
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