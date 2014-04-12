<%@ include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String plan = request.getParameter("plan");
	String price = request.getParameter("price");
	String ded = request.getParameter("deductible");
	String dis = request.getParameter("discount");
	String months = request.getParameter("months");
	

	if (plan.equals("") || price.equals("") || ded.equals("") || dis.equals("") || months.equals("")){
		msg = "Please fill in all the fileds";
		session.setAttribute("msg", msg);
		response.sendRedirect("error.jsp");
		return;
	}
	
	String ofQueryCommand = "insert into offering (plan_id, company_id, price, deductible) values(" + plan + ", (select company_id from company where login='" + username + "')," + price + "," + ded + ")";

	String disQueryCommand = "insert into discount (offering_id, discount, month) values((select max(offering_id) from offering)," + dis + "," + months + ")";

	Statement stmt = con.createStatement();
	stmt.executeUpdate(ofQueryCommand);
	
	Statement s = con.createStatement();
	s.executeUpdate(disQueryCommand);
	
	response.sendRedirect("offerings.jsp");

%>
