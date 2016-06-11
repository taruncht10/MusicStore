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
<title>View Order List</title>
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
	style="font-family: cursive; font-style: italic;">Order History
</font>
<div class="content">


<%
ArrayList<Order> orderList = new ArrayList<Order>();
%>
<%
        session=request.getSession();
    	orderList = (ArrayList<Order>) session.getAttribute("orderHistory");
	
%>


<center>
<div class="content" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white;
	opacity: 0.8; width: 100%; height: 250px;">
<!-- <form name="viewFilteredMusicList">
	
<table align="center">
	<tr>
		<td>Order ID</td>
                <td>Music Id 1 </td>
		<td>Quantity 1</td>
               <td>Music Id 2 </td>
		<td>Quantity 2</td>
                <td>Music Id 3 </td>
		<td>Quantity 3</td>
		<td>Order Date</td>
		<td>Amount</td>
		<td>Delivery Type</td>
		<td>Address</td>
		<td>Order Status</td>
		<td>Payment Status</td>
		<td>LSP Name</td>
		<td>AWB Number</td>
	</tr>
	
		

</table>	
</form> -->
<%
	    int i=0;
		for(Order order:orderList) 
		{
			
		   i=i+1;
		   
		   %>
	<form action="OrderManagementController" method="post" onsubmit="return viewMusicListValidation();">
	<table align="left" border=1>
	<tr>
	<td>
	    <input type="hidden" name="val" value="<%=i%>"> </td> 
	  	<td><%=order.getOrderId()%>  </td>
                <%for(int j=1;j<=3;j++){%>
                <td><%=order.getMusicId(j)%>  </td>
		         <td><%=order.getQuantity(j)%></td>
                <%}%>
		<td><%=order.getOrderDate()%></td>
		<td><%=order.getPayment()%></td>
		<td><%=order.getDelivery_type()%></td>
		<td><%=order.getDeliveryAddress()%></td>
		<td><%=order.getStatus()%></td>
		<td><%=order.getPaymentStatus()%></td>
		<td><%=order.getLSP_Name()%></td>
		<td><%=order.getAWB_Number()%></td>
		
		
	<%if(order.getStatus().equals("Pending")){ %>
	    
		<td><input type="submit" id="Cancel" name="action" value="Cancel"></td>
	<%} %>	
	</tr>
	</table>
	</form>	
	
	<%
	   
		}
	
	%>


</div>

</center>
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