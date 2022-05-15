
	    $(document).ready(function() {
	    	var formState = "";
	    	var table = $('#dataTable').DataTable();
	    	
	    	
	    	function clearError() {
	    		$("#errorbox").hide();
	    		$("#error_payment").text("");
	    	}
	    	
	    	function setError(msg) {
    			$("#errorbox").show();
    			$("#error_payment").text(msg);
	    	}
	    	
	    	function fnValidation(saveObj) { 
	    		clearError();
	    	
	    		if(!saveObj.fname.length > 0) {
	    			setError("Please enter first name!")
	    			return false;
	    		} else if(!saveObj.dnic.length > 0) {
	    			setError("Please enter NIC!")
	    			return false;
	    		}else if(saveObj.nic.length != 10) {
	 	    		setError("NIC length should be 10. Please enter valid NIC!")
	 	    		return false;
	    		} else if(!saveObj.amount.length > 0) {
	    			setError("Please enter amount!")
	    			return false;
	    		}else if (saveObj.date == ""){
	    			setError("Please enter Date!")
	    			return false;
	    		}else if(!saveObj.bname.length > 0) {
	    			setError("Please enter bank name!")
	    			return false;
	    		} else if(!saveObj.dcard.length > 0) {
	    			setError("Please enter debit card number !")
	    			return false;
	    		} else if(!saveObj.dcard.length != 16) {
	    			setError("Debit card number should be 16. Please enter valid debit card number!")
	    			return false;
	    		} else if(!saveObj.otp.length > 0) {
	    			setError("Please enter OTP number!")
	    			return false;
	    		} else if(!saveObj.otp.length != 4) {
	    			setError("OTP number should be 4. Please enter valid otp number!")
	    			return false;
	    		
	    		}
	    		
	    		return true;
	    	}
	    	
		    $("#btninsert").click(function() {
		    	clearError();
		    	formState = "NE";
		    	
		    	$('#id').val(""),
				$('#fname').val(""),
		        $('#nic').val(""),
				$('#amount').val(""),
				$('#date').val(""),
				$('#bname').val(""),
		        $('#dcard').val(""),
				$('#otp').val(""),
				
				
				$("#paymentForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New Payment Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objPayment = {
		    				id: $('#id').val(),
		    				fname: $('#fname').val(),
		    				nic:$('#nic').val(),
							amount:$('#amount').val(),
							date:$('#date').val(),
							bname:$('#bname').val(),
			        		dcard:$('#dcard').val(),
							otp:$('#otp').val(),
		    		}
		    	if(fnValidation(objPayment)) {
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/paf/PaymentDetails?action=NE',
		     	        method   : 'POST', 
		     	        data     : objPayment,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    }
		    	else if(formState == "UP") {
		    		$("#loader").show();
		    		var objPayment = {
		    				id: $('#id').val(),
		    				fname: $('#fname').val(),
		    				nic:$('#nic').val(),
							amount:$('#amount').val(),
							date:$('#date').val(),
							bname:$('#bname').val(),
			        		dcard:$('#dcard').val(),
							otp:$('#otp').val(),
		    		}
		    		
		    	if(fnValidation(objPayment)) {
		    		$("#loader").show();
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/paf/PaymentDetails?action=UP',
		     	        method   : 'POST', 
		     	        data     : objPayment,
		     	        success  : function(response){
		     	        	formState = "";	     	        	
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	}
		    	else if(formState == "DL") {
		    		$("#loader").show();
		    		var objPayment = {
		    				id: $('#id').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/paf/PaymentDetails?action=DL',
		     	        method   : 'POST', 
		     	        data     : objPayment,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btnupdate', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		       
		        $('#id').val(data[0]),
				$('#fname').val(data[1]),
				$('#nic').val(data[2]),
				$('#amount').val(data[3]),
				$('#date').val(data[4]),
				$('#bname').val(data[5]),
				$('#dcard').val(data[6]),
				$('#otp').val(data[7]),
				
				
				$("#paymentForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update Payment Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        
		        $('#id').val(data[0]),
				$('#fname').val(data[1]),
				$('#nic').val(data[2]),
				$('#amount').val(data[3]),
				$('#date').val(data[4]),
				$('#bname').val(data[5]),
				$('#dcard').val(data[6]),
				$('#otp').val(data[7]),
				
				$("#paymentForm :input").prop("disabled", true);
				$("#btnAddAndUpdateModal").prop("disabled", false);
				
		    	formState = "DL";
		    	$('#btnAddAndUpdateModal').html('Delete Payment');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
	    });
