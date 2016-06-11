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
<script type="text/javascript">
  function confirmation()
{
	 
    
     var number=document.OrderReg.number.value;
     var cvv=document.OrderReg.CVV.value;
     var name=document.OrderReg.name.value;
     var expdate=document.OrderReg.expdate.value;
     var i=0;
     
     
     if(isNaN(number))
    		 {
    	    alert("card number can have only numbers");
    	    return false;
    		 }
     if(number.length!=11)
    	 {
    	    alert("Card number can have only 11 digits");
    	    return false;
    	 }
     if(cvv==""||cvv==null)
    	 {
    	   alert("ENter CVV number");
    	   return false;
    	 }
     if(isNaN(cvv))
    	 {
    	 alert("CVV number can have only numbers");
    	 return false;
    	 }
	  if(cvv.length!=3)
		  {
		      alert("CVV number can have only 3 digits");
		      return false;
		  }
	  if(expdate==null||expdate=="")
		  {
		       alert("Expiry date field cannot be null");
		       return false;
		  }
	  
   confirm("DO YOU WANT TO PROCEED?");
}

</script>


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
	style="font-family: cursive; font-style: italic;">Payment
</font>
<div class="content">
<form name="OrderReg" method="post" action="OrderManagementController" onsubmit="return confirmation()">
<table>

<%session=request.getSession();
    	
    	Order order=(Order)session.getAttribute("order");%>

<tr>
<td>User ID</td>
<td><%=order.getUserID() %></td>
</tr>
<tr>
<td>Amount</td>
<td><%=order.getPayment() %></td>
</tr>


<tr>
<td>Card type<sup>*</sup></td>
<td><input type="radio" name="type" required> Credit  <input type="radio" name="type" required> Debit </td>
</tr>
<tr>
<td>Card Number<sup>*</sup></td>
<td><input type="text" name="number" ID="number" required></td>
</tr>
<tr>
<td>CVV Number<sup>*</sup></td>
<td><input type="text" name="CVV" ID="CVV" required></td>
</tr>
<tr>
<td>Name On Card<sup>*</sup></td>
<td><input type="text" name="name" ID="name" required></td>
</tr>
<tr>
<td>Expiry Date<sup>*</sup></td>
<td><input type="date" name="expdate" ID="expdate" required></td>
</tr>

</table>
<input type="hidden" name="action" value="Payment">
<input type="submit" value="Pay"></input>



</form>
</div>
</center>
<div class="footer">
<a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a><br/>
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