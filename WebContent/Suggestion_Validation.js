function Suggestion_Validation()
{
	var AlbumName=Document.getElementByID("Album_Name").value;
	var MusicTitle=Document.getElementByID("Music_Title").value;
	var alph= /^[a-z A-Z]+$/;
	
	if(AlbumName==""||AlbumName==null)
	{
		alert("Enter Album name !");
		return false;
	}
	if(AlbumName.match(alph))
		{
		   alert("Album name cannot have numbers");
		   return false;
		}
	
	if(MusicTitle==""||MusicTitle==null)
	{
		alert("Enter music title !");
		return false;
	}
	if(MusicTitle.match(alph))
	{
	   alert("Music Title cannot have numbers");
	   return false;
	}

}
	