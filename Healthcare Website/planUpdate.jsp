<%@include file="sqlBasic.jsp"%>
<%
	String planName = request.getParameter("pname");
	String cond = request.getParameter("covered");

	String planqueryCommand = "insert into plan (name) values('" + planName + "')";
	String condqueryCommand = "insert into coverage(plan_id, symptom) values((select plan_id from plan where name='" + planName + "'), '" + cond + "')";

	if(planName.equals("")){
		msg = "Enter a plan name";
		session.setAttribute("msg", msg);
		response.sendRedirect("error.jsp");
		return;		
	}
	
	Statement stmt =  con.createStatement();	
	stmt.executeUpdate(planqueryCommand);

	Statement s =  con.createStatement();	
	s.executeUpdate(condqueryCommand);

	response.sendRedirect("offerings.jsp");	
%>
