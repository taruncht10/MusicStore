function Purchase_Validation()
{
   var count=document.getElementById("count").value;
   alert(count);
   var i=1;
   while(i<=count)
   {
	   var name="Quantity"+i;
	   alert(name);
	   var qty=document.getElementById(name).value;
	   if(qty==""||qty==null)
		{
			alert("Enter Quanity !");
			return false;
		}
		if(isNaN(qty))
		{
			alert("Enter number only !");
			return false;
		}
		i=i+1;
   }
	var DeliveryAddress=document.getElementById("DeliveryAddress").value;
	
	if(DeliveryAddress==""||DeliveryAddress==null)
	{
		alert("Enter Delivery Address !");
		return false;
	}
	
}