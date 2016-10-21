<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="customerHeader.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#etpdatetimepicker').datetimepicker();
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#itpdatetimepicker').datetimepicker();
	});
</script>

<script>	
function validateEmailPhone(){
		
		console.log("valdate");
		
		var amount = document.getElementById("eptpinputAmount").value;
		console.log(amount);
		
		var mode = $("#eptpModeOfTransfer").val();
		var modeValue = $("#eptpinputMode").val();
		var payer = $("#eptpselectPayerAccount").val();
		
		var validInput = true;
		//validate Amount
		if (isNaN(amount) || amount < 0){  
		  /* document.getElementById("etpinputAmount").placeholder="Enter Numeric value only";  
 */		  $("#eptpinputAmount").val('');
		  $("#eptpinputAmount").attr("placeholder","Enter valid Amount");
		  console.log("error");
		  validInput = false;  
		}
		
		if(mode == "Select Mode of Transfer"){
			$("#eptpModeOfTransfer").val('Select Mode of Transfer');
			validInput = false;
		}
		
		if(modeValue == ""){
			$("#eptpinputMode").val('');
			$("#eptpinputMode").attr("placeholder","Enter Payee's Email/Phone");
			validInput = false;
		}
		
		if(payer == "Select Account"){
			$("#eptpselectPayerAccount").val('Select Account');
			validInput = false;
		}
		
		return validInput;
		}

	
 	function validate(){  
		var amount = document.getElementById("etpinputAmount").value;
		var payer = $("#etpselectPayerAccount").val();
		var payee = $("#etpselectPayeeAccount").val();
		
		var validInput = true;
		if (isNaN(amount) || amount < 0){  
		  $("#etpinputAmount").val('');
		  $("#etpinputAmount").attr("placeholder","Enter valid Amount");
		  console.log("error");
		  validInput = false;  
		}
		
		if(payer == "Select Account"){
			$("#etpselectPayerAccount").val('Select Account');
			validInput = false;
		}
		
		if(payee == "Select Payee"){
			$("#etpselectPayeeAccount").val('Select Payee');
			validInput = false;
		}
		
		return validInput;
		
	} 
	
	
		
	
	function validateInternal(){  
		var amount = document.getElementById("itpinputAmount").value;
		var payer = $("#itpselectPayerAccount").val();
		var payee = $("#itpselectPayeeAccount").val();
		
		var validInput = true;
		if (isNaN(amount) || amount < 0){  
		  /* document.getElementById("etpinputAmount").placeholder="Enter Numeric value only";  
 */		  $("#itpinputAmount").val('');
		  $("#itpinputAmount").attr("placeholder","Enter valid Amount");
		  console.log("error");
		  validInput = false;  
		} 
		
		if(payer == "Select Account"){
			$("#itpselectPayerAccount").val('Select Account');
			validInput = false;
		}
		
		if(payee == "Select Account"){
			$("#itpselectPayeeAccount").val('Select Account');
			validInput = false;
		}
		
		if(payer == payee){
			
			$("#itpselectPayerAccount").val('Select Account');
			$("#itpselectPayeeAccount").val('Select Account');
			validInput = false;
		}
		return validInput;
	}
</script>
<script type="text/javascript">
	$(function() {
		$('#eptpdatetimepicker').datetimepicker();
	});
</script>


