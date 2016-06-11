window.onload = function() {
        document.getElementById('languageSelectBox').style.display = 'none';
       
        document.getElementById('pass').style.display = 'none';
    }
function filterMusicValidation(){


	if (document.getElementById('language').checked) {
        document.getElementById('languageSelectBox').style.display = 'block';
       
        document.getElementById('pass').style.display = 'none';
       
    } 
	
	 if (document.getElementById('title').checked) {
		document.getElementById('pass').style.display = 'block';
        document.getElementById('languageSelectBox').style.display = 'none';
        
    } 
	
	 if (document.getElementById('albumname').checked) {
		document.getElementById('pass').style.display = 'block';
        document.getElementById('languageSelectBox').style.display = 'none';
       
    } 
	
	 if (document.getElementById('artist').checked) {
		document.getElementById('pass').style.display = 'block';
        document.getElementById('languageSelectBox').style.display = 'none';
        
    } 
	
	
}
