<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.bean.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  ArrayList<Music> ms=(ArrayList<Music>)session.getAttribute("listOfFilteredMusic");
  if(ms!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Filtered Music List</title>
<script type="text/javascript">
 function confirmationCart()
{
   if(confirm("DO YOU WANT TO ADD THE MUSIC TO CART?"))
	   return true;
   else return false;
}
function confirmation()
{
   if(confirm("DO YOU WANT TO PURCHASE THE MUSIC?"))
	   return true;
   else return false;
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
	style="font-family: cursive; font-style: italic;">Filtered Music List
</font>
<div class="content" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white;
	opacity: 0.8; width: 55%; height: 350px;">
<%
	System.out.println("In view music list page");
%>
<%
ArrayList<Music> listOfFilteredMusic = new ArrayList<Music>();
%>
<%
        session=request.getSession();
    	listOfFilteredMusic = (ArrayList<Music>) session.getAttribute("listOfFilteredMusic");
	
%>



<center>
<div class="content">

	


<%
	    int i=0;
		for(Music music:listOfFilteredMusic) 
		{
			
		   i=i+1;
		   System.out.println(i);
		
		   %>
		  
	
  <form action="OrderManagementController" method="post" onsubmit="return confirmation()" style="float: left;">
  <table width=200 border=1 style="margin-left:-170px;">  
	<tr>
	    <td><%=i %><input type="hidden" name="val" value="<%=i%>"></td>
	    <td><%=music.getMusicID()%> </td>
		<td><%=music.getMusicTitle()%>&nbsp;</td>
		<td><%=music.getArtist()%>&nbsp;</td>
		<td><%=music.getAlbumName()%>&nbsp;</td>
		<td><%=music.getMusicDirector()%>&nbsp;</td>
		<td><%=music.getLanguage()%>&nbsp;</td>
		
	<%if(music.getAvailability().equals("online")){ %>
	   <td><input type="submit" id="AddToCart" name="action" value="AddToCart" disabled></input></td>
		<td> <input type="submit" id="download" name="action" value="Download">  </td>
		<td><input type="submit" name="action" value="HomeDelivery" disabled></input></td>
		<%} else{ %>
		<td><input type="submit" id="AddToCart" name="action" value="AddToCart"></input></td>
		<td> <input type="submit" id="download" name="action" value="Download" disabled>  </td>
		<td><input type="submit" name="action" value="HomeDelivery"></input></td>
		
		<%} %>
	</tr>
	</table>
	</form>

	<%
	   
		}
	
	%>
	


   <br/><a href="filterMusic.jsp"> Back to search music</a>
</div>
</center>
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