<div class="content-wrapper">
	<div class="col-md-12" id="tfrfundsPageContent">
		<div class="container" id="chooseTransferMethodContainer"
			style="display: none;">


			<form class="form-horizontal" >

				<fieldset>
					<div class="form-group">
						<div class="col-lg-12">
							<h2>Choose Method of Transfer</h2>
							<a href="#" class="btn btn-success btn-lg" id="extTfrBtn">External
								Transfer</a> <a href="#" class="btn btn-success btn-lg"
								id="intTfrBtn">Internal Transfer</a> <a href="#"
								class="btn btn-success btn-lg" id="emailphoneTfrBtn">Email/Phone
								Transfer</a>
						</div>
					</div>
				</fieldset>
			</form>

		</div>

		<div class="panel panel-primary" id="externaltransferpanel"
			style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">Transfer Money - Someone's Account</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" action="ExternalTransfer"
					method='POST' onsubmit="return validate()">
					<fieldset>
						<div class="form-group">
							<label for="etpselectPayeeAccount" class="col-lg-2 control-label">Transfer
								To : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="etpselectPayeeAccount" name="etpselectPayeeAccount">
									<option>Select Payee</option>
									<c:forEach items="${payeeAccounts}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="etpselectPayerAccount" class="col-lg-2 control-label">Transfer
								From : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="etpselectPayerAccount"
									name="etpselectPayerAccount">
									<option>Select Account</option>
									<c:forEach items="${userAccounts}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="etpinputAmount" class="col-lg-2 control-label">Amount
								: </label>
							<div class="col-lg-5 input-group">
								<input type="text" class="form-control" id="etpinputAmount"
									name="etpinputAmount" placeholder="Enter Amount">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="etpdatetimepicker" class="col-lg-2 control-label">Date
								: </label>
							<div id="etpdatetimepicker" class="col-lg-5 input-group date">
								<input data-format="MM/dd/yyyy HH:mm:ss PP" type="text"
									id="etpdatetimepicker_result" class="form-control"
									name="etpdatetimepicker_result"></input> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
 -->
						<div class="form-group">
							<label for="textArea" class="col-lg-2 control-label">Description
								: </label>
							<div class="col-lg-5 input-group">
								<textarea class="form-control" rows="3" id="etpTextArea"
									name="etpTextArea"
									placeholder="Enter a short desription for this transaction"></textarea>
								<span class="help-block"> </span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-2 control-label"></label>
							<div class="col-lg-5 input-group">
								<button type="submit" class="btn btn-primary" >Submit</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

		<div class="panel panel-primary" id="internaltransferpanel"
			style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">Transfer Money - Within Account</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" action="InternalTransfer"
					method='POST'onsubmit="return validateInternal()">
					<fieldset>
						<div class="form-group">
							<label for="itpselectPayeeAccount" class="col-lg-2 control-label">Transfer
								To : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="itpselectPayeeAccount" name="itpselectPayeeAccount">
									<option>Select Account</option>
									<c:forEach items="${userAccounts}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="itpselectPayerAccount" class="col-lg-2 control-label">Transfer
								From : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="itpselectPayerAccount" name="itpselectPayerAccount">
									<option>Select Account</option>
									<c:forEach items="${userAccounts}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="itpinputAmount" class="col-lg-2 control-label">Amount
								: </label>
							<div class="col-lg-5 input-group">
								<input type="text" class="form-control" id="itpinputAmount" name="itpinputAmount"
									placeholder="Enter Amount">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="itpdatetimepicker" class="col-lg-2 control-label">Date
								: </label>
							<div id="itpdatetimepicker" class="col-lg-5 input-group date">
								<input data-format="MM/dd/yyyy HH:mm:ss PP" type="text"
									id="itpdatetimepicker_result" class="form-control"></input> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div> -->
						<div class="form-group">
							<label for="textArea" class="col-lg-2 control-label">Description
								: </label>
							<div class="col-lg-5 input-group">
								<textarea class="form-control" rows="3" id="itpTextArea"
									name="itpTextArea"
									placeholder="Enter a short desription for this transaction"></textarea>
								<span class="help-block"> </span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label"></label>
							<div class="col-lg-5 input-group">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

		<div class="panel panel-primary" id="emailphonetransferpanel"
			style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">Email/Phone Transfer</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal"  onsubmit="return validateEmailPhone()"   action="EmailPhoneTransfer" 
					method="POST" >
					<fieldset>
						<div class="form-group">
							<label for="eptpModeOfTransfer" class="col-lg-2 control-label">Transfer
								Via : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="eptpModeOfTransfer"
									name="eptpModeOfTransfer">
									<option>Select Mode of Transfer</option>
									<option>Email</option>
									<option>Phone</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="eptpinputMode" class="col-lg-2 control-label">Transfer
								To : </label>
							<div class="col-lg-5 input-group">
								<input type="text" class="form-control" id="eptpinputMode"
									name="eptpinputMode" placeholder="Enter Payee's Email/Phone">
							</div>
						</div>
						<div class="form-group">
							<label for="eptpselectPayerAccount"
								class="col-lg-2 control-label">Transfer From : </label>
							<div class="col-lg-5 input-group">
								<select class="form-control" id="eptpselectPayerAccount"
									name="eptpselectPayerAccount">
									<option>Select Account</option>
									<c:forEach items="${userAccounts}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="eptpinputAmount" class="col-lg-2 control-label">Amount
								: </label>
							<div class="col-lg-5 input-group">
								<input type="text" class="form-control" id="eptpinputAmount"
									name="eptpinputAmount" placeholder="Enter Amount">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="eptpdatetimepicker" class="col-lg-2 control-label">Date
								: </label>
							<div id="eptpdatetimepicker" class="col-lg-5 input-group date">
								<input data-format="MM/dd/yyyy HH:mm:ss PP" type="text"
									id="eptpdatetimepicker_result" class="form-control"></input> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div> -->
						<div class="form-group">
							<label for="textArea" class="col-lg-2 control-label">Description
								: </label>
							<div class="col-lg-5 input-group">
								<textarea class="form-control" rows="3" id="eptpTextArea"
									name="eptpTextArea"
									placeholder="Enter a short desription for this transaction"></textarea>
								<span class="help-block"> </span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"></label>
							<div class="col-lg-5 input-group">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>

	</div>
</div>
<!-- .content-wrapper -->

<script src="<c:url value="/resources/js/transferfunds.js" />"></script>
<script type="text/javascript">
	$(document).ready(function() {
		sideNavigationSettings();
	});
</script>

</body>
</html>