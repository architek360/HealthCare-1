<html>

<head>

<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
	ENTER YOUR INFO:
	<br>
	<br>
	<br>

	<div id="register">	
	<form method='POST' action='savereg.jsp' id='cusreg'>
		Name:<input type='text' name='name' placeholder='Joe Jones'></br>
		Address:<input type='text' name='address' placeholder='123 Campus Rd'></br>
		City:<input type='text' name='city' placeholder='Brooklyn'></br>
		State:<input type='text' name='state' maxlength='2' placeholder='NY'></br>
		Zip:<input type='text' name='zip' placeholder='11231'></br>
		Email:<input type='text' name='email' placeholder='joe@gmail.com'></br>
		Login:<input type='text' name='user'></br>
		Password:<input type='password' name='pass'></br>
	
		<br>
		<input type='submit' value='Register'/>
	</form>
	</div>

	<%@ include file="incTail.jsp"%>
</body>
</html>
