<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oms.bean.*" %>
     <%@page import="com.oms.controller.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<title>Delete Account</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
   
   function validate()
   {
	   var password=document.DeleteForm.password.value;
	   if(password==null||password=="")
	   {
		   alert("Enter password");
		   return false;
	   }
	   if(confirm("DO YOU WANT TO DELETE?"))
		   return true;
	   else return false;
   }	   	   
</script>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
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
             <td><h3 class="header"> <a class="header" href="ConfirmUserChange.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">CHANGE PASSWORD</a> </h3> </td>
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href = "logout.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">LOGOUT</a> </h3> 
             </td>
             
      </tr>
      </table></div>
<center><font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">Delete Account</font>
 <div class="content">
    <form name="DeleteForm" method="post" action="UserManagementController" onsubmit="return validate()">
        <table>
        <tr><td> Enter your password : </td><td><input type="password" name="password"></td></tr>
        <tr><td><input type="hidden" name="action" value="deleteUser"></input></td><td colspan="2"><input type="submit" value="DeleteAccount"></td></tr>
        
        </table>
    </form> 
    </div>
</center>
<div class="footer" style="margin-top: 200px;"><a href="SecondHomePage.jsp" style="color: orange">
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