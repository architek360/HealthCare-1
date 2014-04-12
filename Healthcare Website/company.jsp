<html>
<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String count = "0", name = "", address = "", city = "", state = "", zip = "";
	String subId = "", sName = "", sAddress = "", sCity = "", sState = "", sZip = "", sEmail = "";
	String resultHTML = "";
		
	String sqlCommand = "SELECT * from company where login= '" + username + "'" ;
	String countSubQuery = "select count(*) from subscription where offering_id  = any (select offering_id from offering where company_id = (select company_id from company where login='" + username + "'))";
	String subQuery = "select * from subscriber where subscriber_id = any (select subscriber_id from subscription where offering_id = any (select offering_id from offering where company_id = (select company_id from company where login='" + username + "')))";

	Statement st = con.createStatement();
	ResultSet results = st.executeQuery(sqlCommand);
	while (results.next()) {
		name = results.getString("name");
		address = results.getString("street_address");
		city = results.getString("city");
		state = results.getString("state");
		zip = results.getString("zip");
	}
	
	Statement stmt = con.createStatement();
	ResultSet r = stmt.executeQuery(countSubQuery);
	while(r.next()){
		count = r.getString("count(*)");
	}	


	Statement s = con.createStatement();
	ResultSet res = s.executeQuery(subQuery);
	while(res.next()){
		subId = res.getString("subscriber_id");
		sName = res.getString("name");
		sAddress = res.getString("street_address");
		sCity = res.getString("city");
		sState = res.getString("state");
		sZip = res.getString("zip");
		sEmail = res.getString("email");
		resultHTML += "<ul><span id='htm'>Subscriber Id:</span> " + subId + "<br><span id='htm'>Name:</span> " + sName+ "<br><span id='htm'>Address:</span> " + sAddress + ", " + sCity + ", " + sState + ", " + sZip + "<br><span id='htm'>Email:</span> " + sEmail + "</ul>";	
	}

%>
<head>

<link rel="stylesheet" href="stylesheet.css">


</head>
<body>
	<%@include file="header.jsp"%>
	<h2>Welcome:<span style="color:green"> <%=username%></span></h2>

	<h4>This is your info:</h4>
	<table>
		<tr>
			<li><%=name%><br></li>
			<li><%=address%> <%=city%>, <%=state%>, <%=zip%></li>
			<li>You have <%=count%> subscriber(s)</li>
		</tr>
	</table>
	<br>


	<h4>Here are your current subscibers:</h4>
	<table>
		<tr>
<%=resultHTML%>
	
		</tr>
	</table>
	<br>
	
	<a href="offerings.jsp">Make Offerings</a>
	
	<%@ include file="incTail.jsp"%>
</body>
</html>
