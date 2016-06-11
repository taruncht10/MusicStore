function editMusicValidation(){
	var musicToEdit = document.editMusicForm.musicToEdit.value;
	var numFormat =/^[0-9]+$/;
	
	if(musicToEdit==""){
		alert('Please enter a musicID');
		return false;
	}
	
	if(!musicToEdit.match(numFormat)){
		alert('Please enter a valid music ID');
		return false;
	}
}
function fetchMusic()
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
	       document.getElementById("list").innerHTML=xmlhttp.responseText;
	       }
	     }
	   xmlhttp.open("GET","MusicFile.jsp",true);
	   xmlhttp.send();
}	