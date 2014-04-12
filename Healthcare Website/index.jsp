<html>
<head>

<link rel="stylesheet" href="stylesheet.css">
<script type="text/javascript" src='javascript.js'></script>

</br>
</head>

<body>

	<div style="color:blue;text-align:center"><font size="50">Welcome To The HealthCare Site</font></div>

	<br>
	<br>
	
	<div id='login'>
	<form method='POST' action='login.jsp' id='theMainForm'>
		<input type="radio" id="cust" name="type" value="cust">Customer
		<input type="radio" id="comp" name="type" value="comp">Company<br>
		Username:<input type='text' name='username'></br>
		Password:<input type='password' name='password'></br>
		<input type='submit' value='Sign In'/>
		<a href="corc.jsp">Register</a><br>
	</form>
	</div>

	<%@ include file="incTail.jsp"%>
</body>
</html>
