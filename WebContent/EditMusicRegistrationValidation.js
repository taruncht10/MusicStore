function editMusicRegistrationValidation(){
	
	var musicTitle = document.EditMusicRegistrationForm.musicTitle.value;
	var albumName = document.EditMusicRegistrationForm.albumName.value;
	var artist = document.EditMusicRegistrationForm.artist.value;
	var musicDirector = document.EditMusicRegistrationForm.musicDirector.value;
	var language = document.EditMusicRegistrationForm.language;
	var musicType = document.EditMusicRegistrationForm.musicType;
	var genre = document.EditMusicRegistrationForm.genre;
	var OnlinePrice = document.EditMusicRegistrationForm.OnlinePrice.value;
	var DiscountPrice = document.EditMusicRegistrationForm.DiscountPrice.value;
	var aval=document.getElementsByName("availability");
	
	var listings = document.EditMusicRegistrationForm.listings.value;
	var awards = document.EditMusicRegistrationForm.awards.value;
	
	
	
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
		alert("Enter discoutn price");
		return false;
	}
	if(DiscountPrice>OnlinePrice)
	{
		alert("Discount price cannot be higher than Online price");
		return false;
	}
	if((aval[0].checked==false)&&(aval[1].checked==false)){
		alert('Please select the availability');
		return false;
	}
	
	
	if(listings==""){
		alert('Enter listings');
		return false;
	}
	if(!listings.match(alphaNum)){
		alert('Invalid listings');
		return false;
	}
	
	if(awards==""){
		alert('Enter awards');
		return false;
	}
	if(!awards.match(alphaNum)){
		alert('Invalid awards');
		return false;
	}
	
}
