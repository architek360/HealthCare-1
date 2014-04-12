function mainLogin(){
	if(document.getElementById('cust').checked){

	}else if(document.getElmentById('comp').checked){

	}else("ERROR");
}

function corc(){
	var radio_check_val = "";

	if(document.getElementById('cust').checked){
		radio_check_val = document.getElementById('cust').value;
		return radio_check_val;
	}else if(document.getElmentById('comp').checked){
		radio_check_val = document.getElementById('comp').value;
		return radio_check_val;
	}

	if(radio_check_val === ""){
		alert("PLEASE CHOOSE CUSTOMER OR COMPANY");	
	}
}

