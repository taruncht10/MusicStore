<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.lang.*"%>
 <%@ page import="com.oms.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null&&user.getUserType().equals("MRM")){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Saved Music Page</title>
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
	style="font-family: cursive; font-style: italic;">View Saved Music Page</font>
<div class="content"
	style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white; opacity: 0.8; width: 55%; height: 400px;">

<table>
	
	<%
	   Music music=(Music)session.getAttribute("music");%>
	
	<tr>
		<td>Music Title :</td> 	<td><%= music.getMusicTitle()%></td>
	</tr>
	<tr>
		<td>Album Name  :</td>   <td><%= music.getAlbumName()%></td>
	</tr>
	
	<tr>
		<td>Artist :</td>   <td><%= music.getArtist()%></td>
	</tr>
	
	<tr>
		<td>Music Director :</td>   <td><%= music.getMusicDirector() %></td>
	</tr>
	<tr>
		<td>Language  :</td>  	<td>   <%= music.getLanguage() %>       </td>
	</tr>
	<tr>
		<td>Type   :</td> <td>   <%= music.getType() %>   </td>
	</tr>
	<tr>
		<td>Genre  :</td>  <td> <%= music.getGenre() %>   </td>
	</tr>
	<tr>
		<td>Format</td>  <td></td>
	</tr>
	<tr>
		<td>Listings  :</td>  <td><%=music.getListings()%></td>
	</tr>
	<tr>
		<td>Awards  :</td> <td><%= music.getAwards()%></td>
		
	</tr>
	
	
</table>

</div>
</center><center>
<div class="footer"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright � 2014 Online Music Store My Tunes</div>
</center>


</body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>