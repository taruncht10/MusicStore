function changeColor(x)
   {
	   x.style.cursor="pointer";
	   x.style.color="yellow";
   }
   function changeAgain(x)
   {
	   x.style.color="white";
	   x.style.background="default";
   }
   function fetchAbout()
   {
	   var xmlhttp;
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
	       document.getElementById("center").innerHTML=xmlhttp.responseText;
	       }
	     }
	   xmlhttp.open("GET","About.html",true);
	   xmlhttp.send();
   }	
 	
   function logoutConfirm()
   {
	   var xmlhttp;
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
	       document.getElementById("center").innerHTML=xmlhttp.responseText;
	       }
	     }
	   xmlhttp.open("GET","logout.jsp",true);
	   xmlhttp.send();
   }
   function fetchForgot()
   {
	   var xmlhttp;
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
	       document.getElementById("center").innerHTML=xmlhttp.responseText;
	       }
	     }
	   xmlhttp.open("GET","forgotuser.jsp",true);
	   xmlhttp.send();
   }
   
   function fetchChange()
   {
	   var xmlhttp;
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
	       document.getElementById("center").innerHTML=xmlhttp.responseText;
	       }
	     }
	   xmlhttp.open("GET","forgotPassword.jsp",true);
	   xmlhttp.send();
   }	
 	
   
   