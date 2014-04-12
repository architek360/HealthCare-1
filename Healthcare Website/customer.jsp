<html>
<%@include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String name="", address="", city="", state="", zip="";
	String currPlan = "";
	String currPaid = "";
	String months = "";

	String sqlCommand = "SELECT * from subscriber where login= '" + username + "'" ;
	String planqueryCommand = "select offering_id from subscription join subscriber using(subscriber_id) where login ='" + username +"'";
	String payQueryCommand = "select * from subscription where subscriber_id = (select subscriber_id from subscriber where login='" + username + "')";
	
	Statement stmt = con.createStatement();
	ResultSet results = stmt.executeQuery(sqlCommand);

	while (results.next()) {
		name = results.getString("name");
		address = results.getString("street_address");
		city = results.getString("city");
		state = results.getString("state");
		zip = results.getString("zip");
	}

	Statement s = con.createStatement();
	ResultSet r = s.executeQuery(payQueryCommand);
	while(r.next()){
		currPaid = r.getString("paid");
		months = r.getString("months");
	}

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
	<h2>Welcome:<span style="color:green"> <%=username%></span></h2>
	<h3>This is your info:</h3>
	<table>
		<tr>
			<li><%=name%><br></li>
			<li><%=address%>, <%=city%>, <%=state%>, <%=zip%></li>
		</tr>
	</table>
	<h3>Your current Plan:</h3>
	You are currently using offering number <%=currPlan%><br>
	You have currently paid $<%=currPaid%><br>
	You are subscribed for <%=months%> months<br><br>
	<br>
	<a href="update.jsp">Update info</a>
	
	<%@ include file="incTail.jsp"%>
</body>
</html>
