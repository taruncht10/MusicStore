<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.oms.bean.*" %>
	<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("MRM")){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Music</title>
<script type="text/javascript" src="deleteMusicValidation.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Delete Music</font>

<div class="content">
<!--<a href="MusicHomePage.html"><h3 align="right">Click to go Home</h3>
</a>-->
<form name="deleteMusicForm" action="MusicController" method="post"
	onsubmit="return deleteMusicValidation()">

<table>
	<tr>
		<td>Enter Music ID</td>
		<td><input type="text" name="musicToBeDeleted"
			id="musicToBeDeleted"></input></td>
	</tr>
	<tr>
		<td><input type="hidden" name="action" value="delete"></input></td>
		<td><input type="submit" name="submit" id="delete" value="delete"></input></td>
	</tr>
	<tr>
	  <td colspan=2> <input type="button" value="WANT TO KNOW MUSIC CODES?" onclick="fetchMusic()">  </td>
	  </tr>
</table>

</form>
</div>
</center>
<div class="footer" style="margin-top: 100px;"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright © 2014 Online Music Store My Tunes</div>

</body>
</html>
<%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>