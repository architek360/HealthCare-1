<html>
<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<head>
	<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<%@include file="header.jsp"%>
	
	<br>
	<br>
	
	<div id='addStuff'>
		<h3>Add a New Plan:</h3>
		<form method='POST' action='planUpdate.jsp'>
			Plan Name: <input type='text' id='pname' name='pname'><br>
			Conditions Covered: <input type='text' id='cCovered' name='covered'><br>
			<input type='submit' value='Update'>
		</form>
	</div>
	
	<%@ include file="incTail.jsp"%>
</body>
</html>

