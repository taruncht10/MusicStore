function musicRegistrationValidation(){
	
	var musicTitle = document.MusicRegistrationForm.musicTitle.value;
	var albumName = document.MusicRegistrationForm.albumName.value;
	var artist = document.MusicRegistrationForm.artist.value;
	var musicDirector = document.MusicRegistrationForm.musicDirector.value;
	var language = document.MusicRegistrationForm.language;
	var musicType = document.MusicRegistrationForm.musicType;
	var genre = document.MusicRegistrationForm.genre;
	var OnlinePrice = document.MusicRegistrationForm.OnlinePrice.value;
	var DiscountPrice = document.MusicRegistrationForm.DiscountPrice.value;
	var aval=document.getElementsByName("availability");
	
	
	var listings = document.MusicRegistrationForm.listings.value;
	var awards = document.MusicRegistrationForm.awards.value;
	
	
	
	var alphaNum = /^[a-z 0-9 A-Z]+$/;
	var alpha = /^[a-z A-Z]+$/;
	
	if(musicTitle==""){
		alert('Enter musicTitle');
		return false;
	}
	if(!musicTitle.match(alphaNum)){
		alert('Invalid Music Title');
		return false;
	}
		
	if(albumName==""){
		alert('Enter AlbumName');
		return false;
	}
	
	if(!albumName.match(alphaNum)){
		alert('Invalid Album Name');
		return false;
	}
	
	if(artist==""){
		alert('Enter AlbumName');
		return false;
	}
	
	if(!artist.match(alphaNum)){
		alert('Invalid Album Name');
		return false;
	}
	
	if(musicDirector==""){
		alert('Enter music Director');
		return false;
	}
	if(!musicDirector.match(alpha)){
		alert('Invalid Music Director');
		return false;
	}
	
	if(language.selectedIndex==0){
		alert('Please select a Language');
		return false;
	}
	
	if((musicType[0].checked==false) && (musicType[1].checked==false)){
		alert('Please select a type');
		return false;
	}
	
	if(genre.selectedIndex==0){
		alert('Please select a Genre');
		return false;
	}
	
	if(OnlinePrice==""||OnlinePrice==null)
	{
		alert("Please enter the online price");
		return false;
	}
	if(DiscountPrice==""||DiscountPrice==null)
	{
		alert("Please enter the discount price");
		return false;
	}
	if(isNaN(OnlinePrice))
	{
		alert("Online price must be in integer");
		return false;
	}
	if(isNaN(DiscountPrice))
	{
		alert("Enter discount price");
		return false;
	}
	if(Number(DiscountPrice)>Number(OnlinePrice))
	{
		alert("Discount price cannot be higher than Online price");
		return false;
	}
	
	if((aval[0].checked==false)&&(aval[1].checked==false)){
		alert('Please select the availability');
		return false;
	}

	if(document.getElementById("sampleImage").value==""||document.getElementById("sampleImage").value==null)
	{
		alert("Please choose an image");
		return false;
	}
	if(document.getElementById("sampleMusic").value==""||document.getElementById("sampleMusic").value==null)
	{
		alert("Please choose a music file");
		return false;
	}
	
	if(!checkImageFile(document.getElementById("sampleImage")))
	{
		return false;
	}
	if(musicType[0].checked)
	{
	   if(!checkMusicFile(document.getElementById("sampleMusic")))
	   {
		return false;
	  }
	}
	else if(musicType[1].checked)
	{
		 if(!checkVideoFile(document.getElementById("sampleMusic")))
		   {
			return false;
		  }
	}
}

function checkImageFile(imgObj)
{
    var FileName  = imgObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = imgObj.files[0].size;
    var FileSizeMB = (FileSize/1000000).toFixed(2);

    if ( (FileExt != "jpg" ) || FileSize>1000000)
    {
        var error = "File type : "+ FileExt+"\n\n";
        error += "Size: " + FileSizeMB + " MB \n\n";
        error += "Please make sure your file is in jpg format and less than 1 MB.\n\n";
        alert(error);
        return false;
    }
   var name=FileName.substr(FileName.lastIndexOf('\\')+1);
    alert(name);
    document.getElementById(coverImage).src=name;
   
    return true;
}

function checkMusicFile(musicObj)
{
    var FileName  = musicObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = musicObj.files[0].size;
    var FileSizeMB = (FileSize/1024).toFixed(2);

    if ( (FileExt != "mp3") || FileSize>10000000)
    {
        var error = "File type : "+ FileExt+"\n\n";
        error += "Size: " + FileSizeMB + " KB \n\n";
        error += "Please make sure your file is in mp3 and less than 10 MB.\n\n";
        alert(error);
        return false;
    }
    return true;
}
function checkVideoFile(musicObj)
{
    var FileName  = musicObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = musicObj.files[0].size;
    var FileSizeMB = (FileSize/1024).toFixed(2);

    if ( (FileExt != "mp4" && FileExt !="vlc") || FileSize>30000000)
    {
        var error = "File type : "+ FileExt+"\n\n";
        error += "Size: " + FileSizeMB + " KB \n\n";
        error += "Please make sure your file is in mp4 or vlc format and less than 30 MB.\n\n";
        alert(error);
        return false;
    }
    return true;
}