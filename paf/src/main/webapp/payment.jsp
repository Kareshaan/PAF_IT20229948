<%@page import="model.PaymentDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.PaymentDetailsServiceImpl"%>
<%@page import="service.IPaymentDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Details</title>
</head>
<body>
	<jsp:include page="/index.jsp"></jsp:include>

	<%
	IPaymentDetailsService paymentService = new PaymentDetailsServiceImpl();
			ArrayList<PaymentDetails> paymentList = paymentService.getPaymentDetails();
	%>

	<div class="container-fluid ml-2 mr-2">
		<div class="row mt-5">
			<div class="col-md-12 w-100">
				<div class="card text-dark bg-light w-100 h-100">
					<div class="card-header">
						<div class="row">
							<div class="col-md-5">
								<button type="button" id="btninsert" class="btn btn-primary">Add Payment</button>
								
							</div>
							
							<div class="col-md-5">
								<button type="search" id="btninsert" class="btn btn-primary">search</button>
								<input type="date" class="" placeholder="" aria-controls="dataTable">
								
							</div>
							<div class="col-md-7">
								<h5 class="card-title mt-1 fw-bold ml-5">Payment Details</h5>
							</div>
							
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>FullName</th>
										<th>NIC</th>
										<th>Amount</th>
										<th>Date</th>
										<th>BankName</th>
										<th>DebitCard</th>
										<th>OTP</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>FullName</th>
										<th>NIC</th>
										<th>Amount</th>
										<th>Date</th>
										<th>BankName</th>
										<th>DebitCard</th>
										<th>OTP</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									for(PaymentDetails payment : paymentList){
									%>
									<tr>
										<td class="payment text-uppercase"><%= payment.getId() %></td>
										<td class="text-uppercase"><%= payment.getFname() %></td>
										<td class="text-uppercase"><%= payment.getNic() %></td>
										<td class="text-uppercase"><%= payment.getAmount() %></td>
										<td class="text-uppercase"><%= payment.getDate() %></td>
										<td class="text-uppercase"><%= payment.getBname() %></td>
										<td class="text-uppercase"><%= payment.getDcard() %></td>
										<td class="text-uppercase"><%= payment.getOtp() %></td>
										<td>
											
											<button type="button"
												class="btnupdate btn btn-success btn-circle">
												<i class="fas fa-edit"></i>
											</button>
											<button type="button"
												class="btndelete btn btn-danger btn-circle">
												<i class="fas fa-trash"></i>
											</button>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--insert-->
	<div class="modal fade bd-example-modal-lg" id="addAndUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Payment Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="alert alert-warning" role="alert" id="errorbox">
  							<span class="fw-bold" id="error_payment"></span>
						</div>
						<form id="paymentForm">
							<input type="text" id="id" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="fname" class="form-label">payment First Name</label> <input
										type="text" class="form-control text-uppercase" id="fname"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="nic" class="form-label">NIC</label> <input
										type="text" class="form-control text-uppercase" id="nic"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="amount" class="form-label">Amount</label> <input
										type="text" class="form-control text-uppercase" id="amount" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="date" class="form-label">Date</label> <input
										type="date" class="form-control text-uppercase" id="date" 
										required pattern="\d{4}-\d{2}-\d{2}">
								</div>
							</div>
							
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="bname" class="form-label">Bank Name</label> <input
										type="text" class="form-control text-uppercase" id="bname" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="dcard" class="form-label">Debit Card Number</label> <input
										type="text" class="form-control text-uppercase" id="dcard" 
										required pattern="\d{4}-\d{4}-\d{4}-\d{4}">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="otp" class="form-label">OTP</label> <input
										type="text" class="form-control text-uppercase" id="otp" 
										required pattern="\d{4}">
								</div>
							</div>
							<div class="row mt-5 mb-2">
								<div class="col-md-12 d-flex justify-content-center">
									<button type="button" class="btn btn-success w-100"
										id="btnAddAndUpdateModal"></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--update-->
		<div class="modal fade bd-example-modal-lg" id="addAndUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Payment Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="alert alert-warning" role="alert" id="errorbox">
  							<span class="fw-bold" id="error_payment"></span>
						</div>
						<form id="paymentForm">
							<input type="text" id="id" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="fname" class="form-label"> First Name</label> <input
										type="text" class="form-control text-uppercase" id="fname"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="nic" class="form-label">NIC</label> <input
										type="text" class="form-control text-uppercase" id="nic"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="amount" class="form-label">Amount</label> <input
										type="text" class="form-control text-uppercase" id="amount" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="date" class="form-label">Date</label> <input
										type="date" class="form-control text-uppercase" id="date" 
										required pattern="\d{4}-\d{2}-\d{2}">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="bname" class="form-label">Bank Name</label> <input
										type="text" class="form-control text-uppercase" id="bname" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="dcard" class="form-label">Debit Card number</label> <input
										type="text" class="form-control text-uppercase" id="dcard" 
										required pattern="\d{4}-\d{4}-\d{4}-\d{4}">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="otp" class="form-label">OTP</label> <input
										type="text" class="form-control text-uppercase" id="otp" 
										required>
								</div>
							</div>
							<div class="row mt-5 mb-2">
								<div class="col-md-12 d-flex justify-content-center">
									<button type="button" class="btn btn-success w-100"
										id="btnAddAndUpdateModal"></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	


	<script type="text/javascript">
    
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
	    
    </script>

</body>
</html>