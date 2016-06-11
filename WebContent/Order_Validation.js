function Order_Validation()
{
	alert("HI");
	
	
	var Quantity=document.getElementById("Quantity").value;
	
	var DeliveryAddress=document.getElementById("DeliveryAddress").value;
	
	if(Quantity==""||Quantity==null)
	{
		alert("Enter Quantity !");
		return false;
	}
	if(isNaN(Quantity))
	{
		alert("Enter number only !");
		return false;
	}

	if(DeliveryAddress==""||DeliveryAddress==null)
	{
		alert("Enter Delivery Address !");
		return false;
	}
}
	
		
	
	
	
	
	
}