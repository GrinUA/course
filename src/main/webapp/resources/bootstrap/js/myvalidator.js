function validateLogIn()
{

   if( document.myForm.login.value == "" )
   {
      alert( "Please enter your login!" );
      document.myForm.login.focus() ;
      return false;
   }
   
   if( document.myForm.password.value == "" )
   {
      alert( "Please enter your password!" );
      document.myForm.password.focus() ;
      return false;
   }
  
   return( true );
}

function validateSingUp() {
	

	if (document.singUp.login.value == "") {
		alert("Please enter your login!");
		document.singUp.login.focus();
		return false;
	}

	if (document.singUp.password.value == "") {
		alert("Please enter your password!");
		document.singUp.password.focus();
		return false;
	}

	if (document.singUp.email.value == "") {
		alert("Please enter your password!");
		document.singUp.email.focus();
		return false;
	}
	
	if (document.singUp.firstName.value == "") {
		alert("Please enter your password!");
		document.singUp.firstName.focus();
		return false;
	}
	
	if (document.singUp.lastName.value == "") {
		alert("Please enter your password!");
		document.singUp.lastName.focus();
		return false;
	}
	
	if (document.singUp.telNumber.value == "") {
		alert("Please enter your password!");
		document.singUp.telNumber.focus();
		return false;
	}
	
	return (true);
}

function validateAddTour() {
	

	if (document.addTour.name.value == "" 
		|| document.addTour.country.value == "" 
			|| document.addTour.peopleCount.value == ""
				|| document.addTour.stars.value == ""
					|| document.addTour.place.value == ""
						|| document.addTour.price.value == ""
							|| document.addTour.actived.value == "") {
		alert("Please enter your login!");
		document.singUp.focus();
		return false;
	}

	
	return (true);
}


$(document).on("click.bs.dropdown.data-api", ".noclose", function (e) { e.stopPropagation() });
