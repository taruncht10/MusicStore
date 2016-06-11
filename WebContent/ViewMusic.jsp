<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*" %>
     <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("MRM")){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Music</title>
<script type="text/javascript" src="viewMusicValidation.js"></script>
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
	style="font-family: cursive; font-style: italic;">View Music
</font>
<div class="content">

<form name="viewMusicForm" action="MusicController" method="post" onsubmit="return viewMusicValidation();">

<table>
<tr>
<td>Enter Music ID</td>
<td><input type="text" name="musicToViewDetails" id="musicToViewDetails"></input></td>
</tr>
<tr>
<td><input type="hidden" name="action" value="read"></input></td>
<td><input type="submit" name="read" id="read" value="read"></input></td>
</tr>

	<tr>
	  <td colspan=2> <input type="button" value="WANT TO KNOW MUSIC CODES?" onclick="fetchMusic()">  </td>
	  </tr>
</table>


</form>
</div>
<div id="list">

</div>
</center>

<center>
<div class="footer"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright © 2014 Online Music Store My Tunes</div></center>
</body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>