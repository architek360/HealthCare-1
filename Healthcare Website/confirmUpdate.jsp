<html>
<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	btn= request.getParameter("type");
	String payment = request.getParameter("pay");
	String months = request.getParameter("mon");

	String sqlqueryCommand = "update subscription set offering_id='" + btn + "' where subscriber_id = (select subscriber_id from subscriber where login='" + username + "')";
	String payQuery = "update subscription set paid=" + payment + " where subscriber_id = (select subscriber_id from subscriber where login='" + username + "')";
	String monthQuery = "update subscription set months=" + months + " where subscriber_id = (select subscriber_id from subscriber where login='" + username + "')";


	if(btn == null || payment.equals("") || months.equals("")){
		msg = "Make sure you have choosen a new plan, payment, and months to subscirbe";
		session.setAttribute("msg", msg);
		response.sendRedirect("error.jsp");
		return;
	}	

	
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sqlqueryCommand);

	Statement stm = con.createStatement();
	stm.executeUpdate(payQuery);
	
	Statement s = con.createStatement();
	s.executeUpdate(monthQuery);
%>
<head>
	<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<%@include file="header.jsp"%>
	<h3>You are now subscribed for <span style="color:green;"><%=months%></span> months<br>
	You have paid <span style="color:green;">$<%=payment%></span><br>
	Your current offering has been successfully been updated to offering <span style="color:green;"> #<%=btn%></span>
	</h3>
	<a href="customer.jsp">Home</a>
	<%@ include file="incTail.jsp"%>
</body>
</html>
