<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.controller.*" %>
<%@page import="com.oms.bean.*,java.util.*" %>

<%@page import="java.text.DateFormat,java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome To My Tunes</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"> </script>
<script type="text/javascript" src="registrationValidation.js"> </script>
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
   <div class="header">
		<img alt="" src="Images/logo.png"
			style="float: left; background-color: black ;opacity: 0.8; height: 125px;z-index: 3"><img alt="Images/headImage" src="Images/head1.jpg"
			style="height: 125px; width: 84.8%; float: right ;z-index: 1;">
		<h3 class="headerh4" style="float:right;color: white">
			WELCOME,Guest</h3><br></br>
		<br>
		<table class="header" style="float: left">
			<tr>
				<td><h3 class="header">
						<a class="header" href="CustomerRegistration.jsp"
							onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">REGISTER</a>
					</h3></td>
			</tr>
		</table>
	</div>
      
       <center>
	<font color="yellow" size = "10" style="font-family: cursive; font-style: italic;">Login</font></center>
       <center>
       <div class="content" id="center" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white; opacity: 0.8; width: 55%; height: 350px;">
       <br/><br/>
                 <form name="RegistrationForm" method="post" action="UserManagementController" onsubmit="return validate()">
                  <fieldset style="width: 451px"><legend style="color:#c80220;text-align:center "><b>Login Details</b></legend>
                    <table style="height: 299px; width: 442px">
	                  <tr>
		                 <td>User Name</td>
		                 <td><input type="text" name="username" id="username"> <p id="erroruser"> User name cannot be null</td>
		                 
	                 </tr>
	                 <tr>
		                  <td>Password</td>
		                  <td><input type="password" name="password" id="Password" onkeyup="checkLength()">
		                             <p id="weak">Password Strength is weak</p>
		                             <p id="medium">Password Strength is medium</p>
		                             <p id="strong">Password Strength is strong</p>
		                             <p id="errorpwd"> Password cannot be null</p>
		                  </td>
	                </tr>
	                <tr>
		                  <td>Confirm password</td>
		                  <td><input type="password" name="confirmPassword" id="confirmPassword" onkeyup="checkSimilarity()">
		                        <p id="similar">Passwords are similar</p>
		                        <p id="dissimilar">Passwords are not similar</p>
		                        <p id="errorcpwd"> Confirm Password cannot be null </p>
		                        <p id="errorcpwdsm"> Enter same password </p>
		                  </td>
	                </tr>
	                 <tr>
		                  <td>Security Question</td>
		                  <td><input type="text" name="securityQuestion" id="securityQuestion">
		                  <p id="errorques"> Security question cannot be null</td>
		                  
	                 </tr>
	                 <tr>
		                  <td>Security Answer</td>
		                  <td><input type="password" name="securityAnswer" id="securityAnswer">
		                  <p id="errorans"> Security answer cannot be null
		                   </td>
		                 
		                 
	                 </tr>

             </table>
          </fieldset>


<fieldset style="width: 451px"><legend style="font: 18px;text-align:center"><b>Personal Details</b></legend>
<table style="height: 470px; width: 462px">
	<tr>
		<td style="width: 238px">First Name</td>
		<td style="width: 178px"><input type="text" name="name" id="name">
		<p id="errorname"> Name cannot be null
		</td>
	</tr>
	<tr>
		<td>LastName</td>
		<td><input type="text" name="lastname" id="lastname"><p id="errorln"> Last name cannot be null</td>
	</tr>
	<tr>
		<td>Gender</td>
		<td><input type="radio" name="gender" value=" male" > Male 
		<input type="radio" name="gender" value="female" > Female <p id="errorgender"> Select a gender</td>
	</tr>
	<tr>
		<td>Date of Birth</td>
	    <td><input type="date" name="date" id="date" max="1995-12-31"><p id="errordob"> Choose a date</td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td><input type="text" name="mail" id="mail"><p id="erroremail"> Email address cannot be null  </p>
		<p id="erroremailv"> Enter valid Email address  </p></td>
	</tr>
	<tr>
		<td>Mobile Number</td>
		<td><input type="text" name="mobNo" id="mobNo">
		<p id="errormob"> Enter Mobile number  </p>
		<p id="errormobv"> Enter valid Mobile number  </p>
		</td>
	</tr>
	<tr>
		<td>Mailing Address</td>
		<td><textarea name="Address" id="Address"></textarea><p id="erroraddr"> Address cannot be null</td>
		
	</tr>
	<tr>
		<td colspan="2"><input type="checkbox" name="checkWeekly" value="weekly">Please send me weekly news letter and promotional offer.</td>
	</tr>
	<tr>
		<td colspan="2"><input type="checkbox" name="checkOffer" value="offer">Please send me offers to my mobile phone.</td>
	</tr>
	<tr>
	<td>  <input type="submit" value="Submit" style="width: 99px; height:40px">   </td>
	<td>  <input type="reset" value="Reset" style="width: 99px; height: 40px">    </td>
	   
</table>
</fieldset>

         <input type="hidden" name="pass" id="pass"></input>
         <input type="hidden" name="action" value="createUser">
</form>
</div>
 <div class="footer">
         <a href="HomePage.jsp"> Navigate to Home Page </a><br/>
           copyright © 2014 Online Music Store My Tunes
       </div>
</body>
</html>
