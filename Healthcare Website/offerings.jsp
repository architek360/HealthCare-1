<html>
<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String currPlan = "";
	String planqueryCommand = "select offering_id from subscription join subscriber using(subscriber_id) where login ='" + username +"'";

	String sqlqueryCommand = "select * from offering join plan using(plan_id) join coverage using(plan_id)";
	String pQueryCommand = "select * from plan join coverage using(plan_id)";

	String resultHTML = "";
	String planHTML = "";

	Statement s = con.createStatement();
	ResultSet r = s.executeQuery(pQueryCommand);
	while(r.next()){
		String symp = r.getString("symptom");
		String planName = r.getString("name");
		String pId = r.getString("plan_id");

		planHTML += "Plan Id = " + pId + "<br> Plan Name: " + planName + "<br>Symptoms Covered: " + symp + "<br><br>";
	}
	planHTML = "<div id='table1'><ul>\n" + planHTML + "</ul></div>\n";

	int x = 0;	
	Statement stmt = con.createStatement();
	ResultSet results = stmt.executeQuery(sqlqueryCommand);
	while(results.next()){
		String price = results.getString("price");
		String symptom = results.getString("symptom");
		String deductible = results.getString("deductible");
		String planId = results.getString("plan_id");
		String offeringId = results.getString("offering_id");
	
		x = Integer.parseInt(offeringId);

		System.out.println(price + " " + deductible + " " + offeringId + " " + symptom);
		resultHTML += "Offering Number: " + offeringId + "<br>Plan id: " + planId + "<br>Symptoms: " + symptom + "<br>Price: $" + price + "<br>Deductible: $" + deductible + " " + "<br><br>";	
	}
	resultHTML = "<div id='table2'><ul>\n" + resultHTML + "</ul></div>\n";

	Statement stm = con.createStatement();
	ResultSet result = stm.executeQuery(planqueryCommand);
	while (result.next()){
		currPlan = result.getString("offering_id");
	}
%>
<head>
	<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<%@include file="header.jsp"%>
	<div id='plans'>	
		<h3>Current Plans available:</h3>
		<%=planHTML%>

		<form method='POST' action='addNewPlan.jsp' id='addnewplan'>
			<input type='submit' id='add' value='Add New Plan' name='add'>
		</form>
	</div>

	<div id='offerings'>
		<h3>Current Offerings avaiable:</h3>
		<%=resultHTML%>

		<form method='POST' action='addNewOffering.jsp' id='addnewoffering'>
			<input type='submit' id='add' value='Add New Offering' name='add'>
		</form>
	</div>

	<%@ include file="incTail.jsp"%>
</body>
</html>

