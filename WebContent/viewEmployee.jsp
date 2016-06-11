<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.controller.*"%>
<%@page import="com.oms.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session = request.getSession();
	User user = (User) session.getAttribute("user");
	if (user != null &&user.getUserType().equals("IA")||user.getUserType().equals("CA")) {
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
   
   function validate()
   {
	   var empid=document.EmployeeForm.empid.value;
	   var role=document.EmployeeForm.role.value;
	   if(role.selectedIndex==1)
		   {
		     alert("Select a role !");
		     return false;
		   }
	   if(empid==null||empid=="")
	   {
		   alert("Enter employee id");
		   return false;
	   }
   }
   function fetchEmp()
   {
   	   var xmlhttp;
   	   var role=document.EmployeeForm.role.value;
   	   if (window.XMLHttpRequest)
   	     {
   	     xmlhttp=new XMLHttpRequest();
   	     }
   	   else
   	     {
   	     xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
   	     }
   	   xmlhttp.onreadystatechange=function()
   	     {
   	     if (xmlhttp.readyState==4 && xmlhttp.status==200)
   	       {
   	       document.getElementById("list").innerHTML=xmlhttp.responseText;
   	       }
   	     }
   	   if(role=="CA") 
   	      xmlhttp.open("GET","CAList.jsp",true);
   	   else if(role=="MRM")
   		 xmlhttp.open("GET","MRMList.jsp",true); 
   	   else if(role=="SM")   
   		 xmlhttp.open("GET","SMList.jsp",true);
   	   xmlhttp.send();
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
	style="font-family: cursive; font-style: italic;">View Employee
</font></center>
<div class="content" >
<center>
<form name="EmployeeForm" method="post"
	action="UserManagementController" onsubmit="return validate()">
<table align="center">
	<tr>
		<td>Enter the role :</td>
		<td><select name="role" onchange="fetchEmp()"> <option selected> Select a role </option> <option value="SM"> SM </option> 
		<%if(user.getUserType().equals("IA")){%>
		  <option value="MRM">MRM</option><option value="CA"> CA </option> <%} %> </select></td>
	</tr>
	<tr>
		<td>Enter the employee id :</td>
		<td><input type="text" name="empid"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Search"></td>
	</tr>
</table>
<input type="hidden" name="action" value="searchEmployee"></input></form>
</center>

</div>
<div id="list">

</div>
<center>
<div class="footer"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright © 2014 Online Music Store My Tunes</div>
</center></body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>