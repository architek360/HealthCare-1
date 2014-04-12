<html>
<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%




%>
<head>
	<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<%@include file="header.jsp"%>

	<br>
	<br>
	<div id='addStuff'>
		<h3>Add new offerings:</h3>
		<form method='POST' action='updateofferings.jsp' id='addoffering'>
			Plan id: <input type='text' name='plan'><br>
			Price: <input type='text' name='price' placeholder='500'><br>
			Deductible: <input type='text' name='deductible' placeholder='1000'><br>
			<br>
			<h4>Discounts for months:</h4>
			Discount: <input type='text' name='discount' placeholder='100'><br>
			Months: <input type='text' name='months' placeholder='12'><br>
			<br>	
			<input type='submit' id='newoffering' value='Add' name='add'>
		</form>
	</div>
	<%@ include file="incTail.jsp"%>
</body>
</html>
