<html>
<%@include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String sqlqueryCommand = "select * from offering join plan using(plan_id) join coverage using(plan_id)";
	String resultHTML = "";

	Statement stmt = con.createStatement();
	ResultSet results = stmt.executeQuery(sqlqueryCommand);

	int x = 0;
	while(results.next()){
		String price = results.getString("price");
		String deductible = results.getString("deductible");
		String offeringId = results.getString("offering_id");
		String symptom = results.getString("symptom");
	
		x = Integer.parseInt(offeringId);

		System.out.println(price + " " + deductible + " " + offeringId + " " + symptom);
		resultHTML += "<input type='radio' id='" + x + "' value='" + x + "' name='type'> Offering Number: " + offeringId + "<br>Symptoms: " + symptom + "<br>Price: $" + price + "<br>Deductible: $" + deductible + " " + "<br><br>";	
	}
	resultHTML = "<div id='table2'>Amount to Pay: <input type='text' name='pay'><br>Amout of months to subscribe: <input type='text' name='mon'><ul>\n" + resultHTML + "</ul></div>\n";

%>
<head>
	<link rel="stylesheet" href="stylesheet.css">
</head>

<body>
<%@include file="header.jsp"%>
	<br>
	<br>
	<div id="offerings">
		<form method='POST' action='confirmUpdate.jsp' id='updatebtn'>
			<%=resultHTML%>
			<input type='submit' value='Update'/>
		</form>
	</div>
		
	<%@ include file="incTail.jsp"%>
</body>
</html>
