<%@page import="java.sql.*,java.util.*"%>
<%
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
	String url = "jdbc:mysql://localhost:port/path";
    String user = "username";
	String pswd = "password";

	Connection con = DriverManager.getConnection(url, user, pswd);

	String msg="";
%>
