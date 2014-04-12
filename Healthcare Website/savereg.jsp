<%@include file="incBasic.jsp"%>
<%@include file="sqlBasic.jsp"%>
<%
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String city=request.getParameter("city");
	String state=request.getParameter("state");
	String zip=request.getParameter("zip");
	String email=request.getParameter("email");
	String login=request.getParameter("user");
	String pass=request.getParameter("pass");

	String ref="http://host:port/health/";
	String refText=request.getHeader("referer");

	String sqlqueryCommand="";	
	String testSqlqueryCommand="";
	String nxt="";

	if(refText.equals(ref + "cusreg.jsp")){
		testSqlqueryCommand="select * from subscriber where login='" + login + "'";
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(testSqlqueryCommand);

		while(results.next()){
			nxt = results.getString("login");
			if(nxt.equals(login)){
				msg="Login already taken";
				session.setAttribute("msg",msg);
				response.sendRedirect("error.jsp");
				return;
			}
		}

		sqlqueryCommand="insert into subscriber(name, street_address, city, state, zip, email, login, password) values('" + name + "','" + address + "','" + city + "','" + state + "','" + zip + "','" + email + "','" + login + "','" + pass + "')";

		if(name == "" || address == "" || city == "" || email == "" || state == "" || zip == "" || login == "" || pass == ""){
			msg="Please fill in all fields";
			session.setAttribute("msg",msg);
			response.sendRedirect("error.jsp");
		}else{
			stmt.executeUpdate(sqlqueryCommand);
			response.sendRedirect("index.jsp");
		}

	}else if(refText.equals(ref + "comreg.jsp")){
		testSqlqueryCommand="select * from company where login='" + login + "'";
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(testSqlqueryCommand);

		while(results.next()){
			nxt = results.getString("login");
			if(nxt.equals(login)){
				msg="Login already taken";
				session.setAttribute("msg",msg);
				response.sendRedirect("error.jsp");
				return;
			}
		}
		
		sqlqueryCommand="insert into company(name, street_address, city, state, zip, login, password) values('" + name + "','" + address + "','" + city + "','" + state + "','" + zip + "','" + login + "','" + pass + "')";

		if(name == "" || address == "" || city == "" || state == "" || zip == "" || login == "" || pass == ""){
			msg="Please fill in all fields";
			session.setAttribute("msg",msg);
			response.sendRedirect("error.jsp");
		}else{
			stmt.executeUpdate(sqlqueryCommand);
			response.sendRedirect("index.jsp");
		}
	}
%>
