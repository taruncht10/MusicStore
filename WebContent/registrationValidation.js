function validate() {
	
	var userName = document.RegistrationForm.username.value;
	var password = document.RegistrationForm.password.value;
	var confirmPassword = document.RegistrationForm.confirmPassword.value;
	var securityQuestion = document.RegistrationForm.securityQuestion.value;
	var securityAnswer = document.RegistrationForm.securityAnswer.value;
	var name = document.RegistrationForm.name.value;
	var lastname = document.RegistrationForm.lastname.value;
	var date=document.RegistrationForm.date.value;
	var email = document.RegistrationForm.mail.value;
	var Mobno = document.RegistrationForm.mobNo.value;
	var address = document.RegistrationForm.Address.value;
	var gender = document.getElementsByName("gender");
	var checks=document.getElementsByName("check");
	var mob = /^[7-9]{1}[0-9]{9}$/;
	
	if (userName == ""||userName==null) 
	{
		document.RegistrationForm.username.focus();
		document.getElementById("erroruser").style.display="block";
		return false;
	}
	document.getElementById("erroruser").style.display="none";
	
	
	if (password == ""||password==null||password.length<8)
	{
		document.RegistrationForm.password.focus();
		document.getElementById("errorpwd").style.display="block";
		return false;
	}
	document.getElementById("errorpwd").style.display="none";
	document.getElementById("weak").style.display="none";
	document.getElementById("medium").style.display="none";
	document.getElementById("strong").style.display="none";
	
	
	
	if (confirmPassword ==""||confirmPassword==null)
	{
		document.RegistrationForm.confirmPassword.focus();
		document.getElementById("errorcpwd").style.display="block";
		return false;
	}
	document.getElementById("errorcpwd").style.display="none";
	
	if (confirmPassword!=password)
	{
		document.RegistrationForm.confirmPassword.focus();
		document.getElementById("errorcpwdsm").style.display="block";
		return false;
	}
	document.getElementById("errorcpwdsm").style.display="none";
	
	if(securityQuestion==""||securityQuestion==null)
	{
		document.RegistrationForm.securityQuestion.focus();
		document.getElementById("errorques").style.display="block";
		return false;
	}
	document.getElementById("errorques").style.display="none";
	
	if(securityAnswer==""||securityAnswer==null)
	{
		document.RegistrationForm.securityAnswer.focus();
		document.getElementById("errorans").style.display="block";
		return false;
	}
	document.getElementById("errorans").style.display="none";
	
	if (name == ""||name==null) {
		document.RegistrationForm.name.focus();
		document.getElementById("errorname").style.display="block";
		return false;
	}
	document.getElementById("errorname").style.display="none";
	
	
	if (lastname == ""||lastname==null) {
		document.RegistrationForm.lastname.focus();
		document.getElementById("errorln").style.display="block";
		return false;
	}
	document.getElementById("errorln").style.display="none";
	
	
	if ( ( gender[0].checked == false ) && ( gender[1].checked == false ) ) 
	{
	
		document.getElementById("errorgender").style.display="block";
	return false;
	}
	document.getElementById("errorgender").style.display="none";
	
	if (date==null||date=="") 
	{
		document.RegistrationForm.date.focus();
		document.getElementById("errordob").style.display="block";
		return false;
	}


	document.getElementById("errordob").style.display="none";
	

	if (email == ""||email==null) {
		document.RegistrationForm.mail.focus();
		document.getElementById("erroremail").style.display="block";
		return false;
	}
	document.getElementById("erroremail").style.display="none";
	/*var atpos=email.indexOf("@");
	var dotpos=email.lastIndexOf(".");
	if(atpos<1||dotpos<atpos+2||dotpos+2>=email.length)
	{
		document.RegistrationForm.mail.focus();
		document.getElementById("erroremailv").style.display="block";
		return false;
	}	
	var email=email.substring(atpos+1,mail.length)
	if(email.indexOf(".")>1 ) 
	{
		document.RegistrationForm.mail.focus();
		document.getElementById("erroremailv").style.display="block";
		return false;	
	}*/
	
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(!email.match(mailformat))
		
	{
		document.RegistrationForm.mail.focus();
		document.getElementById("erroremailv").style.display="block";
	    return false;
	}
	/*if(!rule.test(email))
	{
		document.RegistrationForm.mail.focus();
		document.getElementById("erroremailv").style.display="block";
		return false;
	}	*/
	document.getElementById("erroremailv").style.display="none";

	if (Mobno==null||Mobno=="") 
	{
		document.RegistrationForm.mobNo.focus();
		document.getElementById("errormob").style.display="block";
		return false;
	}
	document.getElementById("errormob").style.display="none";
	if(isNaN(Mobno)||Mobno.length!=10 || !(Mobno.match(mob)))
		{
		document.RegistrationForm.mobNo.focus();
		document.getElementById("errormobv").style.display="block";
		return false;
		}
	document.getElementById("errormobv").style.display="none";
	
	
	if (address == ""||address==null) {
		document.RegistrationForm.Address.focus();
		document.getElementById("erroraddr").style.display="block";
		return false;
	}
	document.getElementById("erroraddr").style.display="None";
	if(!(document.getElementById("pass").value=="strong"))
	{
		alert("Enter a strong password");
		return false;
	}
	
}
function checkLength()
{
	document.getElementById("errorpwd").style.display="none";
	var password = document.RegistrationForm.password.value;
	if(password.length<8)
	{
		document.getElementById("weak").style.display="block";
		document.getElementById("medium").style.display="none";
		document.getElementById("strong").style.display="none";
	}
	else 
	{
		var upperCaseRule=/[A-Z]/;
		var lowerCaseRule=/[a-z]/;
		var numberRule=/[0-9]/;
		var symbolRule=/(@|!|#|\$)/;
	
		
		if(upperCaseRule.test(password)&&lowerCaseRule.test(password)&&numberRule.test(password)&&symbolRule.test(password))
		{
			document.getElementById("strong").style.display="block";
			document.getElementById("weak").style.display="none";
			document.getElementById("medium").style.display="none";
		    document.getElementById("pass").value="strong";
		}
		else
		{
			document.getElementById("weak").style.display="none";
			document.getElementById("medium").style.display="block";
			document.getElementById("strong").style.display="none";
		}	
     }
}

function checkSimilarity()
{
	
	var password = document.RegistrationForm.password.value;
	var confirmPassword = document.RegistrationForm.confirmPassword.value;
	if (password==""||password==null)
	{
		alert("Enter Password");
		return false;
	}
	
	if(confirmPassword==password)
	{
		document.getElementById("similar").style.display="block";
		document.getElementById("dissimilar").style.display="none";
	
	}
	else
	{
		document.getElementById("similar").style.display="none";
		document.getElementById("dissimilar").style.display="block";

	}	
}