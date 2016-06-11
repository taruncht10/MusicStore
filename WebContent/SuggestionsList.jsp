<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.bean.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Suggestions List</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Suggestions List </font>
	<%
ArrayList<Suggestion> sugList = new ArrayList<Suggestion>();
%>
<%
        session=request.getSession();
    	sugList = (ArrayList<Suggestion>) session.getAttribute("sugList");
	
%>





<center>
<div class="content">
	
<table border=1>
	<tr>
		<th>Album Name</th>
		<th>Title</th>
		<th>No Of Suggestions</th>
	</tr>
		

<%
	    int i=0;
		for(Suggestion sug:sugList) 
		{
		   %>
	<tr>
	    <td><%=sug.getAlbum()%>  </td>
		<td><%=sug.getTitle()%></td>
		<td><%=sug.getNoOfSuggestions()%></td>
		
	</tr>
	<%} %>	
	<tr> <td colspan=3><a href="MRMMusicReg.jsp"> BACK</a> </td>  </tr>
</table>	

</div>

</center>
</center>
<br>
<center>
<div class="footer">
<a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a><br/>
copyright © 2014 Online Music Store My Tunes
</div>
</center>
</body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>