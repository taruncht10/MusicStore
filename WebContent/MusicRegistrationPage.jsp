<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("MRM")){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Music Registration Page</title>
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
	style="font-family: cursive; font-style: italic;">Music Registration Page</font>

<div class="content" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white;
	opacity: 0.8; width: 55%; height: 350px;">

<form action="MusicController" method="post" name="MusicRegistrationForm" onsubmit="return musicRegistrationValidation()">
<table>
	
	<tr>
		<td>Music Title</td>
		<td><input type="text" name="musicTitle" id="musicTitle"
			placeholder="Enter Music Title"></input></td>
	</tr>
	<tr>
		<td>Album Name</td>
		<td><input type="text" name="albumName" id="albumName"
			placeholder="Enter Album Name"></input></td>
	</tr>
	
	<tr>
		<td>Artist</td>
		<td><input type="text" name="artist" id="artist"
			placeholder="Enter Artist Name"></input></td>
	</tr>
	
	<tr>
		<td>Music Director</td>
		<td><input type="text" name="musicDirector" id="musicDirector"
			placeholder="Enter Music Director"></input></td>
	</tr>
	<tr>
		<td>Language</td>
		<td><select name="language" id="language">
			<option value="select" id="0">select</option>
			<option value="Tamil" id="1">Tamil</option>
			<option value="Hindi" id="2">Hindi</option>
		</select></td>
	</tr>
	<tr>
		<td>Type</td>
		<td><input type="radio" name="musicType" id="musicType" value="audio">Audio</input>
		<input type="radio" name="musicType" id="musicType" value="video">Video</input></td>
	</tr>
	<tr>
		<td>Genre</td>
		<td><select name="genre" id="genre">
			<option value="select" id="0">Select</option>
			<option value="rock" id="0">Rock</option>
			<option value="pop" id="0">Pop</option>
			<option value="dance" id="0">Dance</option>
		</select></td>
	</tr>
	<tr>
				<td>Format</td>
				<td>Online Price</td>
				<td>Discount</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="text" name="OnlinePrice"
					id="tapeOnlinePrice" placeholder="Online Price "></input></td>
				<td><input type="text" name="DiscountPrice"
					id="tapeDiscountPrice" placeholder="Discount Price"></input></td>
			</tr>
			
			<tr>
				<td>Availability</td>
				<td><input type="radio" name="availability" value="online"
					id="onlineAvailability">Online</input></td>
				<td><input type="radio" name="availability" value="instock"
					id="instockAvailability">In-Stock</input></td>
			
		
	</tr>
	<tr>
		<td>Listings</td>
		<td><input type="text" name="listings" id="listings"
			placeholder="Enter the Listing"></input></td>
	</tr>
	<tr>
		<td>Awards</td>
		<td><input type="text" name="awards" id="awards" placeholder="Enter Awards"></input></td>
	</tr>
	<tr>
		<td><img id="coverImage" name="coverImage" height="100" width="100" alt="CoverImage"></td>
		<td><input type="file" name="coverImageFile" id="sampleImage" onchange="checkImageFile(this)"></input></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="file" id="sampleMusic" name="sampleMusicFile"></input></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><audio controls preload="none" size="5"> 
			<source src="Music/Kalimba.mp3" type="audio/mp3"> 
			<source src="C:\Users\Public\Music\Sample Music\Kalimba.mp3" type="audio/ogg"> 
			<source src="C:\Users\Public\Music\Sample Music\Kalimba.mp3" type="audio/wav"> </audio></td>
	</tr>
	<tr>
		<td><input type="submit" name="submit" value="Register"></input></td>
		<td><input type="reset" name="reset" value="reset"></input></td>
		<td><input type="hidden" value="create" name="action"></input></td>
	</tr>
</table>
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