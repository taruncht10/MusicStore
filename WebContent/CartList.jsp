<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.oms.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart List</title>
<style type="text/javascript">
 
function confirmation()
{
   confirm("DO YOU WANT TO PURCHASE ALL THE MUSIC IN CART?");
}

</style>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body class="body">
<div class="header"><img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;"></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Cart List</font>

<div class="content">


<%ArrayList<Music> cart = new ArrayList<Music>();
   session=request.getSession();%>
<%cart = (ArrayList<Music>)session.getAttribute("cartList"); %>

<table border=1>
<tr>
<td>Music ID</td>
<td>Music Title</td>
<td>AlbumName</td>

</tr>
</table>
<%int i=0;
for(Music music:cart){ i=i+1; %>

<form action="OrderManagementController" method="post">
<table>
<tr>

<td><%=music.getMusicID() %></td>
<td><%=music.getMusicTitle() %></td>
<td><%=music.getAlbumName() %>
<input type="submit" name="action" value="Remove">  </td>
<td> <input type="hidden" name="val" value="<%=i%>"> </td> 
</tr>


<%} %>
</table>
</form>
<form name="cartListForm" action="Purchase.jsp" method="post">
<table>
    <tr>
      <td colspan=3>

<input type="submit" value="Purchase" onclick="return confirmation()"> 
</td>  </tr>   <tr>   <td colspan=3> 
<a href="viewFilteredMusicList.jsp" style="color: orange;">Back to Filter Music Search</a>   </td>   </tr>
</table>
</form>

</div>
</center>
<div class="footer" style="margin-top: 100px;"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright © 2014 Online Music Store My Tunes</div>
</body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>