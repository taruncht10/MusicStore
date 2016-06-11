<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oms.controller.*" %>
<%@page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome To My Tunes</title>
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
<script type="text/javascript" src="Styles_Validation.js"> </script>
<script type="text/javascript"> 
function validate()
{
	var weekly = document.UpdateForm.checkWeek.value;
	var offer = document.UpdateForm.checkOffer.value;
	var email = document.UpdateForm.mail.value;
	var Mobno = document.UpdateForm.mobNo.value;
		
	if (email == ""||email==null) {
		document.UpdateForm.mail.focus();
		document.getElementById("erroremail").style.display="block";
		return false;
	}
	document.getElementById("erroremail").style.display="none";
	var atpos=email.indexOf("@");
	var dotpos=email.lastIndexOf(".");
	if(atpos<1||dotpos<atpos+2||dotpos+2>=email.length)
	{
		document.UpdateForm.mail.focus();
		document.getElementById("erroremailv").style.display="block";
		return false;
	}		
	document.getElementById("erroremailv").style.display="none";

	if (isNaN(Mobno)||Mobno.length!=10) 
	{
		document.UpdateForm.mobNo.focus();
		document.getElementById("errormob").style.display="block";
		return false;
	}
	document.getElementById("errormob").style.display="none";	

	if(weekly==null||weekly=="")
	{
		document.UpdateForm.weekly.focus();
		document.getElementById("msgw").style.display="block";
		return false;
	}
	document.getElementById("errormob").style.display="none";
	if(offer==null||offer=="")
	{
		document.UpdateForm.offer.focus();
		document.getElementById("msgo").style.display="block";
		return false;
	}
	document.getElementById("errormob").style.display="none";
}
function loadEdit(x)
{
	document.UpdateForm.submit.disabled=false;
	document.UpdateForm.reset.disabled=false;

	if(x.name=="EditEmail")
	{
		document.UpdateForm.mail.disabled=false;
		x.style.display="none";
	}	
	if(x.name=="EditMob")
	{
		document.UpdateForm.mobNo.disabled=false;
		x.style.display="none";
	}	
	if(x.name=="EditCheckWeek")
	{
		document.UpdateForm.checkWeek.disabled=false;
		x.style.display="none";
	}	
		if(x.name=="EditOffer")
		{
			document.UpdateForm.checkOffer.disabled=false;
			x.style.display="none";
		}	
		
	

}
</script>

</head>
<body class="body">
	<div class="header">
		<img alt="" src="Images/logo.png"
	style="float: left; background-color: black; opacity: 0.8; height: 125px; z-index: 3"><img
	alt="Images/headImage" src="Images/head1.jpg"
	style="height: 125px; width: 84.8%; float: right; z-index: 1;">
			<h3 class="headerh4" style="float:right;color: white">WELCOME,
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
             <td><h3 class="header"> <a class="header" href="forgotuser.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">CHANGE PASSWORD</a> </h3> </td>
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href = "logout.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">LOGOUT</a> </h3> 
             </td>
             
      </tr>
      </table>
     </div><center>
      <font color="yellow" size="10"
	style="font-family: cursive; font-style: italic;">View User</font></center>
      <center>
      <div class="content" style="overflow-x: hidden; overflow-y: auto; background-color: black; color: white;
	opacity: 0.8; width: 55%; height: 250px;">
       
     <form name="UpdateForm" method="post" action="UserManagementController" onsubmit="return validate()">
        <table style="height: 299px; width: 442px" align="center">
                
                <tr>    <td>First Name</td>  	<td>:<%=user.getFirstName()%>		</td>  	</tr>
	            <tr>    <td>LastName</td>       <td>:<%= user.getLastName()%></td>  </tr>
	            <tr>    <td>Gender</td>       <td>:<%= user.getGender()%></td>  </tr>
	            <tr>    <td>Date of Birth</td>  <td>:<%= user.getDOB()%>  </td></tr>
	       
	            <tr>    <td>Email Address</td>  <td>:<input type="text" name="mail" id="mail"  value=<%= user.getEmail()%>><p id="erroremail"> Email address cannot be null  </p>
		                <p id="erroremailv"> Enter valid Email address  </p> </td> </tr>
	            <tr>    <td>Mobile Number</td>  <td>:<input type="text" name="mobNo" id="mobNo"  value=<%= user.getMobileNumber()%>><p id="errormob"> Enter Mobile number </p> </td>
	                    <td> </td>  	</tr>
	             <tr>    <td>Weekly Newsletter</td>  <td>:<input type="text" name="checkWeek"  value=<%= user.getWeeklyNewsletter()%>>  </td>
	                    <td> <p id="msgw"> Enter true or false </p> </td>  	</tr>
	             <tr>    <td>Offers to Mobile </td>  <td>:<input type="text" name="checkOffer"  value=<%= user.getOffersToMobile()%>> </td>
	                    <td>  <p id="msgo"> Enter true or false </p>  </td>  	</tr>        
	            
	<tr>
	<td>  <input type="submit" name="submit" value="Save" disabled style="width: 99px; height:40px ">   </td>
	<td>  <input type="reset" name="reset" value="Reset" disabled style="width: 99px; height: 40px ">    </td>
	<td> <input type="button" name="EditEmail" value="Edit" onclick="loadEdit(this)" style="width: 99px; height: 40px "></input> </td> 
	</tr>   
</table>


         
         <input type="hidden" name="action" value="updateUser">
</form>
</center>
</div>


<center>
 <div class="footer" >
         <a href="SecondHomePage.jsp" style="color: orange;"> Navigate to Home Page </a><br/>
           copyright © 2014 Online Music Store My Tunes
       </div></center>
</body>
</html><%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>