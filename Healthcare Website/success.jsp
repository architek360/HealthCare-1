<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zip");
    String email = request.getParameter("email");
	String user = request.getParameter("user"); 
    String pass = request.getParameter("pass");


	String driverWasLoaded = "com.mysql.jdbc.Driver";
		if (application.getAttribute(driverWasLoaded)==null) {
			System.err.println("LOADING jdbc driver ");
               try {com.mysql.jdbc.Driver d = new com.mysql.jdbc.Driver();} catch(Exception e){
                       System.err.println("OUCH!!\n"+e.toString());
               }
               application.setAttribute(driverWasLoaded,driverWasLoaded);
              System.err.println("LOADED: JDBC driver ");
      }
	
	int sqlport = port#;
//	String url = "jdbc:mysql://localhost:port/path";
//  String user = "username";
//	String pswd = "password";
	
    String sqlqueryCommand = "INSERT INTO subscriber(name,street_address,city,state,zip,email,login,password)  values(" + "\"" name"\"" + "," + "\""address"\"" + "," + "\""city"\"" + "," + "\""state"\"" + "," + "\""zip"\"" + "," + "\""email"\"" + "," + "\""user"\"" + "," + "\""pass"\"" + ");";
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:port/path", "username", "password");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate(sqlqueryCommand);
%>



<html>
<head>

<link rel="stylesheet" href="stylesheet.css">
</head>

	<body>
	
		Welcome <%=user%>
	
	</body>
</html>
%/
