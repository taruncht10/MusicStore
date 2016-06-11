<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.bean.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("IA")){%>
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
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"><h3 class="headerh4" style="float:right;color: white">WELCOME,
          <% session= request.getSession();
	    user=(User)session.getAttribute("user");
	    String role=user.getUserType();
	    if(user==null||user.getUserName()==null){%> GUEST <%}else {%>
          <%=user.getUserName() %><%} %>&nbsp;</h3>
      <table class="header">
      <tr>
             <td><h3 class="header"> <a class="header" href="viewUser.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">VIEW PROFILE  </a> </h3> </td>  
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href="deleteAccount.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">DELETE PROFILE</a> </h3> </td>
             <td>&nbsp; </td> 
             <td><h3 class="header"> <a class="header" href="forgotuser.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">CHANGE PASSWORD</a> </h3> </td>
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href = "logout.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">LOGOUT</a> </h3> 
             </td>
             
      </tr>
      </table></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Stores in the selected City
</font>
<div class="content">


<%
ArrayList<Store> storeList = new ArrayList<Store>();
%>
<%
        session=request.getSession();
    	storeList = (ArrayList<Store>) session.getAttribute("stores");
	
%>

<center>
<div class="content" align="center">
	
<table align="center" border=1>
	<tr>
		<th>StoreID</th>
		<th>StoreName </th>
		<th>City</th>
        <th> EMPLOYEE ID OF SM </th>
		<th>SM FIRST NAME</th>
		<th>SM LAST NAME</th>
   </tr>
<%
	  	for(Store store:storeList) 
		{
%>
	<tr>
	   	<td><%=store.getStoreId()%></td>
		<td><%=store.getStoreName()%> </td>
		<td><%=store.getCity()%> </td>
		<td><%=store.getEmpID()%> </td>
		<td><%=store.getFirstName()%> </td>
		<td><%=store.getLastName()%> </td>
	
	</tr>
	
	<%   }   %>

</table>
</div>

</center>
</div>
</center>
<center>
<div class="footer"  style="margin-top: 140px">
<a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a><br/>
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