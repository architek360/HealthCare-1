<%@include file="sqlBasic.jsp"%>
<%  
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String btn= request.getParameter("type");
	String nxt = "";	

	if("cust".equals(btn)){
		String sqlqueryCommand = "SELECT * from subscriber where login='" + username + "' and password='" + password + "'";
    		Statement stmt = con.createStatement();
	 	ResultSet results = stmt.executeQuery(sqlqueryCommand);

		if(username != "" && password != ""){
			while(results.next()){
				nxt = results.getString("password");	
				if(nxt.equals(password)){
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					response.sendRedirect("customer.jsp");
					return;
				}
			}
		}else{
			msg="Please fill in all fields";
			session.setAttribute("msg", msg);
			response.sendRedirect("error.jsp");
			return;
		}	
    	}else if ("comp".equals(btn)){
		String sqlqueryCommand = "select * from company where login='" + username +"' and password='" + password + "'";
    		Statement stmt = con.createStatement();
 		ResultSet results = stmt.executeQuery(sqlqueryCommand);
		
		if(username != "" && password != ""){
			while(results.next()){
				nxt = results.getString("password");
				if(nxt.equals(password)){
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					response.sendRedirect("company.jsp");
					return;
				}
			}
		}else {
			msg="Please fill in all fields";
			session.setAttribute("msg", msg);
			response.sendRedirect("error.jsp");
			return;
		}
	}else {
		msg="Please choose 'company' or 'customer'";
		session.setAttribute("msg", msg);
		response.sendRedirect("error.jsp");
		return;
	}
	
	msg="An error occured, please check your username and password";
	session.setAttribute("msg", msg);
	response.sendRedirect("error.jsp");
%>
