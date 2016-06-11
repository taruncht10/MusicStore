<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.oms.controller.*" %>
    <%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome To My Tunes</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"> </script>
<script type="text/javascript" src="Authentication.js"> </script>
</head>
<body class="body">
   <div class="header">
		<img alt="" src="Images/logo.png"
			style="float: left; background-color: black ;opacity: 0.8; height: 125px;z-index: 3"><img alt="Images/headImage" src="Images/head1.jpg"
			style="height: 125px; width: 84.8%; float: right ;z-index: 1;">
		<h3 class="headerh4" style="float:right;color: white">
			WELCOME,
			<% session= request.getSession();
	    User user=(User)session.getAttribute("user");
	    if(user==null||user.getUserName()==null){%> GUEST <%}else {%>
          <%=user.getUserName() %><%} %></h3><br></br>
		<br>
		<table class="header" style="float: left">
			<tr>
				<td><h3 class="header">
						<a class="header" href="CustomerRegistration.jsp"
							onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">REGISTER</a>
					</h3></td>
			</tr>
		</table>
		</div>
       <center>
	<font color="yellow" size = "10" style="font-family: cursive; font-style: italic;">Login</font></center>
       <center>
       
       <div class="content" id="center">
       <br/><br/>
                   <form name="Authentication" onsubmit="return validateForm()" method="post" action="UserManagementController">
                   <fieldset><br/>
                   <legend  style="text-align:center; color:#c80220" > <b>ENTER USER  CREDENTIALS </b></legend>
                   <table style="font-size:100%;">
	                <tr>
	                    <th> USER NAME   &nbsp; &nbsp; &nbsp; &nbsp;        </th>
	                    <td><input type="text" name="username"></td>
	                </tr>
	                <tr>
	                    <th> PASSWORD  &nbsp; &nbsp;&nbsp; &nbsp;           </th>
		                <td><input type="password" name="password"></td>
	               </tr>
	               <tr>
	                    <td colspan=2 style="text-align:center"><a onmouseover="changeColor(this)" onmouseout="changeAgain(this)" href="forgotuser.jsp"> Forgot Password</a>  </td>  
	               </tr>
	               <tr>
	                     <td><input type="submit" value="Login"></input></td>
	                     <td><input type="reset" value="Reset"></input></td>
	               </tr>      
                   </table>
                   <input type="hidden" name="action" value="authentication">
                   </fieldset> 
                   </form>
       </div></center>
       <div class="footer" >
         <a href="HomePage.jsp" style="color: orange"> Navigate to Home Page </a>
         <br/>
           copyright © 2014 Online Music Store My Tunes
       </div>
</body>
</html>
