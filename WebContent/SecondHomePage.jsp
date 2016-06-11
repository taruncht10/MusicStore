<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.oms.bean.*" %>
<%session=request.getSession();
  User user=(User)session.getAttribute("user");
  if(user!=null){%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome To My Tunes</title>
<link href="js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider.js" type="text/javascript"></script>
    <link href="generic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"></script>

<style type="text/css">
<!--
#tabs {
	border-bottom: .5em solid #0033CC;
	margin: 0;
	padding: 0;
}

#tabs li {
	display: inline;
	border-top: .1em solid #03c;
	border-left: .1em solid #03c;
	border-right: .1em solid #03c;
}

#tabs li a {
	text-decoration: none;
	padding: 0.25em 1em;
	color: #000;
}

#page1 #tabs li#tab1 a, #page2 #tabs li#tab2 a, #page3 #tabs li#tab3 a,
	.page4 li#tab4 a {
	padding: 0.25em 1em;
	background-color: #03c;
	color: #fff;
}
-->
</style>

</head>
<body class="body">
	<div class="header">
		<img alt="" src="Images/logo.png"
			style="float: left; background-color: black ;opacity: 0.8; height: 125px;z-index: 3"><img alt="Images/headImage" src="Images/head1.jpg"
			style="height: 125px; width: 85%; float: left; z-index: 1;">
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
             <td><h3 class="header"> <a class="header" href="ConfirmUserChange.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">CHANGE PASSWORD</a> </h3> </td>
             <td>&nbsp; </td>
             <td><h3 class="header"> <a class="header" href = "logout.jsp" onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">LOGOUT</a> </h3> 
             </td>
             
      </tr>
      </table>
     </div>
     
      
     
      <table id="menu" align=center> 
      
        <tr>
        <th onmouseover="changeColor(this)" onmouseout="changeAgain(this)" ><h3> <a href="ConfirmUser.jsp" style="color: yellow;">View Order History </a></h3> </th>
        <th onmouseover="changeColor(this)" onmouseout="changeAgain(this)" > <h3> <a href="Suggestion.jsp" style="color: yellow;"> Post Suggestion </a></h3> </th>
      
     
   <%if(role.equals("MRM")){ %>  
     
        <th> <h3 onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">Music Management </h3>
            <ul> 
               <li> <a href="MRMMusicReg.jsp" style="color: yellow;">Add Music </a></li>
               <li><a href="ViewMusic.jsp" style="color: yellow;">View Music </a></li>
               <li><a href="editMusic.jsp" style="color: yellow;">Edit Music</a></li>
               <li><a href="deleteMusic.jsp" style="color: yellow;">Delete Music</a></li>
               </ul>
        </th>
        <%} %>  
        <%if(role.equals("CA")||role.equals("IA")) {%>
        <th> <h3 onmouseover="changeColor(this)" onmouseout="changeAgain(this)"> 
            <a href="viewEmployee.jsp" style="color: yellow;">View Employee Details </a></h3> 
        </th>
        <%} %>
        <%if(role.equals("SM")) {%>
        <th> <h3 onmouseover="changeColor(this)" onmouseout="changeAgain(this)"> 
            <a href="ChooseStatus.jsp" style="color: yellow;">View Orders </a></h3> 
        </th>
        <%} %>
        <%if(role.equals("IA")) {%>
        <th> <h3 onmouseover="changeColor(this)" onmouseout="changeAgain(this)"> 
            <a href="ChooseCity.jsp" style="color: yellow;">View Store Details </a></h3> 
        </th>
        <%} %>
        
      
       </tr>
       </table>
          
       <div class="center" id="center">
           <br/><br/>
           <center>
             <h2> <a href="filterMusic.jsp" style="color: aqua;"> Click here to search your favorite music</a></h2><br/>
            <h2 style="font-style:italic; color:yellow;"> New Releases!!!!! </h2>
                 
         
          </center>
       </div>
       <!-- <div class="footer">
       <center>
         <table> 
          <tr>
           <td onmouseover="changeColor(this)" onmouseout="changeAgain(this)" onclick="fetchAbout()"> About us | </td>
           <td onmouseover="changeColor(this)" onmouseout="changeAgain(this)" onclick="fetchHistory()"> History | </td>
           <td onmouseover="changeColor(this)" onmouseout="changeAgain(this)" onclick="fetchContacts()"> Contact us  </td>
          </tr>
      
       </table>
      </center> -->
         <!-- <a href="HomePage.jsp"> Navigate to Home Page </a><br/>
           copyright © 2014 Online Music Store My Tunes 
       
       </div> -->
       <center>
		<!-- <textarea rows="15" cols="80" id="gallery"
			style="background-color: black; opacity: 0.8; color: white;"> Gallery Slide Show</textarea> -->
			
			<div id="sliderFrame">
        <div id="slider">
           
                <img src="Images/6.jpg" alt="" />
            
            <img src="Images/2.jpg" alt="" />
            <img src="Images/3.jpg" alt="" />
            <img src="Images/4.jpg" alt="" />
            <img src="Images/5.jpg" />
            <img src="Images/7.jpg" />
        </div>
        
    </div></center>
       <div class="footer">
         <a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a>
          <br/> copyright © 2014 Online Music Store My Tunes
         </div>
    
</body>
</html>
<%}else
{
%>
<% request.setAttribute("Error","No TailGating");%>
<%RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
rd.forward(request,response);%>

<%}%>