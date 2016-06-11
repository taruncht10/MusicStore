function validateForm()
{
	
	var username=document.Authentication.username.value;
	var password=document.Authentication.password.value;

	if(username==null||username=="")
	{
		alert("Enter the UserName");
		return false;
	}
 
	if(password==null||password=="")
	{
		alert("Enter the Password");
	    return false;
	}
}