<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.oms.controller.*"%>
    <%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"> </script>
<script type="text/javascript">

function validate()
{
	var answer = document.changePassword.Answer.value;
    var canswer = document.changePassword.Re_Type_Answer.value;  
    var pwd = document.changePassword.pwd.value;
    var cpwd = document.changePassword.cpwd.value;
    
    if(answer==""||answer==null)
    {
    	alert("Answer cannot be null");
    	return false;
    }
    if(canswer==""||canswer==null)
    {
    	alert("Re type answer cannot be null");
    	return false;
    }
    if(canswer!=answer)
    {
    	alert("Both the answers are not similar");
    	return false;
    }
        
    
    if(pwd==""||pwd==null)
    {
    	alert("Password cannot be null");
    	return false;
    }
    if(cpwd==""||cpwd==null)
    {
    	alert("Confirm password cannot be null");
    	return false;
    }
    if(cpwd!=pwd)
    {
    	alert("Both the passwords are not similar");
    	return false;
    }
    var upperCaseRule=/[A-Z]/;
	var lowerCaseRule=/[a-z]/;
	var numberRule=/[0-9]/;
	var symbolRule=/(@|!|#|\$)/;

	
	if(upperCaseRule.test(pwd)&&lowerCaseRule.test(pwd)&&numberRule.test(pwd)&&symbolRule.test(pwd))
	{
		document.getElementById("pass").value="strong";
	}
	
	if(!(document.getElementById("pass").value=="strong"))
	{
		alert("Enter a strong password");
		return false;
	}
	
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
	style="font-family: cursive; font-style: italic;">Change Password</font>
<div class="content" >
   <form name="changePassword" action="UserManagementController"  method="post"  onsubmit="return validate()">



<table style="height: 299px; width: 442px ">


<tr>
<td style="width: 200px; height: 30px">Security Question:</td> 
<td><%=user.getSecretQuestion()%></td>
</tr>

<tr>
<td>Answer</td>
<td>
<input type="password" name="Answer" size="50">
</td>
</tr>

<tr>
<td>Re Type Answer: </td>
<td>
<input type="password" name="Re_Type_Answer" size="50">
</td>
</tr>
<tr>
<td>New Password</td>
<td>
<input type="password" name="pwd" size="50">
</td>
</tr>

<tr>
<td>Confirm Password: </td>
<td>
<input type="password" name="cpwd" size="50">
</td>
</tr>

<tr>
<td align="center" colspan="2">
<input type="submit" value="Submit"> <input type="hidden" name="action" value="confirmPwdChange"></td> </tr>

</table>
 <input type="hidden" name="pass" id="pass"></input>
</form>

</div>
</center>
<div class="footer" style="margin-top: 200px;"><a href="SecondHomePage.jsp" style="color: orange">
Navigate to Home Page </a> <br />
copyright � 2014 Online Music Store My Tunes</div>
</body>
</html>
<%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>