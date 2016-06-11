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
<title>Edit Music</title>
<script type="text/javascript" src="editMusicValidation.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script>
if(isNaN(document.getElementByName("musicToEdit")){
	alert('Enter a valid ID');
	return false;
}
</script>
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
	style="font-family: cursive; font-style: italic;">Edit Music</font>

<div class="content">
<form name="editMusicForm" action="MusicController" method="post" onsubmit="return editMusicValidation();" >

<table>
	<tr>
		<td>Enter the music ID</td>
		<td><input type="text" name="musicToEdit" id="musicToEdit" required></input></td>
	</tr>
	<tr>
		<td><input type="hidden" value="edit" name="action" ></input></td>
		<td><input type="submit" value="Edit" ></input></td>
	</tr>
	
	
	<tr>
	  <td colspan=2> <input type="button" value="WANT TO KNOW MUSIC CODES?" onclick="fetchMusic()">  </td>
	  </tr>
</table>
    
</form>
</div>
<div id="list">

</div>
<div class="footer" ><a href="SecondHomePage.jsp" style="color: orange">
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