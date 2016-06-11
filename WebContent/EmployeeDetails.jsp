<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.controller.*" %>
<%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&(user.getUserType().equals("CA")||user.getUserType().equals("IA"))){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome To My Tunes</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"> </script>

</head>
<body class="body">
	<div class="header">
		<img alt="" src="Images/logo.png"
			style="float: left; background-color: black ;opacity: 0.8; height: 125px;z-index: 3"><img alt="Images/headImage" src="Images/head1.jpg"
			style="height: 125px; width: 85%; float: left; z-index: 1;">
			<h3 class="headerh4" style="float:right;color: white">WELCOME,
          <% session= request.getSession();
	    user=(User)session.getAttribute("user");
	    User emp=(User)session.getAttribute("employee");
	    String role=user.getUserType();
	    if(user==null||user.getUserName()==null){%> GUEST <%}else {%>
          <%=user.getUserName() %><%} %></h3>
      <table class="header">
      <tr>
             <td><h3 class="header"> <a class="header" href="viewUser.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)">VIEW PROFILE  </a> </h3> </td>  
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href="deleteAccount.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)">DELETE PROFILE</a> </h3> </td>
             <td>&nbsp; </td> </tr>
             <tr>
             <td><h3 class="header"> <a class="header" href="forgotuser.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)">CHANGE PASSWORD</a> </h3> </td>
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href = "logout.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)">LOGOUT</a> </h3> 
             </td>
             
      </tr>
      </table>
     </div>
     
       <div class="center" id="center">
       <br/><br/>
     
        <table style="height: 299px; width: 442px">
                
                <tr>    <td>First Name</td>  	<td>:<%= emp.getFirstName()%></td>  	</tr>
	            <tr>    <td>LastName</td>       <td>:<%= emp.getLastName()%></td>  </tr>
	            <tr>    <td>Date of Birth</td>  <td>:<%= emp.getDOB()%>  </td></tr>
	            <tr>    <td>Email Address</td>  <td>:<%= emp.getEmail()%></td>  	</tr>
	            <tr>    <td>Mobile Number</td>  <td>:<%= emp.getMobileNumber()%></td>  	</tr>
	                 
	   </table>



</div>
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