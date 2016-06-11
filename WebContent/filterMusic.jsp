<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Filter Music</title>
<script type="text/javascript" src="filterMusicValidation.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Filter Music</font>
<div class="content" >

<form name="filterMusicForm" action="MusicController" method="post">
<input type="radio" onclick="filterMusicValidation();" name="filter" id="title" value="1" required>Title
<input type="radio" onclick="filterMusicValidation();" name="filter" id="albumname" value="2" required>AlbumName
<input type="radio" onclick="filterMusicValidation();" name="filter" id="artist" value="3" required>Artist
<input type="radio" onclick="filterMusicValidation();" name="filter" id="language" value="4" required>Language


<input type="text" name="pass" id="pass"></input>
<select name="lang" id="languageSelectBox" style="width: 250px" >
<option value="select" id="0">select</option>
<option value="Tamil" id="1">Tamil</option>
<option value="Hindi" id="2">Hindi</option>

</select>

<input type="submit" id="filter" value="submit"></input>
<input type="hidden" name="action" value="filter"></input>

</form>

</div>
</center>
<div class="footer" style="margin-top: 350px"><a href="SecondHomePage.jsp" style="color: orange;">
Navigate to Home Page </a> <br />
copyright © 2014 Online Music Store My Tunes</div>
</body>
</html>
