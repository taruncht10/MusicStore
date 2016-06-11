<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.oms.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider.js" type="text/javascript"></script>
    <link href="generic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="styles.css"></link>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<script type="text/javascript" src="Styles_Validation.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('about').style.display = 'none';
		document.getElementById('history').style.display = 'none';
		document.getElementById('contact').style.display = 'none'; 
		document.getElementById('sliderFrame').style.display = 'block';
		document.getElementById('slider').style.display = 'block'; 
	}
	function fetchAbout() {
		document.getElementById('about').style.display = 'block';
		document.getElementById('history').style.display = 'none';
		document.getElementById('contact').style.display = 'none'; 
		document.getElementById('sliderFrame').style.display = 'none';
		document.getElementById('slider').style.display = 'none'; 
	}

	function fetchHistory() {
		document.getElementById('history').style.display = 'block';
		document.getElementById('about').style.display = 'none';
		document.getElementById('contact').style.display = 'none';
		document.getElementById('sliderFrame').style.display = 'none';
		document.getElementById('slider').style.display = 'none'; 
	}
	
	function fetchContacts(){
		document.getElementById('contact').style.display = 'block';
		document.getElementById('history').style.display = 'none';
		document.getElementById('about').style.display = 'none';
		document.getElementById('sliderFrame').style.display = 'none';
		document.getElementById('slider').style.display = 'none'; 
	}
	
	function fetchGallery(){
		document.getElementById('sliderFrame').style.display = 'block';
		document.getElementById('slider').style.display = 'block'; 
		document.getElementById('contact').style.display = 'none';
		document.getElementById('history').style.display = 'none';
		document.getElementById('about').style.display = 'none';
	}
</script>

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
			<h3 class="headerh4" style="float:right;color: white">
			WELCOME,
			<% session= request.getSession();
	    session.invalidate();
	    %> GUEST 
		</h3><br></br>
		<br>
		<table class="header" style="float: left">
			<tr>
				<td><h3 class="header">
						<a class="header" href="Authentication.jsp"
							onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">LOGIN
						</a>
					</h3></td>
				<td>&nbsp;</td>
				<td><h3 class="header">
						<a class="header" href="CustomerRegistration.jsp"
							onmouseover="changeColor(this)" onmouseout="changeAgain(this)" style="color: yellow;">REGISTER</a>
					</h3></td>
			</tr>
		</table>
			
		
		<center>
			</center>
		<br> 
		<embed src="Music/Kalimba.mp3" autostart="true" loop="true"
               width="2" height="0">
</embed>
	</div>
	<center>
		<ul id="tabs">
			<li id="tab1"><input type="button"
				onmouseover="changeColor(this)" onmouseout="changeAgain(this)"
				onclick="fetchAbout()" value="About Us"
				style="background-color: black; opacity =0.6; color: pink; font: oblique;"></li>
			<li id="tab2"><input type="button"
				onmouseover="changeColor(this)" onmouseout="changeAgain(this)"
				onclick="fetchHistory()" value="History"
				style="background-color: black; opacity =0.6; color: pink; font: oblique;"></li>
			<li id="tab3"><input type="button"
				onmouseover="changeColor(this)" onmouseout="changeAgain(this)"
				onclick="fetchGallery()" value="Gallery"
				style="background-color: black; opacity =0.6; color: pink; font: oblique;"></li>
			<li id="tab4"><input type="button"
				onmouseover="changeColor(this)" onmouseout="changeAgain(this)"
				onclick="fetchContacts()" value="Contact Us"
				style="background-color: black; opacity =0.6; color: pink; font: oblique;"></li>
		</ul>

	</center>
	
	<center>
		<textarea rows="15" cols="80" id="about"
			style="background-color: black; opacity: 0.8; color: white;">myTunes is a program that allows Windows users to download music from an iTunes music share over a network, circumventing restrictions in iTunes that only allow streaming music. The software is widely popular on college campuses across the U.S. It was developed by Bill Zeller at Trinity College.

myTunes development has now been brought to a halt. ZDNetUK News.com reported on 9 March 2004, "the popular software has all but vanished from the Net, and its programmer's sites have gone dark. But this time, it's not the doing of an angry record industry or a conflict-averse Apple. Trinity College sophomore Bill Zeller, who wrote the program in less than two weeks of off-time coding last year, says he simply lost the source code in a catastrophic computer crash." Zeller said: "I was about to release the second version, when I lost everything. I may put it back online, but there won't be any updates. I don't want to rewrite it."Subsequently, an entirely rewritten version, myTunes Redux, was released, which again operated successfully until once more disabled in iTunes version 7.</textarea>
	</center>
	<center>
		<textarea rows="15" cols="80" id="history"
			style="background-color: black; opacity: 0.8; color: white;">On October 16, 2003, Apple Computer released a version of its iTunes software for Windows.
On October 26, 2003, now-late Bill Zeller released the first version of his software, myTunes.
On March 9, 2004, it is reported that the source code for myTunes is lost.[2]
On April 28, 2004, Apple Computer released version 4.5 of iTunes, which disabled myTunes and other similar programs.
On September 5, 2004, Bill Zeller released myTunes Redux which overcame Apple Computer's restrictions and added various other features.
On September 27, 2006, Apple Computer released version 7 of iTunes, again disabling the current version of myTunes.</textarea>
	</center>
	
	<center>
		<textarea rows="15" cols="80" id="contact"
			style="background-color: black; opacity: 0.8; color: white;"> Address:
			MyTunes,
			No3.Music Academy,
			Chennai-91.</br>
			Website : http://localhost:8080/music/
			</textarea>
	</center>
	
	<center>
		<!-- <textarea rows="15" cols="80" id="gallery"
			style="background-color: black; opacity: 0.8; color: white;"> Gallery Slide Show</textarea> -->
			  <center>
             <h2> <a href="filterMusic.jsp" style="color: aqua;"> Click here to search your favorite music</a></h2><br/>
            <h2 style="font-style:italic; color:yellow;"> New Releases!!!!! </h2>
                 
         
          </center>
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
       <div class="footer" style="margin-top: 35px;">
         <a href="HomePage.jsp" style="color: orange"> Navigate to Home Page </a>
          <br/> copyright © 2014 Online Music Store My Tunes <h5 align="left">BEST VIEWED IN CHROME</h5>
         
         </div>
        
</body>
</html>